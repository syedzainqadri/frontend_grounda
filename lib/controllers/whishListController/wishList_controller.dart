// ignore_for_file: file_names

import 'dart:convert';
import 'package:frontend_grounda/models/wishListModel/whish_list_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class WishListController extends GetxController {
  var wishList = <WishListModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
  }

  Future<void> getWishListByUserId(String id) async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + wishListByUserId + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      wishList.value = wishListModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> addToWishList(int postId, int userId) async {
    isLoading.value = true;
    var bodyPrepare = {
      "postId": postId,
      "userId": userId,
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + addToWishListUrl,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      wishList.addAll(wishListModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> removeFromWishList(int postId, int userId) async {
    isLoading.value = true;
    var bodyPrepare = {
      "postId": postId,
      "userId": userId,
    };

    var response = await http.delete(
      Uri.parse(
        baseUrl + removeFromWishListUrl,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      var itemRemoved = jsonDecode(response.body);
      var user = itemRemoved['userId'];
      getWishListByUserId(user);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
