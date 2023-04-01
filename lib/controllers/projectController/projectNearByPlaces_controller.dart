// ignore_for_file: file_names

import 'dart:convert';
import 'package:frontend_grounda/models/projectModel/project_near_by_places_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProjectNearByPlacesController extends GetxController {
  var projectNearByPlaces = <ProjectsNearByPlacesModel>[].obs;
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
        baseUrl + getProjectNearByPlaces,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      projectNearByPlaces.value =
          projectsNearByPlacesModelFromJson(response.body);
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
        baseUrl + getProjectNearByPlaces + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      projectNearByPlaces.value =
          projectsNearByPlacesModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String title,
    String longitude,
    String latitude,
    int projectId,
    String placeCategory,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "longitude": longitude,
      "latitude": latitude,
      "projectId": projectId,
      "placeCategory": placeCategory
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createProjectNearByPlaces,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      projectNearByPlaces
          .addAll(projectsNearByPlacesModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateProjectNearByPlaces(
    int id,
    String title,
    String longitude,
    String latitude,
    int projectId,
    String placeCategory,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "longitude": longitude,
      "latitude": latitude,
      "projectId": projectId,
      "placeCategory": placeCategory
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateProjectNearByPlacesUrl,
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
        baseUrl + deleteProjectNearByPlaces + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedProjectNearByPlaces = jsonDecode(response.body);
      var projectNearByPlaces = deletedProjectNearByPlaces['name'];
      Get.snackbar('Project Place Deleted',
          'The Project Place with name: $projectNearByPlaces has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
