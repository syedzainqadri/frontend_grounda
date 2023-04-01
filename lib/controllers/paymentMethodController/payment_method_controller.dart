import 'dart:convert';

import 'package:frontend_grounda/models/paymentMethodModel/payment_method_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class PaymentMethodController extends GetxController {
  var paymentMethods = <AllPaymentMethodsModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    getAll();
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + allPaymentMethod,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200 && response.body != 'null') {
      paymentMethods.value = allPaymentMethodsModelFromJson(response.body);
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
        baseUrl + allPaymentMethod + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      paymentMethods.value = allPaymentMethodsModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String name,
    String apiKey,
    String apiSecret,
    String status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "name": name,
      "apiKey": apiKey,
      "secret": apiSecret,
      "status": status
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createPaymentMethod,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      paymentMethods.addAll(allPaymentMethodsModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updatePaymentMethod(
    int id,
    String name,
    String apiKey,
    String apiSecret,
    String status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "name": name,
      "apiKey": apiKey,
      "secret": apiSecret,
      "status": status
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updatePaymentMethodUrl,
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
        baseUrl + deletePaymentMethod + id.toString(),
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedPM = jsonDecode(response.body);
      var pm = deletedPM['name'];
      Get.snackbar(
          'Payment Method Deleted', 'The Payment Method: $pm has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
