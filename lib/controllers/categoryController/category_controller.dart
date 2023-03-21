import 'package:frontend_grounda/models/categoryModel/category_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var token = ''.obs;
  var category = <CategoryModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    print(token.value);
    getCategories();
  }

  Future<void> getCategories() async {
    var response = await http.get(Uri.parse(baseUrl + allCategory), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200) {
      print(response.body);
      category.value = categoryModelFromJson(response.body);
      print(category.length);
    } else {
      print(response.body);
    }
  }
}
