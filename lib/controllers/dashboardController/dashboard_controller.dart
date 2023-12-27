import 'package:frontend_grounda/models/postModel/post_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

//Todo: Need to create an api for the customer
//NOTE: this should not be an agency any single buyer
//will be considered a customer
class DashboardController extends GetxController {
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;
  var postModel = <PostModel>[].obs;
  var activePost = <PostModel>[].obs;
  var percentage = 0.0.obs;
  var totalPostCount = 120.obs;
  var totalPublishedPostCount = 90.obs;
  var totalPendingPostCount = 30.obs;

  //Text Field Controllers

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
        baseUrl + getAllPost,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      postModel.value = postModelFromJson(response.body);
      // print("<======= length of post is ========>");
      // print(postModel.length);
      // print(postModel.value[6].status);
      for (var i = 0; i < postModel.length; i++) {
        if (postModel[i].status == true) {
          activePost.add(postModel[i]);
        }
      }
      // print(activePost.length);
      isLoading.value = false;
      calculatePercentage();
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  void calculatePercentage() {
    percentage.value = (activePost.length / postModel.length) * 100;
    // print('======== percentage is =======');
    // print(percentage.value);
  }
}
