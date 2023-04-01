// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/darkmode/text_fields.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PostPage extends GetView<ThemeChangeController> {
  PostPage({Key? key}) : super(key: key);
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
              // Container(
              //   height: height * .8,
              //   width: width * .25,
              //   decoration: BoxDecoration(
              //     color: controller.isDarkMode.value
              //         ? kDarkFrameColor
              //         : kFrameColor,
              //     borderRadius: const BorderRadius.all(Radius.circular(10)),
              //     boxShadow: [
              //       BoxShadow(
              //         color: controller.isDarkMode.value
              //             ? kDarkShadowColor.withOpacity(.9)
              //             : kShadowColor.withOpacity(.5),
              //         spreadRadius: 3,
              //         blurRadius: 4,
              //         offset: const Offset(0, 3), // changes position of shadow
              //       ),
              //     ],
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(25.0),
              //     child: categoryController.category.isEmpty
              //         ? const Center(
              //             child: CircularProgressIndicator(
              //               color: kPrimaryColor,
              //             ),
              //           )
              //         : PostForm(
              //             imageListUrl: const [],
              //             postTitleController: categoryNameController,
              //             postShortDescriptionController:
              //                 postShortDescriptionController,
              //             contentController: contentController,
              //             dropDownList: categoryController.category
              //                 .map<DropdownMenuItem<String>>((value) {
              //               return DropdownMenuItem<String>(
              //                 value: value.name,
              //                 child: Text(value.name!),
              //               );
              //             }).toList(),
              //             dropDownValue:
              //                 categoryController.selectedItemName.value,
              //             onChange: (selectedValue) {
              //               categoryController.selectedItemName.value =
              //                   selectedValue;
              //               for (int i = 0;
              //                   i < categoryController.category.length;
              //                   i++) {
              //                 if (categoryController.selectedItemName ==
              //                     categoryController.category[i].name) {
              //                   selectedItemId.value =
              //                       categoryController.category[i].id!;
              //                 }
              //               }
              //             },
              //             buttonText: catId.value == '' ? 'Submit' : 'Update',
              //             formSubmit: () async {
              //               if (catId.value == '') {
              //                 Get.defaultDialog(
              //                   title: 'Creating Category',
              //                   content: const Center(
              //                     child: CircularProgressIndicator(
              //                         color: kPrimaryColor),
              //                   ),
              //                 );
              //                 var description =
              //                     await contentController.getText();
              //                 await categoryController.createNewCategory(
              //                     categoryController.imageUrl.value,
              //                     categoryNameController.text,
              //                     postShortDescriptionController.text,
              //                     description,
              //                     selectedItemId.value,
              //                     isPublished.value);
              //                 await categoryController.getCategories();
              //                 Navigator.pop(context);
              //               } else {
              //                 Get.defaultDialog(
              //                   title: 'Updating Category',
              //                   content: const Center(
              //                     child: CircularProgressIndicator(
              //                         color: kPrimaryColor),
              //                   ),
              //                 );
              //                 var description =
              //                     await contentController.getText();
              //                 await categoryController.updateThisCategory(
              //                     int.parse(catId.value),
              //                     categoryController.imageUrl.value,
              //                     categoryNameController.text,
              //                     postShortDescriptionController.text,
              //                     description,
              //                     selectedItemId.value,
              //                     isPublished.value);
              //                 categoryNameController.text = '';
              //                 postShortDescriptionController.text = '';
              //                 contentController.clear();
              //                 selectedItemId.value = 0;
              //                 catId.value = '';
              //                 await categoryController.getCategories();
              //                 Navigator.pop(context);
              //               }
              //             },
              //             cancelText: catId.value == '' ? '' : 'Cancel Update',
              //             onTap: () async {
              //               categoryNameController.text = '';
              //               postShortDescriptionController.text = '';
              //               contentController.clear();
              //               selectedItemId.value = 0;
              //               catId.value = '';
              //               await categoryController.getCategories();
              //             },
              //             pictureButtonText:
              //                 categoryController.imageUrl.value.isEmpty
              //                     ? 'Add Picture'
              //                     : 'Update Picture',
              //             uploadImages: () async {
              //               Get.defaultDialog(
              //                 title: 'Uploading Image',
              //                 content: const Center(
              //                   child: CircularProgressIndicator(
              //                       color: kPrimaryColor),
              //                 ),
              //               );
              //               await categoryController.getImage();
              //               Navigator.pop(context);
              //             },
              //             statusValue: isPublished.value,
              //             statusChanges: (value) {
              //               isPublished.value = value;
              //             },
              //             videoUrlController: videoUrlController,
              //             cityController: cityController,
              //             areaController: areaController,
              //             plotNumberController: plotNumberController,
              //             priceController: priceController,
              //             hasInstallmentValue: hasInstallments.value,
              //             installmentStatusChanges: (value) {
              //               hasInstallments.value = value;
              //             },
              //             posessionValue: posessionReady.value,
              //             posessionChanges: (value) {
              //               posessionReady.value = value;
              //             },
              //             contactPersonEmailController:
              //                 contactPersonsEmailController,
              //             contactPersonNameController:
              //                 contactPersonsNameController,
              //             contactPersonsLandlineController:
              //                 contactPersonsLandlineController,
              //             contactPersonsMobileController:
              //                 contactPersonsMobileController,
              //             noOfInstallmentController: noOfInstallmentController,
              //             monthlyInstallmentValueController:
              //                 monthlyInstallmentController,
              //             advanceController: advanceController,
              //             bedRoomController: bedroomController,
              //             bathRoomController: bathroomController,
              //           ),
              //   ),
              // ),
              // SizedBox(
              //   width: width * .03,
              // ),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .45,
                            child: DefaultTextField(
                              textEditingController: searchCategory,
                              hintText: "Search Post",
                              labelText: "Search",
                              isPassword: false,
                              suffixIcon:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                          DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkColor,
                            buttonText: "Create Post",
                            width: width * .12,
                            height: height * .05,
                            onPressed: () {
                              Get.toNamed('/post/create');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      SizedBox(
                        height: height * .6,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: postController.post.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * .06,
                                              child: CircleAvatar(
                                                backgroundColor: kWhiteColor,
                                                radius: 30,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: postController
                                                              .post[index]
                                                              .galleryImages !=
                                                          null
                                                      ? Image.network(
                                                          postController
                                                              .post[index]
                                                              .galleryImages!)
                                                      : SvgPicture.asset(
                                                          '/images/logo.svg',
                                                          fit: BoxFit.cover,
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    postController
                                                        .post[index].title!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Status: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                      postController.post[index]
                                                                  .status ==
                                                              'PUBLISH'
                                                          ? Text(
                                                              "Active",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .green),
                                                            )
                                                          : Text(
                                                              'UnPublished',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                //TODO: implement Post edit
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                //Todo Implement Post Delete
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/trash.svg"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
