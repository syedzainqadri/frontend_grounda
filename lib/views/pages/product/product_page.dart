// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:frontend_grounda/controllers/productsController/products_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/darkmode/text_fields.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ThemeChangeController> {
  ProductPage({Key? key}) : super(key: key);
  final TextEditingController searchProduct = TextEditingController();
  ProductsController productController = Get.find<ProductsController>();
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
                              textEditingController: searchProduct,
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
                          itemCount: productController.products.length,
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
                                                        .products[index].title!,
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
                                                                  .products[
                                                                      index]
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
                                                //Todo: add edit function here
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                //Todo: add delete Function here
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
