// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/developerController/developer_controller.dart';

import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:frontend_grounda/views/pages/project/widgets/project_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../../controllers/projectController/project_controller.dart';

class CreateProjectPage extends GetView<ThemeChangeController> {
  CreateProjectPage({Key? key}) : super(key: key);

  //<=============== Data Controllers ========================>
  CategoryController categoryController = Get.find<CategoryController>();

  ProjectController projectController = Get.find<ProjectController>();

  ProfileController profileController = Get.find<ProfileController>();

  //<=============== Text Editor Controllers ========================>
  HtmlEditorController htmlEditorController = HtmlEditorController();

  final TextEditingController projectCategoryController =
      TextEditingController();
  final TextEditingController searchCategory = TextEditingController();

  // TextEditingController postTitleController = TextEditingController();
  final _createPostFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;

  var subCategorySelectedItemId = 0.obs;

  var statusValue = true.obs;

  DeveloperController developerController = Get.find<DeveloperController>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Projects'),
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
                    focusNode: projectController.formFocus,
                    child: Form(
                      key: _createPostFormKey,
                      // form
                      child: ProjectForm(
                        // text
                        buttonText: "Submit",
                        // focus nods
                        projectLocalityFocus:
                            projectController.projectLocalityFocus,
                        projectAddressFocus:
                            projectController.projectAddressFocus,
                        cityFocus: projectController.cityFieldFocus,

                        // controllers
                        projectTitleController:
                            projectController.projectTitleController,
                        projectAddressController:
                            projectController.projectTitleController,
                        projectLocalityController:
                            projectController.projectTitleController,
                        titleFocus: projectController.titleFieldFocus,
                        cityController: projectController.cityController,
                        areaController: projectController.areaController,
                        startingPriceController:
                            projectController.startingPriceController,
                        endingPriceController:
                            projectController.endingPriceController,
                        htmlEditorController: htmlEditorController,

                        // validations
                        titleFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(projectController.cityFieldFocus);
                        },
                        projectTitleValidator: (value) {
                          if (value == null || value == '') {
                            return 'Project title cannot be empty';
                          }
                        },

                        // status change
                        statusChanges: (value) {
                          statusValue.value = value;
                        },
                        statusValue: statusValue.value,

                        //<============! City Fild ==========>
                        cityFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(projectController.cityFieldFocus);
                        },
                        cityValidator: (value) {
                          if (value == null || value == '' || value == int) {
                            return 'City cannot be empty nor it can have numbers or special characters';
                          }
                        },
                        //<============! Area Fild ==========>

                        areaValidator: (value) {
                          if (value == null || value == '') {
                            return 'Area cannot be empty ';
                          }
                        },
                        //<============! Price Fild ==========>

                        startingPriceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Price cannot be empty';
                          }
                        },
                        endingPriceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Price cannot be empty';
                          }
                        },
                        //<============! Text Editor ==========>

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
                          await projectController.getImage();
                          Navigator.pop(context);
                        },

                        images: projectController.imageUrl.isEmpty
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
                                  itemCount: projectController.imageUrl.length,
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
                                            projectController.imageUrl[index],
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
                                                projectController.imageUrl
                                                    .removeAt(index);
                                              },
                                            ))
                                      ],
                                    );
                                  },
                                ),
                              ),

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

                        // developer
                        developerDropDownList: developerController.developers
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value.title,
                            child: Text(value.title!),
                          );
                        }).toList(),

                        developerDropDownValue:
                            developerController.selectedItemName.value,
                        developerOnChange: (selectedValue) async {
                          developerController.selectedItemName.value =
                              selectedValue;
                          for (int i = 0;
                              i < developerController.developers.length;
                              i++) {
                            if (developerController.selectedItemName ==
                                developerController.developers[i].title) {
                              selectedItemId.value =
                                  developerController.developers[i].id!;
                            }
                          }
                        },

                        //submit button
                        formSubmit: () async {
                          if (projectController.project == '') {
                            var description =
                                await htmlEditorController.getText();

                            if (description.isNotEmpty) {
                              if (projectController.imageUrl.isNotEmpty) {
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
                                await htmlEditorController.getText();

                            if (description.isNotEmpty) {
                              print(description);
                              if (projectController.imageUrl.isNotEmpty) {
                                print(projectController.imageUrl);

                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Updating Post',
                                  content: const Center(
                                    child: CircularProgressIndicator(
                                        color: kPrimaryColor),
                                  ),
                                );
                                var imageList =
                                    jsonEncode(projectController.imageUrl);
                                print("============= Updating =======");
                                await projectController.updateProject(
                                  projectController.projectID.value,
                                  projectController.projectTitleController.text,
                                  imageList,
                                  imageList,
                                  projectController
                                      .projectLocalityController.text,
                                  projectController.cityController.text,
                                  description,
                                  projectController.catID.value,

                                  projectController.developerID.value,
                                  projectController.startingPrice.value,
                                  projectController.endingPrice.value,
                                  // projectController.isPublished.value,
                                );
                                Navigator.pop(context);
                                projectController.getAll();
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
                        cancelText: projectController.projectID.value == ''
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
