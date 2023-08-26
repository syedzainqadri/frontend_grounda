import 'dart:convert';
import 'package:frontend_grounda/models/projectModel/project_near_by_places_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ProjectNearByPlacesController extends GetxController {
  var projectNearByPlace = <ProjectsNearByPlacesModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var selectedItemName = ''.obs;
  var token = ''.obs;
  var isLoading = false.obs;
  var iconImageUrl = ''.obs;

  RxList<String> projectNearByPlacesNames = <String>[].obs;
  RxList<String> projectNearByPlacesCodes = <String>[].obs;

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
        baseUrl + getProjectNearByPlaces,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      projectNearByPlace.value =
          projectsNearByPlacesModelFromJson(response.body);
      selectedItemName.value = projectNearByPlace.first.name!;
      print(projectNearByPlace.length);
      isLoading.value = false;
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> create(
    String name,
    String icon,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {"title": name, "status": status, "icon": icon};
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
      showSuccessSnak('Success', 'Project Place Created Sucessfully');
      isLoading.value = false;
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> updateProjectNearByPlaces(
    int id,
    String name,
    String icon,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {"id": id, "title": name, "status": status, "icon": icon};

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
      showSuccessSnak('Success', 'Project Place Updated Sucessfully');
      isLoading.value = false;
    } else {
      showErrorSnak('Error', response.body);
    }
  }

  Future<void> delete(
    int id,
  ) async {
    isLoading.value = true;
    var response = await http.delete(
      Uri.parse(
        '$baseUrl$deleteProjectNearByPlaces/$id',
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedProjectPlace = jsonDecode(response.body);
      var ProjectPlace = deletedProjectPlace['name'];
      showDeleteSnak('Project Place Deleted',
          'The Project Palce with name: $ProjectPlace has been deleted');
      isLoading.value = false;
    } else {
      showErrorSnak('Error', response.body);
    }
  }
}
