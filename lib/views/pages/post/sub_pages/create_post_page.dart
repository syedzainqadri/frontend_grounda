import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/post/widgets/post_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';
import 'package:map_picker/map_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CreatePostPage extends GetView<ThemeChangeController> {
  CreatePostPage({Key? key}) : super(key: key);
  final TextEditingController searchCategory = TextEditingController();
  QuillEditorController contentController = QuillEditorController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController postShortDescriptionController =
      TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController plotNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController videoUrlController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController noOfInstallmentController = TextEditingController();
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController contactPersonsLandlineController =
      TextEditingController();
  TextEditingController contactPersonsMobileController =
      TextEditingController();
  TextEditingController contactPersonsEmailController = TextEditingController();
  TextEditingController contactPersonsNameController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();

  TextEditingController purposeController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController propertySubTypeController = TextEditingController();

  MapPickerController mapPickerController = MapPickerController();
  TextEditingController mapTextController = TextEditingController();

  CategoryController categoryController = Get.find<CategoryController>();
  PostController postController = Get.find<PostController>();
  var selectedItemId = 0.obs;
  var isPublished = false.obs;
  var hasInstallments = false.obs;
  var posessionReady = false.obs;
  var catId = ''.obs;

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
                  padding: const EdgeInsets.all(25.0),
                  child: categoryController.category.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : PostForm(
                          mapPickerController: mapPickerController,
                          mapTextController: mapTextController,
                          purposeController: purposeController,
                          propertyTypeController: propertyTypeController,
                          propertySubTypeController: propertySubTypeController,
                          imageListUrl: const [],
                          postTitleController: categoryNameController,
                          postShortDescriptionController:
                              postShortDescriptionController,
                          contentController: contentController,
                          dropDownList: categoryController.category
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name!),
                            );
                          }).toList(),
                          dropDownValue:
                              categoryController.selectedItemName.value,
                          onChange: (selectedValue) {
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
                          },
                          buttonText: catId.value == '' ? 'Submit' : 'Update',
                          formSubmit: () async {
                            if (catId.value == '') {
                              Get.defaultDialog(
                                title: 'Creating Category',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              var description =
                                  await contentController.getText();
                              await categoryController.createNewCategory(
                                  categoryController.imageUrl.value,
                                  categoryNameController.text,
                                  postShortDescriptionController.text,
                                  description,
                                  selectedItemId.value,
                                  isPublished.value);
                              await categoryController.getCategories();
                              Navigator.pop(context);
                            } else {
                              Get.defaultDialog(
                                title: 'Updating Category',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              var description =
                                  await contentController.getText();
                              await categoryController.updateThisCategory(
                                  int.parse(catId.value),
                                  categoryController.imageUrl.value,
                                  categoryNameController.text,
                                  postShortDescriptionController.text,
                                  description,
                                  selectedItemId.value,
                                  isPublished.value);
                              categoryNameController.text = '';
                              postShortDescriptionController.text = '';
                              contentController.clear();
                              selectedItemId.value = 0;
                              catId.value = '';
                              await categoryController.getCategories();
                              Navigator.pop(context);
                            }
                          },
                          cancelText: catId.value == '' ? '' : 'Cancel Update',
                          onTap: () async {
                            categoryNameController.text = '';
                            postShortDescriptionController.text = '';
                            contentController.clear();
                            selectedItemId.value = 0;
                            catId.value = '';
                            await categoryController.getCategories();
                          },
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
                            await categoryController.getImage();
                            Navigator.pop(context);
                          },
                          statusValue: isPublished.value,
                          statusChanges: (value) {
                            isPublished.value = value;
                          },
                          videoUrlController: videoUrlController,
                          cityController: cityController,
                          areaController: areaController,
                          plotNumberController: plotNumberController,
                          priceController: priceController,
                          hasInstallmentValue: hasInstallments.value,
                          installmentStatusChanges: (value) {
                            hasInstallments.value = value;
                          },
                          posessionValue: posessionReady.value,
                          posessionChanges: (value) {
                            posessionReady.value = value;
                          },
                          contactPersonEmailController:
                              contactPersonsEmailController,
                          contactPersonNameController:
                              contactPersonsNameController,
                          contactPersonsLandlineController:
                              contactPersonsLandlineController,
                          contactPersonsMobileController:
                              contactPersonsMobileController,
                          noOfInstallmentController: noOfInstallmentController,
                          monthlyInstallmentValueController:
                              monthlyInstallmentController,
                          advanceController: advanceController,
                          bedRoomController: bedroomController,
                          bathRoomController: bathroomController,
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
