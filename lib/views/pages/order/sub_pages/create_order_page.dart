// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/amenitiesController/amenities_controller.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/views/pages/post/widgets/post_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/icon_from_api.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  //<=============== Data Controllers ========================>
  CategoryController categoryController = Get.find<CategoryController>();
  ThemeChangeController themeChangeController =
      Get.find<ThemeChangeController>();
  PostController postController = Get.find<PostController>();

  AmenitiesController amenitiesController = Get.find<AmenitiesController>();

  ProfileController profileController = Get.find<ProfileController>();

  //<=============== Text Editor Controllers ========================>
  QuillEditorController descriptionController = QuillEditorController();

  final TextEditingController searchCategory = TextEditingController();

  // TextEditingController postTitleController = TextEditingController();
  final _createPostFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;

  var subCategorySelectedItemId = 0.obs;

  List<dynamic> amenities = [false].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCatName(postController.catID.value);
  }

  getCatName(catId) {
    if (catId != 0) {
      categoryController.getAmenitiesIds(catId.toString());
      for (int i = 0; i < categoryController.category.length; i++) {
        if (catId == categoryController.category[i].id) {
          categoryController.selectedItemName.value =
              categoryController.category[i].name!;
          categoryController.getSubCategories(catId.toString());
        }
      }
      getSubCatname(postController.subCatID.value);
    }
  }

  getSubCatname(subCatId) async {
    print('subcat id is: $subCatId');
    if (subCatId != 0) {
      await categoryController.getAmenitiesIds(subCatId.toString());
      for (int i = 0; i < categoryController.subCategory.length; i++) {
        if (subCatId == categoryController.subCategory[i].id) {
          categoryController.subCategorySelectedItemName.value =
              categoryController.subCategory[i].name!;
          print(categoryController.subCategorySelectedItemName);
        }
      }
    }
  }

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
                  color: themeChangeController.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: themeChangeController.isDarkMode.value
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
                      key: _createPostFormKey,
                      child: PostForm(
                        //<============! Post Title Fild ==========>
                        postTitleController: postController.postTitleController,
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
                        cityController: postController.cityController,
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
                        areaController: postController.areaController,
                        areaValidator: (value) {
                          if (value == null || value == '') {
                            return 'Area cannot be empty ';
                          }
                        },
                        //<============! Price Fild ==========>
                        priceController: postController.priceController,
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
                                style: TextStyle(
                                    color:
                                        themeChangeController.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkColor),
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
                        purposeList: postController.purposeList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        purposeValue: postController.purposeValue.value,
                        purposeOnChange: (value) {
                          postController.purposeValue.value = value.toString();
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
                            }
                          }
                          await categoryController.getSubCategories(
                              selectedItemId.value.toString());
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
                        subCategoryOnChange: (selectedValue) async {
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
                          await categoryController.getAmenitiesIds(
                              subCategorySelectedItemId.value.toString());
                        },
                        //total area
                        totalAreaController: postController.totalAreaController,
                        propertyAreaValidator: (value) {
                          if (value == null || value == '') {
                            return 'Property Ara cannot be empty';
                          }
                        },
                        //property AreaSizeUnit dropDown
                        propertyAreaUnitList: postController
                            .propertyAreaUnitList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        propertyAreaUnitValue:
                            postController.propertyAreaUnitValue.value,
                        propertyAreaUnitOnChange: (value) {
                          postController.propertyAreaUnitValue.value =
                              value.toString();
                        },
                        videoUrlController: postController.videoUrlController,
                        // not required validation for video url
                        plotNumberController:
                            postController.plotNumberController,
                        plotNumberValidator: (value) {
                          if (value == null || value == '') {
                            return 'Plot / Flat number cannot be empty';
                          }
                        },
                        //Installment Segment
                        hasInstallmentValue:
                            postController.hasInstallments.value,
                        installmentStatusChanges: (value) {
                          postController.hasInstallments.value = value;
                          print(postController.hasInstallments.value);
                        },
                        noOfInstallmentController:
                            postController.noOfInstallmentController,
                        noOfInstallmentValidator: (value) {
                          if (value == null || value == '') {
                            return 'Number of Installment cannot be empty';
                          }
                        },
                        monthlyInstallmentValueController:
                            postController.monthlyInstallmentController,
                        monthlyInstallmentValidator: (value) {
                          if (value == null || value == '') {
                            return 'Monthly Installment Value cannot be empty';
                          }
                        },
                        advanceController: postController.advanceController,
                        advanceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Advance amount cannot be empty';
                          }
                        },
                        //Possession Segment
                        posessionValue: postController.posessionReady.value,
                        posessionChanges: (value) {
                          postController.posessionReady.value = value;
                        },
                        bedRoomController: postController.bedroomController,
                        bedroomValidator: (value) {
                          if (value == null || value == '') {
                            return 'Bedroom cannot be empty';
                          }
                        },
                        bathRoomController: postController.bathroomController,
                        bathroomValidator: (value) {
                          if (value == null || value == '') {
                            return 'Bathroom cannot be empty';
                          }
                        },
                        //amenities
                        selectedAmenities: postController.postID.value != 0
                            ? SizedBox(
                                width: width * .2,
                                height: 50,
                                child: ListView.builder(
                                    reverse: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: postController
                                        .postAmenitiesNames.length,
                                    itemBuilder: (context, index) {
                                      var names =
                                          postController.postAmenitiesNames;
                                      var code =
                                          postController.postAmenitiesCodes;
                                      return Stack(children: [
                                        Icon(
                                          IconData(
                                            int.parse(code[index]),
                                            fontFamily: iconFontFamily.value,
                                          ),
                                          size: 30,
                                        ),
                                        Positioned(
                                            top: -10,
                                            left: 0,
                                            child: IconButton(
                                                onPressed: () {
                                                  names.remove(names[index]);
                                                  postController
                                                      .postAmenitiesNames
                                                      .remove(names[index]);
                                                  code.remove(code[index]);
                                                  postController
                                                      .postAmenitiesCodes
                                                      .remove(code[index]);
                                                },
                                                icon: const Icon(
                                                  Icons.cancel,
                                                  color: kRedColor,
                                                  size: 15,
                                                ))),
                                      ]);
                                    }),
                              )
                            : const Offstage(),
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
                                    if (postController.postID.value != '') {
                                      print(postController.postID);
                                      if (amenities[index]) {
                                        postController.postAmenitiesNames
                                            .add(names[index]);
                                        postController.postAmenitiesCodes
                                            .add(codes[index]);
                                      } else {
                                        postController.postAmenitiesNames
                                            .remove(names[index]);
                                        postController.postAmenitiesCodes
                                            .remove(codes[index]);
                                      }
                                    } else {
                                      print('This is working');
                                      if (amenities[index]) {
                                        postController.selectedAmenitiesNames
                                            .add(names[index]);
                                        postController.selectedAmenitiesCodes
                                            .add(codes[index]);
                                      } else {
                                        postController.selectedAmenitiesNames
                                            .remove(names[index]);
                                        postController.selectedAmenitiesCodes
                                            .remove(codes[index]);
                                      }
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
                        showContactDetails:
                            postController.showContactDetials.value,
                        showContactDetailsChanges: (value) {
                          postController.showContactDetials.value = value;
                        },
                        buttonText: postController.postID.value == ''
                            ? 'Submit'
                            : 'Update',
                        statusValue: postController.isPublished.value,
                        statusChanges: (value) {
                          postController.isPublished.value = value;
                        },
                        //submit button
                        formSubmit: () async {
                          if (postController.postID == '') {
                            var description =
                                await descriptionController.getText();
                            var amenitiesNameList = jsonEncode(
                                postController.selectedAmenitiesNames);
                            var amenitiesCodeList = jsonEncode(
                                postController.selectedAmenitiesCodes);
                            print('Amenities Names Are');
                            print(amenitiesNameList);
                            if (description.isNotEmpty) {
                              if (postController.imageUrl.isNotEmpty) {
                                if (subCategorySelectedItemId != 0) {
                                  if (postController
                                          .selectedAmenitiesNames.isNotEmpty ||
                                      postController
                                          .selectedAmenitiesCodes.isNotEmpty) {
                                    if (_createPostFormKey.currentState!
                                        .validate()) {
                                      Get.defaultDialog(
                                        barrierDismissible: false,
                                        title: 'Creating Post',
                                        content: const Center(
                                          child: CircularProgressIndicator(
                                              color: kPrimaryColor),
                                        ),
                                      );
                                      var propertyNumber =
                                          Random().nextInt(10000000);
                                      var imageList =
                                          jsonEncode(postController.imageUrl);
                                      print(postController
                                          .postTitleController.text);
                                      print(propertyNumber);
                                      print(description);
                                      print(postController.imageUrl.first
                                          .toString());
                                      print(imageList);
                                      print(postController
                                          .videoUrlController.text);
                                      print(description);
                                      print(postController.longitude.value
                                          .toString());
                                      print(postController.latitude.value
                                          .toString());
                                      print(postController
                                          .plotNumberController.text);
                                      print(
                                          postController.priceController.text);
                                      print(postController.cityController.text);
                                      print(postController.areaController.text);
                                      print(
                                          postController.hasInstallments.value);
                                      print(postController
                                          .showContactDetials.value);
                                      print('issue loading advance controller');
                                      print(postController
                                          .advanceController.text);
                                      print(int.parse(postController
                                          .noOfInstallmentController.text));
                                      print(postController
                                          .monthlyInstallmentController.text);
                                      print(
                                          postController.posessionReady.value);
                                      print(postController
                                          .propertyAreaUnitValue.value);
                                      print(postController.purposeValue.value);
                                      print(postController
                                          .totalAreaController.text);
                                      print(postController
                                          .bedroomController.text);
                                      print(postController
                                          .bathroomController.text);
                                      print(amenitiesCodeList);
                                      print(amenitiesNameList);
                                      print(selectedItemId);
                                      print(subCategorySelectedItemId);
                                      print(postController
                                              .postTitleController.text +
                                          propertyNumber.toString());
                                      await postController.create(
                                        postController.postTitleController.text,
                                        propertyNumber,
                                        description,
                                        postController.imageUrl.first
                                            .toString(),
                                        imageList,
                                        postController.videoUrlController.text,
                                        description,
                                        postController.longitude.value
                                            .toString(),
                                        postController.latitude.value
                                            .toString(),
                                        postController
                                            .plotNumberController.text,
                                        postController.priceController.text,
                                        postController.cityController.text,
                                        postController.areaController.text,
                                        postController.hasInstallments.value,
                                        postController.showContactDetials.value,
                                        postController.advanceController.text,
                                        int.parse(postController
                                            .noOfInstallmentController.text),
                                        postController
                                            .monthlyInstallmentController.text,
                                        postController.posessionReady.value,
                                        postController
                                            .propertyAreaUnitValue.value,
                                        postController.purposeValue.value
                                            .toUpperCase(),
                                        postController.totalAreaController.text,
                                        int.parse(postController
                                            .bedroomController.text),
                                        int.parse(postController
                                            .bathroomController.text),
                                        amenitiesCodeList,
                                        amenitiesNameList,
                                        selectedItemId.value,
                                        subCategorySelectedItemId.value,
                                        postController.isPublished.value,
                                        postController
                                                .postTitleController.text +
                                            propertyNumber.toString(),
                                      );
                                      Navigator.pop(context);
                                      postController.getAll();
                                      Get.toNamed('/post');
                                    } else {
                                      showErrorSnak('Amenities are empty',
                                          'Please Select Amenities');
                                    }
                                  }
                                } else {
                                  showErrorSnak('Sub Category is not selected',
                                      'Please select a Sub Category');
                                }
                              } else {
                                showErrorSnak('No Image Selected',
                                    'Images Must not be Empty');
                              }
                            } else {
                              showErrorSnak('Description is Empty',
                                  'Description Can Not be empty');
                            }
                          } else {
                            print("============= Updating started=======");
                            var description =
                                await descriptionController.getText();

                            var amenitiesNameList =
                                jsonEncode(postController.postAmenitiesNames);
                            var amenitiesCodeList =
                                jsonEncode(postController.postAmenitiesCodes);
                            print(amenitiesNameList);
                            if (description.isNotEmpty) {
                              print(description);
                              if (postController.imageUrl.isNotEmpty) {
                                print(postController.imageUrl);
                                // if (postController
                                //         .selectedAmenitiesNames.isNotEmpty ||
                                //     postController
                                //         .selectedAmenitiesCodes.isNotEmpty) {
                                // if (_formKey.currentState!.validate()) {
                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Updating Post',
                                  content: const Center(
                                    child: CircularProgressIndicator(
                                        color: kPrimaryColor),
                                  ),
                                );
                                var imageList =
                                    jsonEncode(postController.imageUrl);
                                print("============= Updating =======");
                                await postController.updatePost(
                                  postController.postID.value,
                                  postController.postTitleController.text,
                                  postController.propertyNumber.value,
                                  description,
                                  postController.imageUrl.first.toString(),
                                  imageList,
                                  postController.videoUrlController.text,
                                  description,
                                  postController.longitude.value.toString(),
                                  postController.latitude.value.toString(),
                                  postController.plotNumberController.text,
                                  postController.priceController.text,
                                  postController.cityController.text,
                                  postController.areaController.text,
                                  postController.hasInstallments.value,
                                  postController.showContactDetials.value,
                                  postController.advanceController.text,
                                  int.parse(postController
                                      .noOfInstallmentController.text),
                                  postController
                                      .monthlyInstallmentController.text,
                                  postController.posessionReady.value,
                                  postController.propertyAreaUnitValue.value,
                                  postController.purposeValue.value
                                      .toUpperCase(),
                                  postController.totalAreaController.text,
                                  int.parse(
                                      postController.bedroomController.text),
                                  int.parse(
                                      postController.bathroomController.text),
                                  amenitiesCodeList,
                                  amenitiesNameList,
                                  postController.catID.value,
                                  postController.subCatID.value,
                                  postController.isPublished.value,
                                );
                                Navigator.pop(context);
                                postController.getAll();
                                Get.toNamed('/post');
                                // }
                                // } else {
                                //   showErrorSnak('Amenities are empty',
                                //       'Please Select Amenities');
                                // }
                              } else {
                                showErrorSnak('No Image Selected',
                                    'Images Must not be Empty');
                              }
                            } else {
                              showErrorSnak('Description is Empty',
                                  'Description Can Not be empty');
                            }
                          }
                        },
                        cancelText: postController.postID.value == ''
                            ? ''
                            : 'Cancel Update',
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
