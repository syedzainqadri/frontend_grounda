// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/productsController/products_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/product/widgets/product_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

class CreateProductPage extends GetView<ThemeChangeController> {
  CreateProductPage({Key? key}) : super(key: key);

  //<=============== Data Controllers ========================>

  ProductsController productsController = Get.find<ProductsController>();

  final _createProductFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;

  var subCategorySelectedItemId = 0.obs;

  List<dynamic> amenities = [false].obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Create Product'),
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
                    focusNode: productsController.formFocus,
                    child: Form(
                      key: _createProductFormKey,
                      child: ProductForm(
                        //Todo: add sale price controller validator and submit focus
                        productTitleController:
                            productsController.productTitleController,
                        titleFocus: productsController.titleFocus,
                        productTitleValidator: (value) {
                          if (value == null || value == '') {
                            return 'Title cannot be empty';
                          }
                        },
                        titleFieldSubmit: (value) {
                          FocusScope.of(context)
                              .requestFocus(productsController.priceFocus);
                        },
                        priceController: productsController.priceController,
                        priceFocus: productsController.priceFocus,
                        priceValidator: (value) {
                          if (value == null || value == '') {
                            return 'Price cannot be empty';
                          }
                        },
                        priceSubmit: (value) {
                          FocusScope.of(context)
                              .requestFocus(productsController.salePriceFocus);
                        },
                        salePriceController:
                            productsController.salePriceController,
                        salePriceFocus: productsController.salePriceFocus,
                        salePriceValidator: (value) {
                          if (productsController.priceController ==
                                  productsController.salePriceController ||
                              int.parse(productsController
                                      .salePriceController.text) <
                                  int.parse(productsController
                                      .priceController.text)) {
                            return 'Sale price cannot be equal or less than Price';
                          }
                        },
                        salePriceSubmit: (Value) {
                          // FocusScope.of(context)
                          // .requestFocus(productsController.priceFocus);
                        },
                        productLifeController:
                            productsController.productLifeController,
                        productLifeValidator: (value) {
                          if (value == Null || value == '') {
                            return 'Product Life cannot be Empty';
                          }
                        },
                        htmlEditorController: productsController.htmlController,
                        typeList: productsController.dropDownList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        typeValue: productsController.typeValue.value,
                        typeOnChange: (value) {
                          productsController.type.value = value;
                          productsController.typeValue.value = value;
                          print('Type changed to $value');
                        },
                        statusValue: productsController.status.value,
                        statusChanges: (value) {
                          productsController.status.value = value;
                        },
                        formSubmit: () async {
                          if (productsController.htmlController != '' ||
                              productsController.htmlController != null) {
                            productsController.description.value =
                                await productsController.htmlController
                                    .getText();
                          }
                          if (productsController.priceController != '' ||
                              productsController.priceController != null) {
                            // productsController.price.value ==
                            //     double.parse(
                            //         productsController.priceController.text);
                            // print(double.parse(
                            //     productsController.priceController.text));
                            productsController.price.value = double.parse(
                                productsController.priceController.text);
                            print(productsController.price.value);
                          }
                          if (productsController.salePriceController != '' ||
                              productsController.salePriceController != null) {
                            productsController.salePrice.value = double.parse(
                                productsController.salePriceController.text);
                            print(productsController.salePrice.value);
                          }
                          await productsController.create(
                            productsController.productTitleController.text,
                            productsController.price.value,
                            productsController.salePrice.value,
                            int.parse(
                                productsController.productLifeController.text),
                            productsController.type.value,
                            productsController.description.value,
                            productsController.status.value,
                          );
                          //Todo: submit function here
                        },
                        onTap: () {
                          Get.back();
                        },
                        cancelText: 'cancle',
                        buttonText: 'Submit',
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
