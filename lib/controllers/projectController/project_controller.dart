import 'dart:convert';

import 'package:frontend_grounda/models/projectModel/project_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProjectController extends GetxController {
  var project = <ProjectsModel>[].obs;
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
        baseUrl + allProject,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      project.value = projectsModelFromJson(response.body);
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
        baseUrl + allProject + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      project.value = projectsModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String title,
    String address,
    String featuredImage,
    String gallery,
    String locality,
    String city,
    int categoryId,
    int developerId,
    double startingPrice,
    double endingPrice,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "address": address,
      "featuredImage": featuredImage,
      "gallery": gallery,
      "locality": locality,
      "city": city,
      "categoryId": categoryId,
      "developerId": developerId,
      "startingPrice": startingPrice,
      "endingPrice": endingPrice
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createProject,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      project.addAll(projectsModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateProject(
    int id,
    String title,
    String address,
    String featuredImage,
    String gallery,
    String locality,
    String city,
    int categoryId,
    int developerId,
    double startingPrice,
    double endingPrice,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "address": address,
      "featuredImage": featuredImage,
      "gallery": gallery,
      "locality": locality,
      "city": city,
      "categoryId": categoryId,
      "developerId": developerId,
      "startingPrice": startingPrice,
      "endingPrice": endingPrice
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateProjectUrl,
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
        baseUrl + deleteProject + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedProjects = jsonDecode(response.body);
      var projects = deletedProjects['name'];
      Get.snackbar('Project Deleted',
          'The Project with name: $projects has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
