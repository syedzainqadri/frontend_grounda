import 'dart:convert';

import 'package:frontend_grounda/models/orderModel/order_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  var orders = <OrdersModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + allOrders,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      orders.value = ordersModelFromJson(response.body);
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
        baseUrl + allOrders + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      orders.value = ordersModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    double orderAmount,
    int paymentMethod,
    bool isProductUsed,
    double price,
    int userId,
    int productId,
    DateTime productExpireDate,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "orderAmount": orderAmount,
      "userId": userId,
      "paymentMethodId": paymentMethod,
      "price": price,
      "productId": productId,
      "isProductUsed": isProductUsed,
      "productExpireDate": productExpireDate
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createOrder,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      orders.addAll(ordersModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateForumPost(
    int id,
    double orderAmount,
    int paymentMethod,
    bool isProductUsed,
    double price,
    int userId,
    int productId,
    DateTime productExpireDate,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "orderAmount": orderAmount,
      "userId": userId,
      "paymentMethodId": paymentMethod,
      "price": price,
      "productId": productId,
      "isProductUsed": isProductUsed,
      "productExpireDate": productExpireDate
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateOrderUrl,
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
        baseUrl + deleteOrder + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedOrder = jsonDecode(response.body);
      var order = deletedOrder['id'];
      Get.snackbar('Order Deleted', 'The Order: $order has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
