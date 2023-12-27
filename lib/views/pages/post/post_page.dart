// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/postController/post_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PostPage extends GetView<ThemeChangeController> {
  PostPage({super.key});
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
      backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
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
                          // DefaultButton(
                          //   primaryColor: kPrimaryColor,
                          //   hoverColor: kDarkCardColor,
                          //   buttonText: "Manage Post",
                          //   width: width * .12,
                          //   height: height * .05,
                          //   onPressed: () {
                          //     Get.toNamed('/post/create');
                          //   },
                          // ),
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
                                  ? kDarkBgColor
                                  : kBgColor,
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
                                                              .featuredImages !=
                                                          null
                                                      ? Image.network(
                                                          postController
                                                              .post[index]
                                                              .featuredImages!)
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
                                                    style: TextStyle(
                                                      color: controller
                                                              .isDarkMode.value
                                                          ? kDarkTextColor
                                                          : kTextColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Status: ",
                                                        style: TextStyle(
                                                          color: controller
                                                                  .isDarkMode
                                                                  .value
                                                              ? kDarkTextColor
                                                              : kTextColor,
                                                        ),
                                                      ),
                                                      postController.post[index]
                                                                  .status ==
                                                              true
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
                                                await postController
                                                    .getPostById(
                                                  postController.post[index].id
                                                      .toString(),
                                                );
                                                Get.toNamed('/post/create');
                                              },
                                              icon: SvgPicture.asset(
                                                "assets/icons/edit.svg",
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkTextColor
                                                        : kTextColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                print('post deleted pressed');
                                                print(postController
                                                    .post[index].id!
                                                    .toString());
                                                print(postController
                                                    .post[index].title);
                                                print(postController.post[index]
                                                    .propertyNumber);
                                                print(postController
                                                    .post[index].description);
                                                print(postController.post[index]
                                                    .featuredImages);
                                                print(postController
                                                    .post[index].galleryImages);
                                                print(postController.post[index]
                                                    .longDescription);
                                                print(postController
                                                    .post[index].longitude);
                                                print(postController
                                                    .post[index].latitude);
                                                print(postController.post[index]
                                                    .propertyNumber);
                                                print(postController
                                                    .post[index].price);
                                                print(postController
                                                    .post[index].city);
                                                print(postController
                                                    .post[index].area);
                                                print(postController.post[index]
                                                    .isInstallmentAvailable);
                                                print(postController.post[index]
                                                    .showContactDetails);
                                                print(postController
                                                    .post[index].advanceAmount);
                                                print(postController.post[index]
                                                    .noOfInstallments);
                                                print(postController.post[index]
                                                    .monthlyInstallments);
                                                print(postController.post[index]
                                                    .readyForPossession);
                                                print(postController
                                                    .post[index].areaSizeUnit);
                                                print(postController
                                                    .post[index].purpose);
                                                print(postController.post[index]
                                                    .amenitiesIconCodes);
                                                print(postController.post[index]
                                                    .amenitiesNames);
                                                print(postController
                                                    .post[index].categoryId);
                                                await postController.delete(
                                                    postController
                                                        .post[index].id!
                                                        .toString(),
                                                    postController
                                                        .post[index].title!,
                                                    postController.post[index]
                                                        .propertyNumber!,
                                                    postController.post[index]
                                                        .description!,
                                                    postController.post[index]
                                                        .featuredImages!,
                                                    postController.post[index]
                                                        .galleryImages!,
                                                    postController
                                                        .post[index].video!,
                                                    postController.post[index]
                                                        .longDescription!,
                                                    postController
                                                        .post[index].longitude!,
                                                    postController
                                                        .post[index].latitude!,
                                                    postController.post[index]
                                                        .plotNumber!,
                                                    postController
                                                        .post[index].price!,
                                                    postController
                                                        .post[index].city!,
                                                    postController
                                                        .post[index].area!,
                                                    postController.post[index]
                                                        .isInstallmentAvailable!,
                                                    postController.post[index]
                                                        .showContactDetails!,
                                                    postController.post[index]
                                                        .advanceAmount!,
                                                    postController.post[index]
                                                        .noOfInstallments!,
                                                    postController.post[index]
                                                        .monthlyInstallments!,
                                                    postController.post[index]
                                                        .readyForPossession!,
                                                    postController.post[index]
                                                        .areaSizeUnit!,
                                                    postController
                                                        .post[index].purpose!,
                                                    postController.post[index]
                                                        .totalAreaSize!,
                                                    postController
                                                        .post[index].bedroooms!,
                                                    postController
                                                        .post[index].bathroom!,
                                                    postController.post[index]
                                                        .amenitiesIconCodes!,
                                                    postController.post[index]
                                                        .amenitiesNames!,
                                                    postController.post[index]
                                                        .categoryId!,
                                                    postController.post[index]
                                                        .subCategoryId!);
                                              },
                                              icon: SvgPicture.asset(
                                                "assets/icons/trash.svg",
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkTextColor
                                                        : kTextColor,
                                              ),
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
