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

class ProductPage extends GetView<ThemeChangeController> {
  ProductPage({Key? key}) : super(key: key);
  final TextEditingController searchCategory = TextEditingController();
  QuillEditorController contentController = QuillEditorController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productShortDescriptionController =
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
  PostController productController = Get.find<PostController>();
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
      appBar: DashBoardAppBar(title: 'Products'),
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
                              hintText: "Search Product",
                              labelText: "Search",
                              isPassword: false,
                              suffixIcon:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                          DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkColor,
                            buttonText: "Create Product",
                            width: width * .12,
                            height: height * .05,
                            onPressed: () {
                              Get.toNamed('/product/create');
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
                          itemCount: productController.post.length,
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
                                                  child: productController
                                                              .post[index]
                                                              .featuredImages !=
                                                          null
                                                      ? Image.network(
                                                          productController
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
                                                    productController
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
                                                      productController
                                                                  .post[index]
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
                                                await productController
                                                    .getPostById(
                                                  productController
                                                      .post[index].id
                                                      .toString(),
                                                );
                                                Get.toNamed('/product/create');
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                print(
                                                    'product deleted pressed');
                                                print(productController
                                                    .post[index].id!
                                                    .toString());
                                                print(productController
                                                    .post[index].title);
                                                print(productController
                                                    .post[index]
                                                    .propertyNumber);
                                                print(productController
                                                    .post[index].description);
                                                print(productController
                                                    .post[index]
                                                    .featuredImages);
                                                print(productController
                                                    .post[index].galleryImages);
                                                print(productController
                                                    .post[index]
                                                    .longDescription);
                                                print(productController
                                                    .post[index].longitude);
                                                print(productController
                                                    .post[index].latitude);
                                                print(productController
                                                    .post[index]
                                                    .propertyNumber);
                                                print(productController
                                                    .post[index].price);
                                                print(productController
                                                    .post[index].city);
                                                print(productController
                                                    .post[index].area);
                                                print(productController
                                                    .post[index]
                                                    .isInstallmentAvailable);
                                                print(productController
                                                    .post[index]
                                                    .showContactDetails);
                                                print(productController
                                                    .post[index].advanceAmount);
                                                print(productController
                                                    .post[index]
                                                    .noOfInstallments);
                                                print(productController
                                                    .post[index]
                                                    .monthlyInstallments);
                                                print(productController
                                                    .post[index]
                                                    .readyForPossession);
                                                print(productController
                                                    .post[index].areaSizeUnit);
                                                print(productController
                                                    .post[index].purpose);
                                                print(productController
                                                    .post[index]
                                                    .amenitiesIconCodes);
                                                print(productController
                                                    .post[index]
                                                    .amenitiesNames);
                                                print(productController
                                                    .post[index].categoryId);
                                                await productController.delete(
                                                    productController
                                                        .post[index].id!
                                                        .toString(),
                                                    productController
                                                        .post[index].title!,
                                                    productController
                                                        .post[index]
                                                        .propertyNumber!,
                                                    productController
                                                        .post[index]
                                                        .description!,
                                                    productController
                                                        .post[index]
                                                        .featuredImages!,
                                                    productController
                                                        .post[index]
                                                        .galleryImages!,
                                                    productController
                                                        .post[index].video!,
                                                    productController
                                                        .post[index]
                                                        .longDescription!,
                                                    productController
                                                        .post[index].longitude!,
                                                    productController
                                                        .post[index].latitude!,
                                                    productController
                                                        .post[index]
                                                        .plotNumber!,
                                                    productController
                                                        .post[index].price!,
                                                    productController
                                                        .post[index].city!,
                                                    productController
                                                        .post[index].area!,
                                                    productController
                                                        .post[index]
                                                        .isInstallmentAvailable!,
                                                    productController
                                                        .post[index]
                                                        .showContactDetails!,
                                                    productController
                                                        .post[index]
                                                        .advanceAmount!,
                                                    productController
                                                        .post[index]
                                                        .noOfInstallments!,
                                                    productController
                                                        .post[index]
                                                        .monthlyInstallments!,
                                                    productController
                                                        .post[index]
                                                        .readyForPossession!,
                                                    productController
                                                        .post[index]
                                                        .areaSizeUnit!,
                                                    productController
                                                        .post[index].purpose!,
                                                    productController
                                                        .post[index]
                                                        .totalAreaSize!,
                                                    productController
                                                        .post[index].bedroooms!,
                                                    productController
                                                        .post[index].bathroom!,
                                                    productController
                                                        .post[index]
                                                        .amenitiesIconCodes!,
                                                    productController
                                                        .post[index]
                                                        .amenitiesNames!,
                                                    productController
                                                        .post[index]
                                                        .categoryId!,
                                                    productController
                                                        .post[index]
                                                        .subCategoryId!);
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
