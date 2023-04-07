// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/amenitiesController/amenities_controller.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/post/widgets/post_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/icon_from_api.dart';
import 'package:get/get.dart';
import 'package:map_picker/map_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreatePostPage extends GetView<ThemeChangeController> {
  CreatePostPage({Key? key}) : super(key: key);
  //<=============== Text Editor Controllers ========================>
  QuillEditorController descriptionController = QuillEditorController();
  final TextEditingController searchCategory = TextEditingController();
  TextEditingController postTitleController = TextEditingController();
  TextEditingController totalAreaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController plotNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController videoUrlController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController noOfInstallmentController = TextEditingController();
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  MapPickerController mapPickerController = MapPickerController();
  TextEditingController mapTextController = TextEditingController();
//<=============== Data Controllers ========================>
  CategoryController categoryController = Get.find<CategoryController>();
  PostController postController = Get.find<PostController>();
  AmenitiesController amenitiesController = Get.find<AmenitiesController>();
  ProfileController profileController = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  var selectedItemId = 0.obs;
  var subCategorySelectedItemId = 0.obs;
  var isPublished = false.obs;
  var hasInstallments = false.obs;
  var posessionReady = false.obs;
  var showContactDetials = false.obs;
  var catId = ''.obs;
  var longitude = 0.0.obs;
  var latitude = 0.0.obs;
  var newList = [].obs;
  RxBool amenitiesBoolValue = false.obs;
  RxList selectedAmenities = [].obs;
  List<dynamic> amenities = [false].obs;
  var selectedAmenitiesNames = [].obs;
  var selectedAmenitiesCodes = [].obs;
  List purposeList = ["SELL", "RENT"];
  RxString purposeValue = 'SELL'.obs;
  RxString propertyAreaUnitValue = 'SQFT'.obs;
  List propertyAreaUnitList = ["MARLA", "SQFT", "SQMT"];

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Posts'),
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .8,
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: controller.isDarkMode.value
                          ? kDarkShadowColor.withOpacity(.9)
                          : kShadowColor.withOpacity(.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 25),
                  child: Focus(
                    focusNode: postController.formFocus,
                    child: Form(
                      key: _formKey,
                      child: PostForm(
                        //<============! Post Title Fild ==========>
                        postTitleController: postTitleController,
                        titleFocus: postController.titleFieldFocus,
                        titleFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(postController.cityFieldFocus);
                        },
                        postTitleValidator: (value) {
                          if (value == null || value == '') {
                            return 'Post title cannot be empty';
                          }
                        },
                        //<============! City Fild ==========>
                        cityController: cityController,
                        cityFocus: postController.cityFieldFocus,
                        cityFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(postController.cityFieldFocus);
                        },
                        cityValidator: (value) {
                          if (value == null || value == '' || value == int) {
                            return 'City cannot be empty nor it can have numbers or special characters';
                          }
                        },
                        //<============! Area Fild ==========>
                        areaController: areaController,
                        areaValidator: (value) {
                          if (value == null || value == '') {
                            return 'Area cannot be empty ';
                          }
                        },
                        //<============! Price Fild ==========>
                        priceController: priceController,
                        priceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Price cannot be empty';
                          }
                        },
                        //<============! Text Editor ==========>
                        contentController: descriptionController,
                        //Galary segment
                        pictureButtonText:
                            categoryController.imageUrl.value.isEmpty
                                ? 'Add Picture'
                                : 'Update Picture',
                        uploadImages: () async {
                          Get.defaultDialog(
                            title: 'Uploading Image',
                            content: const Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor),
                            ),
                          );
                          await postController.getImage();
                          Navigator.pop(context);
                        },
                        images: postController.imageUrl.isEmpty
                            ? Text(
                                'Please add Images',
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            : SizedBox(
                                height: height * 0.14,
                                width: width * .6,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 20,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: postController.imageUrl.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: width * .1,
                                          height: height * .14,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.network(
                                            postController.imageUrl[index],
                                            width: width * .1,
                                            height: height * .14,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            right: -10,
                                            top: -5,
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.cancel,
                                                color: kRedColor,
                                              ),
                                              onPressed: () {
                                                postController.imageUrl
                                                    .removeAt(index);
                                              },
                                            ))
                                      ],
                                    );
                                  },
                                ),
                              ),
                        //category segment
                        purposeList:
                            purposeList.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        purposeValue: purposeValue.value,
                        purposeOnChange: (value) {
                          purposeValue.value = value.toString();
                        },
                        categoryDropDownList: categoryController.category
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                        }).toList(),
                        categoryDropDownValue:
                            categoryController.selectedItemName.value,
                        categoryOnChange: (selectedValue) async {
                          categoryController.selectedItemName.value =
                              selectedValue;
                          for (int i = 0;
                              i < categoryController.category.length;
                              i++) {
                            if (categoryController.selectedItemName ==
                                categoryController.category[i].name) {
                              selectedItemId.value =
                                  categoryController.category[i].id!;
                              print(
                                  "<========== Slected Item Ids ===========>");
                              print(selectedItemId.value);
                            }
                          }
                          await categoryController.getSubCategories(
                              selectedItemId.value.toString());
                          await categoryController
                              .getAmenitiesIds(selectedItemId.value.toString());
                        },
                        //subCategory
                        subCategoryDropDownList: categoryController.subCategory
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                        }).toList(),
                        subCategoryDropDownValue: categoryController
                            .subCategorySelectedItemName.value,
                        subCategoryOnChange: (selectedValue) {
                          categoryController.subCategorySelectedItemName.value =
                              selectedValue;
                          for (int i = 0;
                              i < categoryController.subCategory.length;
                              i++) {
                            if (categoryController
                                    .subCategorySelectedItemName ==
                                categoryController.subCategory[i].name) {
                              subCategorySelectedItemId.value =
                                  categoryController.subCategory[i].id!;
                            }
                          }
                        },
                        //total area
                        totalAreaController: totalAreaController,
                        propertyAreaValidator: (value) {
                          if (value == null || value == '') {
                            return 'Property Ara cannot be empty';
                          }
                        },
                        //property AreaSizeUnit dropDown
                        propertyAreaUnitList: propertyAreaUnitList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        propertyAreaUnitValue: propertyAreaUnitValue.value,
                        propertyAreaUnitOnChange: (value) {
                          propertyAreaUnitValue.value = value.toString();
                        },
                        videoUrlController: videoUrlController,
                        // not required validation for video url
                        plotNumberController: plotNumberController,
                        plotNumberValidator: (value) {
                          if (value == null || value == '') {
                            return 'Plot / Flat number cannot be empty';
                          }
                        },
                        //Installment Segment
                        hasInstallmentValue: hasInstallments.value,
                        installmentStatusChanges: (value) {
                          hasInstallments.value = value;
                          print(hasInstallments.value);
                        },
                        noOfInstallmentController: noOfInstallmentController,
                        noOfInstallmentValidator: (value) {
                          if (value == null || value == '') {
                            return 'Number of Installment cannot be empty';
                          }
                        },
                        monthlyInstallmentValueController:
                            monthlyInstallmentController,
                        monthlyInstallmentValidator: (value) {
                          if (value == null || value == '') {
                            return 'Monthly Installment Value cannot be empty';
                          }
                        },
                        advanceController: advanceController,
                        advanceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Advance amount cannot be empty';
                          }
                        },
                        //Possession Segment
                        posessionValue: posessionReady.value,
                        posessionChanges: (value) {
                          posessionReady.value = value;
                        },
                        bedRoomController: bedroomController,
                        bedroomValidator: (value) {
                          if (value == null || value == '') {
                            return 'Bedroom cannot be empty';
                          }
                        },
                        bathRoomController: bathroomController,
                        bathroomValidator: (value) {
                          if (value == null || value == '') {
                            return 'Bathroom cannot be empty';
                          }
                        },
                        //amenities
                        amenities: ListView.builder(
                            itemCount:
                                categoryController.listOfAmenitiesNames.length,
                            itemBuilder: (context, index) {
                              var names =
                                  categoryController.listOfAmenitiesNames;
                              var codes =
                                  categoryController.listOfAmenitiesCodes;
                              amenities.add(false);
                              return Obx(
                                () => CheckboxListTile(
                                  selectedTileColor: kPrimaryColor,
                                  tileColor: kWhiteColor,
                                  checkColor: kDarkColor,
                                  activeColor: kPrimaryColor,
                                  value: amenities[index],
                                  onChanged: (value) {
                                    amenities[index] = !amenities[index];
                                    //TODO: build amenities local lists
                                    if (amenities[index]) {
                                      selectedAmenitiesNames.add(names[index]);
                                      selectedAmenitiesCodes.add(codes[index]);
                                    } else {
                                      selectedAmenitiesNames
                                          .remove(names[index]);
                                      selectedAmenitiesCodes
                                          .remove(codes[index]);
                                    }
                                  },
                                  title: Row(
                                    children: [
                                      IconFromApi(
                                        icon: codes[index],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        names[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        //show contact details
                        showContactDetails: showContactDetials.value,
                        showContactDetailsChanges: (value) {
                          showContactDetials.value = value;
                        },
                        buttonText: catId.value == '' ? 'Submit' : 'Update',
                        statusValue: isPublished.value,
                        statusChanges: (value) {
                          isPublished.value = value;
                        },

                        formSubmit: () async {
                          if (_formKey.currentState!.validate()) {
                            Get.defaultDialog(
                              title: 'Creating Post',
                              content: const Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              ),
                            );
                            var description =
                                await descriptionController.getText();
                            var propertyNumber = Random().nextInt(10000000);

                            await postController.create(
                              postTitleController.text,
                              propertyNumber,
                              description,
                              postController.imageUrl.first.toString(),
                              postController.imageUrl.toString(),
                              videoUrlController.text,
                              description,
                              postController.longitude.value.toString(),
                              postController.latitude.value.toString(),
                              plotNumberController.text,
                              priceController.text,
                              cityController.text,
                              areaController.text,
                              hasInstallments.value,
                              showContactDetials.value,
                              advanceController.text,
                              int.parse(noOfInstallmentController.text),
                              monthlyInstallmentController.text,
                              posessionReady.value,
                              propertyAreaUnitValue.value,
                              purposeValue.value.toUpperCase(),
                              totalAreaController.text,
                              int.parse(bedroomController.text),
                              int.parse(bathroomController.text),
                              selectedAmenitiesCodes.toString(),
                              selectedAmenitiesNames.toString(),
                              selectedItemId.value,
                              isPublished.value,
                              postTitleController.text +
                                  propertyNumber.toString(),
                            );
                            Navigator.pop(context);
                          }
                          // --------------------------- Message -----------------------------
                          //Code has to be modified for the editing page.
                          // we have to decide where do we want to edit in new page or here.
                          // --------------------------- Message -----------------------------
                          // } else {
                          // Get.defaultDialog(
                          //   title: 'Updating Category',
                          //   content: const Center(
                          //     child: CircularProgressIndicator(
                          //         color: kPrimaryColor),
                          //   ),
                          // );
                          // var description =
                          //     await contentController.getText();
                          // await categoryController.updateThisCategory(
                          //     int.parse(catId.value),
                          //     categoryController.imageUrl.value,
                          //     categoryNameController.text,
                          //     postShortDescriptionController.text,
                          //     description,
                          //     selectedItemId.value,
                          //     isPublished.value);
                          // categoryNameController.text = '';
                          // postShortDescriptionController.text = '';
                          // contentController.clear();
                          // selectedItemId.value = 0;
                          // catId.value = '';
                          // await categoryController.getCategories();
                          // Navigator.pop(context);
                          // }
                        },
                        cancelText: catId.value == '' ? '' : 'Cancel Update',
                        onTap: () async {
                          // categoryNameController.text = '';
                          // postShortDescriptionController.text = '';
                          // contentController.clear();
                          // selectedItemId.value = 0;
                          // catId.value = '';
                          // await categoryController.getCategories();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
