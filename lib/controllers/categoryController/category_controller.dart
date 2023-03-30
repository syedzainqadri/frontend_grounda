// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:frontend_grounda/models/categoryModel/category_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var token = ''.obs;
  var category = <CategoryModel>[].obs;
  var subCategory = <SubCategoryModel>[].obs;
  // var singleCategory = CreateCategoryModel().obs;
  var selectedItemName = ''.obs;
  var subCategorySelectedItemName = '3bhk'.obs;
  var imageUrl = ''.obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    getCategories();
  }

  Future<void> getCategories() async {
    var response = await http.get(Uri.parse(baseUrl + allCategory), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      category.value = categoryModelFromJson(response.body);
      selectedItemName.value = category.first.name!;
    } else {}
  }

  Future<void> getSubCategories(String id) async {
    var response = await http
        .get(Uri.parse(baseUrl + allCategory + subCategoryUrl + id), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      print(response.body);
      subCategory.value = subCategoryModelFromJson(response.body);
      subCategorySelectedItemName.value = subCategory.first.name!;
    } else {}
  }

  Future<void> createNewCategory(
    String image,
    String name,
    String slug,
    String description,
    int parentId,
    bool status,
    String amenitiesIds,
  ) async {
    var bodyPrepare = {
      'image': image,
      'name': name,
      'slug': slug,
      'description': description,
      'parentId': parentId,
      'status': status,
      'amenitiesIds': amenitiesIds
    };
    var response = await http.post(Uri.parse(baseUrl + createCategory),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      var createdCategory = jsonDecode(response.body);
      var categoryName = createdCategory['name'];
      Get.snackbar(
          'Category Created', 'Category Name: $categoryName has been created',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  Future<void> updateThisCategory(
    int id,
    String image,
    String name,
    String slug,
    String description,
    int parentId,
    bool status,
  ) async {
    var bodyPrepare = {
      'id': id,
      'image': image,
      'name': name,
      'slug': slug,
      'description': description,
      'parentId': parentId,
      'published': status
    };
    var response = await http.put(Uri.parse(baseUrl + updateCategory),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      var createdCategory = jsonDecode(response.body);
      var categoryName = createdCategory['name'];
      Get.snackbar(
          'Category Updated', 'Category Name: $categoryName has been Updated',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      // singleCategory.value = createCategoryModelFromJson(response.body);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  Future<void> deleteThisCategory(int id) async {
    var uid = id.toString();
    var response = await http.delete(Uri.parse(baseUrl + deleteCategory + uid),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      var deletedCategory = jsonDecode(response.body);
      var categoryName = deletedCategory['name'];
      Get.snackbar(
          'Category Remved', 'Category name: $categoryName Has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/categories/images/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        imageUrl.value = value;
      });
    }
  }
}
