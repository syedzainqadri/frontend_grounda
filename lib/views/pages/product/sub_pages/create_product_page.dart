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
                          //Todo: write validation
                        },
                        titleFieldSubmitted: (value) {
                          //Todo: add what happens upon submit
                        },
                        priceController: productsController.priceController,
                        priceValidator: (value) {
                          //Todo: price Validator
                        },
                        productLifeController:
                            productsController.productLifeController,
                        productLifeValidator: (value) {
                          //Todo: lifeValidator
                        },
                        htmlEditorController: productsController.htmlController,
                        typeList: productsController.dropDownList
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        typeValue: 'STANDARD',
                        typeOnChange: (value) {
                          print('Type changed to $value');
                        },
                        statusValue: true,
                        statusChanges: (value) {},
                        onTap: () {},
                        formSubmit: () {},
                        cancelText: '',
                        buttonText: '',
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
