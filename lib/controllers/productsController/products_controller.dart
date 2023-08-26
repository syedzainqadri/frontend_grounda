import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_grounda/models/productModel/product_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  late FocusNode formFocus;
  late FocusNode titleFocus;
  late FocusNode priceFocus;
  late FocusNode salePriceFocus;
  var products = <ProductsModel>[].obs;
  var singleProduct = SingleProduct().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;
  var status = false.obs;
  var type = ''.obs;
  var description = ''.obs;
  var price = 0.0.obs;
  var salePrice = 0.0.obs;
  var productId = 0.obs;
  var typeValue = 'STANDARD'.obs;

  TextEditingController searchProductController = TextEditingController();
  TextEditingController productTitleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController productLifeController = TextEditingController();
  HtmlEditorController htmlController = HtmlEditorController();

  List dropDownList = [
    'HOT',
    'FEATURED',
    'TOP',
    'BUMPED',
    'STANDARD',
  ];

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    formFocus = FocusNode();
    titleFocus = FocusNode();
    priceFocus = FocusNode();
    salePriceFocus = FocusNode();
    getAll();
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + allProduct,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      products.value = productsModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> getbyId(int id) async {
    isLoading.value = true;
    print(id);
    var response = await http.get(
      Uri.parse(
        baseUrl + allProduct + id.toString(),
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      singleProduct.value = singleProductFromJson(response.body);
      productId.value = singleProduct.value.id!;

      productTitleController.text = singleProduct.value.title!;
      productLifeController.text =
          singleProduct.value.productLifeInDays!.toString();
      priceController.text = singleProduct.value.price.toString();
      salePriceController.text = singleProduct.value.salePrice.toString();
      status.value = singleProduct.value.status!;
      typeValue.value = singleProduct.value.productType!;
      // htmlController.insertText(singleProduct.value.description!);
      // description.value = await htmlController.getText();
      description.value = singleProduct.value.description!;
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String title,
    double price,
    double salesPrice,
    int productLifeInDays,
    String productType,
    String description,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "price": price,
      "salePrice": salesPrice,
      "productLifeInDays": productLifeInDays,
      "productType": productType,
      "description": description,
      "status": status
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createProduct,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      //add single product
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateProduct(
    int id,
    String title,
    double price,
    double salesPrice,
    int productLifeInDays,
    String productType,
    String description,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "price": price,
      "salePrice": salesPrice,
      "productLifeInDays": productLifeInDays,
      "productType": productType,
      "description": description,
      "status": status
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateProductUrl,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> delete(
    int id,
  ) async {
    isLoading.value = true;
    var response = await http.delete(
      Uri.parse(
        baseUrl + deleteProduct + id.toString(),
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedProduct = jsonDecode(response.body);
      var product = deletedProduct['title'];
      Get.snackbar('Product Deleted', 'The Product: $product has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
