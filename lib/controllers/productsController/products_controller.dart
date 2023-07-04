import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend_grounda/models/productModel/product_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  var products = <ProductsModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;

  TextEditingController searchProductController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
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
    if (response.statusCode == 200 && response.body != 'null') {
      products.value = productsModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> getbyId(String id) async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + allProduct + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      products.value = productsModelFromJson(response.body);
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
    String image,
    int productLifeInDays,
    String productType,
    String description,
    String status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "price": price,
      "salePrice": salesPrice,
      "image": image,
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
      products.addAll(productsModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updatePaymentMethod(
    int id,
    String title,
    double price,
    double salesPrice,
    String image,
    int productLifeInDays,
    String productType,
    String description,
    String status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "price": price,
      "salePrice": salesPrice,
      "image": image,
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
    String id,
  ) async {
    isLoading.value = true;
    var response = await http.delete(
      Uri.parse(
        baseUrl + deleteProduct + id,
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
