import 'package:frontend_grounda/models/categoryModel/category_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var token = ''.obs;
  var category = <CategoryModel>[].obs;
  var selectedItem = ''.obs;
  var selectedItemId = 0.obs;
  List<String> items = <String>[].obs;
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
      category.value = categoryModelFromJson(response.body);
    } else {
      print(response.body);
    }
  }
}
