import 'dart:convert';
import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/models/projectModel/project_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';

class ProjectController extends GetxController {
  var project = <ProjectsModel>[].obs;
  var singleProject = SingleProjectModel().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var isLoading = false.obs;

  // variable defnation
  var imageUrl = [].obs;
  List purposeList = ["SELL", "RENT"];

  // GetX variables
  var projectID = 0.obs;
  var developerID = 0.obs;
  var catID = 0.obs;
  var token = ''.obs;
  var isPublished = 0.obs;

  var startingPrice = ''.obs;
  var endingPrice = ''.obs;
  var statusValue = true.obs;
  var projectNearByPlaces = 1.obs;

  RxString purposeValue = 'SELL'.obs;

  late FocusNode formFocus;
  late FocusNode projectLocalityFocus;
  late FocusNode titleFieldFocus;
  late FocusNode projectAddressFocus;
  late FocusNode cityFieldFocus;
  late FocusNode walkThroughFocus;

  //<=================== Text Editing Controllers ==================>
  TextEditingController projectTitleController = TextEditingController();
  TextEditingController projectAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController projectLocalityController = TextEditingController();
  TextEditingController startingPriceController = TextEditingController();
  TextEditingController endingPriceController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController noOfInstallmentController = TextEditingController();
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController walkThroughController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    getAll();
    projectLocalityFocus = FocusNode();
    projectLocalityFocus = FocusNode();
    titleFieldFocus = FocusNode();
    projectAddressFocus = FocusNode();
    formFocus = FocusNode();
    cityFieldFocus = FocusNode();
    walkThroughFocus = FocusNode();
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
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      singleProject.value = singleProjectModelFromJson(response.body);
      projectID.value = singleProject.value.id!;
      projectTitleController.text = singleProject.value.title!;
      projectAddressController.text = singleProject.value.address!;
      cityController.text = singleProject.value.city!;
      areaController.text = singleProject.value.area!;
      projectLocalityController.text = singleProject.value.locality!;
      startingPriceController.text = singleProject.value.startingPrice!;
      endingPriceController.text = singleProject.value.endingPrice!;
      descriptionController.text = singleProject.value.description!;
      walkThroughController.text = singleProject.value.walkthroughThreeD!;
      statusValue.value = singleProject.value.status!;
      imageUrl.value = jsonDecode(singleProject.value.gallery!);
      projectNearByPlaces.value = 1;
      catID.value = singleProject.value.categoryId!;
      developerID.value = singleProject.value.developerId!;
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  //MultiImage Picker
  getImage() async {
    List<File>? res = await ImagePickerWeb.getMultiImagesAsFile();
    if (res != null) {
      for (var i = 0; i < res.length; i++) {
        String fileName = res[i].name;
        var upload = await FirebaseStorage.instance
            .ref('uploads/project/images/$fileName')
            .putBlob(res[i]);
        final url = upload.ref.getDownloadURL().then((value) {
          imageUrl.add(value);
        });
      }
    }
  }

  Future<void> create(
    String title,
    String address,
    String description,
    String featuredImage,
    String gallery,
    String locality,
    String city,
    String area,
    int categoryId,
    int developerId,
    String startingPrice,
    String endingPrice,
    bool status,
    String walkthroughThreeD,
    int projectNearByPlaceId,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "address": address,
      "description": description,
      "featuredImage": featuredImage,
      "gallery": gallery,
      "locality": locality,
      "city": city,
      "area": area,
      "categoryId": categoryId,
      "developerId": developerId,
      "startingPrice": startingPrice,
      "endingPrice": endingPrice,
      "status": status,
      "walkthroughThreeD": walkthroughThreeD,
      "projectNearByPlaceId": projectNearByPlaceId
    };

    print("<=== body we are sending ===>");
    print(bodyPrepare);

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
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      // project.addAll(projectsModelFromJson(response.body));
      await getAll();
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
    String description,
    String featuredImage,
    String gallery,
    String locality,
    String city,
    String area,
    int categoryId,
    int developerId,
    String startingPrice,
    String endingPrice,
    bool status,
    String walkthroughThreeD,
    int projectNearByPlaceId,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "address": address,
      "description": description,
      "featuredImage": featuredImage,
      "gallery": gallery,
      "locality": locality,
      "city": city,
      "area": area,
      "categoryId": categoryId,
      "developerId": developerId,
      "startingPrice": startingPrice,
      "endingPrice": endingPrice,
      "status": status,
      "walkthroughThreeD": walkthroughThreeD,
      "projectNearByPlaceId": projectNearByPlaceId
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
        '$baseUrl$deleteProject/$id',
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
      Get.snackbar('Project Deleted', 'The Project has been deleted',
          snackPosition: SnackPosition.TOP,
          maxWidth: 400,
          icon: const Icon(Icons.delete),
          backgroundColor: Colors.red);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
