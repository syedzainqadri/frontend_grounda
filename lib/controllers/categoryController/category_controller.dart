// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:frontend_grounda/models/categoryModel/category_model.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var token = ''.obs;
  var category = <CategoryModel>[].obs;
  var subCategory = <SubCategoryModel>[].obs;
  var singleCategory = SingleCategoryModel().obs;
  var selectedItemName = ''.obs;
  var subCategorySelectedItemName = '3bhk'.obs;
  var imageUrl = ''.obs;
  var amenitiesId = [].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  RxList<String> listOfAmenitiesNames = <String>[].obs;
  RxList<String> listOfAmenitiesCodes = <String>[].obs;

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
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> getSubCategories(String id) async {
    var response = await http
        .get(Uri.parse(baseUrl + allCategory + subCategoryUrl + id), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      subCategory.value = subCategoryModelFromJson(response.body);
      subCategorySelectedItemName.value = subCategory.first.name!;
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> getAmenitiesIds(String id) async {
    var response = await http.get(Uri.parse(baseUrl + allCategory + id),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    if (response.statusCode == 200) {
      singleCategory.value = singleCategoryModelFromJson(response.body);
      print("====== BEFORE LIST EQULIZATION ========");
      print(singleCategory.value.amenitiesNames);
      print(singleCategory.value.amenitiesIconCodes);
      listOfAmenitiesNames.value =
          singleCategory.value.amenitiesNames!.split(",");
      listOfAmenitiesCodes.value =
          singleCategory.value.amenitiesIconCodes!.split(",");
      print("======== List of Amenities ===========");
      print(listOfAmenitiesNames);
      print(listOfAmenitiesCodes);
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> createNewCategory(
    String image,
    String name,
    String slug,
    String description,
    int parentId,
    bool status,
    String amenitiesNames,
    String amenitiesIcons,
  ) async {
    var bodyPrepare = {
      'image': image,
      'name': name,
      'slug': slug,
      'description': description,
      'parentId': parentId,
      'status': status,
      'amenitiesNames': amenitiesNames,
      'amenitiesCode': amenitiesIcons
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
      showSuccessSnak(
        'Category Created',
        'Category Name: $categoryName has been created',
      );
    } else {
      showErrorSnak('Error', response.body);
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
    String amenitiesNames,
    String amenitiesIcons,
  ) async {
    var bodyPrepare = {
      'image': image,
      'name': name,
      'slug': slug,
      'description': description,
      'parentId': parentId,
      'status': status,
      'amenitiesNames': amenitiesNames,
      'amenitiesCode': amenitiesIcons
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
      showSuccessSnak(
        'Category Updated',
        'Category Name: $categoryName has been Updated',
      );
    } else {
      showErrorSnak('Error', response.body);
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
      showSuccessSnak(
        'Category Remved',
        'Category name: $categoryName Has been deleted',
      );
    } else {
      showErrorSnak('Error', response.body);
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
      final url = upload.ref.getDownloadURL().then(
        (value) {
          imageUrl.value = value;
        },
      );
    }
  }
}
