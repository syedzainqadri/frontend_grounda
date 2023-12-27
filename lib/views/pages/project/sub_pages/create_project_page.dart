// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/developerController/developer_controller.dart';

import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/controllers/projectController/projectNearByPlaces_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:frontend_grounda/views/pages/project/widgets/project_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/icon_from_api.dart';
import 'package:get/get.dart';

import '../../../../controllers/projectController/project_controller.dart';
import '../../../../utils/global_variable.dart';

class CreateProjectPage extends GetView<ThemeChangeController> {
  CreateProjectPage({super.key});

  //<=============== Data Controllers ========================>
  CategoryController categoryController = Get.find<CategoryController>();

  ProjectController projectController = Get.find<ProjectController>();

  ProfileController profileController = Get.find<ProfileController>();

  ProjectNearByPlacesController projectNearByPlacesController =
      Get.find<ProjectNearByPlacesController>();

  //<=============== Text Editor Controllers ========================>

  final TextEditingController projectCategoryController =
      TextEditingController();
  final TextEditingController searchCategory = TextEditingController();

  // TextEditingController postTitleController = TextEditingController();
  final _createPostFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;

  var categorySelectedItemId = 0.obs;
  List<dynamic> projectNearByPlaces = [false].obs;

  DeveloperController developerController = Get.find<DeveloperController>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Projects'),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .8,
                decoration: BoxDecoration(
                  color:
                      controller.isDarkMode.value ? kDarkCardColor : kCardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: controller.isDarkMode.value
                          ? kDarkShadowColor.withOpacity(.2)
                          : kShadowColor.withOpacity(.2),
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
                        buttonText: projectController.projectID == 0
                            ? "Submit"
                            : "Update",
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
                            projectController.projectAddressController,
                        projectLocalityController:
                            projectController.projectLocalityController,
                        titleFocus: projectController.titleFieldFocus,
                        cityController: projectController.cityController,
                        areaController: projectController.areaController,
                        startingPriceController:
                            projectController.startingPriceController,
                        endingPriceController:
                            projectController.endingPriceController,
                        htmlEditorController:
                            projectController.htmlEditorController,

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
                          projectController.statusValue.value = value;
                        },
                        statusValue: projectController.statusValue.value,

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
                            barrierDismissible: false,
                          );
                          await projectController.getImage();
                          Navigator.pop(context);
                        },

                        images: projectController.imageUrl.isEmpty
                            ? Text(
                                'Please add Images',
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? kWhiteColor
                                        : kDarkCardColor),
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

                        walkThroughController:
                            projectController.walkThroughController,
                        walkThroughFocus: projectController.walkThroughFocus,
                        walkThroughValidator: (value) {
                          if (value == null || value != 'https://') {
                            return 'Please Enter a valid Url';
                          }
                        },
                        walkThroughFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(projectController.walkThroughFocus);
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
                              categorySelectedItemId.value =
                                  categoryController.category[i].id!;
                            }
                          }
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
                        //select project near by places
                        selectedProjectNearByPlaces: projectController
                                    .projectID.value !=
                                0
                            ? SizedBox(
                                width: width * .2,
                                height: 50,
                                child: ListView.builder(
                                    reverse: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: projectController
                                        .selectedProjectNearByPlacesCodes
                                        .length,
                                    itemBuilder: (context, index) {
                                      var names = projectController
                                          .selectedProjectNearByPlacesNames;
                                      var code = projectController
                                          .selectedProjectNearByPlacesCodes;
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
                                                  projectController
                                                      .projectNearByPlacesNames
                                                      .remove(names[index]);
                                                  code.remove(code[index]);
                                                  projectController
                                                      .projectNearByPlacesCodes
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
                        projectNearByPlaces: ListView.builder(
                            //TODO: we need to chaneg this controller here
                            itemCount: projectNearByPlacesController
                                .projectNearByPlace.length,
                            itemBuilder: (context, index) {
                              projectNearByPlaces.add(false);
                              return Obx(
                                () => CheckboxListTile(
                                  selectedTileColor: kPrimaryColor,
                                  tileColor: kWhiteColor,
                                  checkColor: kDarkCardColor,
                                  activeColor: kPrimaryColor,
                                  value: projectNearByPlaces[index],
                                  onChanged: (value) {
                                    projectNearByPlaces[index] =
                                        !projectNearByPlaces[index];
                                    //TODO: build amenities local lists
                                    if (projectController.projectID.value !=
                                        0) {
                                      print(projectController.projectID);
                                      if (projectNearByPlaces[index]) {
                                        projectController
                                            .projectNearByPlacesNames
                                            .add(projectNearByPlacesController
                                                .projectNearByPlace[index]
                                                .name);
                                        projectController
                                            .projectNearByPlacesCodes
                                            .add(projectNearByPlacesController
                                                .projectNearByPlace[index]
                                                .icon);
                                      } else {
                                        projectController
                                            .projectNearByPlacesNames
                                            .remove(
                                                projectNearByPlacesController
                                                    .projectNearByPlace[index]
                                                    .name);
                                        projectController
                                            .projectNearByPlacesCodes
                                            .remove(
                                                projectNearByPlacesController
                                                    .projectNearByPlace[index]
                                                    .icon);
                                      }
                                    } else {
                                      print('This is working');
                                      if (projectNearByPlaces[index]) {
                                        projectController
                                            .selectedProjectNearByPlacesNames
                                            .add(projectNearByPlacesController
                                                .projectNearByPlace[index]
                                                .name);
                                        projectController
                                            .selectedProjectNearByPlacesCodes
                                            .add(projectNearByPlacesController
                                                .projectNearByPlace[index]
                                                .icon);
                                      } else {
                                        projectController
                                            .selectedProjectNearByPlacesNames
                                            .remove(
                                                projectNearByPlacesController
                                                    .projectNearByPlace[index]
                                                    .name);
                                        projectController
                                            .selectedProjectNearByPlacesCodes
                                            .remove(
                                                projectNearByPlacesController
                                                    .projectNearByPlace[index]
                                                    .icon);
                                      }
                                    }
                                    print(projectController
                                        .selectedProjectNearByPlacesNames);
                                  },
                                  title: Row(
                                    children: [
                                      IconFromApi(
                                        icon: projectNearByPlacesController
                                            .projectNearByPlace[index].icon!,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        projectNearByPlacesController
                                            .projectNearByPlace[index].name!,
                                        style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                        //submit button
                        formSubmit: () async {
                          if (projectController.projectID == 0) {
                            print(
                                "<======= The Project post is being submited =========>");

                            var description = await projectController
                                .htmlEditorController
                                .getText();
                            var imageList =
                                jsonEncode(projectController.imageUrl);
                            projectController.startingPrice.value =
                                projectController.startingPriceController.text;
                            projectController.endingPrice.value =
                                projectController.endingPriceController.text;
                            var projectNearByPlaceNames = jsonEncode(
                                projectController
                                    .selectedProjectNearByPlacesNames);
                            var projectNearByPlaceCodes = jsonEncode(
                                projectController
                                    .selectedProjectNearByPlacesCodes);
                            print(imageList);

                            if (description.isNotEmpty) {
                              if (projectController.imageUrl.isNotEmpty) {
                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Submiting Project',
                                  content: const Center(
                                    child: CircularProgressIndicator(
                                        color: kPrimaryColor),
                                  ),
                                );
                                await projectController.create(
                                  projectController.projectTitleController.text,
                                  projectController
                                      .projectAddressController.text,
                                  description,
                                  projectController.imageUrl.first,
                                  imageList,
                                  projectController
                                      .projectLocalityController.text,
                                  projectController.cityController.text,
                                  projectController.areaController.text,
                                  categorySelectedItemId.value,
                                  selectedItemId.value,
                                  projectController.startingPrice.value,
                                  projectController.endingPrice.value,
                                  projectController.statusValue.value,
                                  projectController.walkThroughController.text,
                                  projectNearByPlaceNames,
                                  projectNearByPlaceCodes,
                                );
                                Navigator.pop(context);
                                Get.toNamed('/project');
                              } else {
                                showErrorSnack('No Image Selected',
                                    'Images Must not be Empty');
                              }
                            } else {
                              showErrorSnack('Description is Empty',
                                  'Description Can Not be empty');
                            }
                          } else {
                            print("============= Updating started=======");

                            var description = await projectController
                                .htmlEditorController
                                .getText();
                            var imageList =
                                jsonEncode(projectController.imageUrl);
                            projectController.startingPrice.value =
                                projectController.startingPriceController.text;
                            projectController.endingPrice.value =
                                projectController.endingPriceController.text;
                            var projectNearByPlaceNames = jsonEncode(
                                projectController.projectNearByPlacesNames);
                            var projectNearByPlaceCodes = jsonEncode(
                                projectController.projectNearByPlacesCodes);
                            print(projectController.startingPrice);
                            print(projectController.endingPrice);

                            if (description.isNotEmpty) {
                              print(description);
                              if (projectController.imageUrl.isNotEmpty) {
                                print(projectController.imageUrl);

                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Updating Project',
                                  content: const Center(
                                    child: CircularProgressIndicator(
                                        color: kPrimaryColor),
                                  ),
                                );
                                print("============= Updating =======");
                                await projectController.updateProject(
                                    projectController.projectID.value,
                                    projectController
                                        .projectTitleController.text,
                                    projectController
                                        .descriptionController.text,
                                    projectController.imageUrl.first,
                                    imageList,
                                    projectController
                                        .projectLocalityController.text,
                                    projectController.cityController.text,
                                    projectController.areaController.text,
                                    description,
                                    projectController.catID.value,
                                    projectController.developerID.value,
                                    projectController.startingPrice.value,
                                    projectController.endingPrice.value,
                                    projectController.statusValue.value,
                                    projectController
                                        .walkThroughController.text,
                                    projectNearByPlaceNames,
                                    projectNearByPlaceCodes);
                                Navigator.pop(context);
                                projectController.getAll();
                                Get.toNamed('/project');
                                // }
                                // } else {
                                //   showErrorSnak('Amenities are empty',
                                //       'Please Select Amenities');
                                // }
                              } else {
                                showErrorSnack('No Image Selected',
                                    'Images Must not be Empty');
                              }
                            } else {
                              showErrorSnack('Description is Empty',
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
