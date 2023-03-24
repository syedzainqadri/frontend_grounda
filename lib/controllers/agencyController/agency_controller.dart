import 'dart:convert';
import 'package:frontend_grounda/models/agencyModel/agency_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;

class AgencyController extends GetxController {
  var agencies = <AgencyModel>[].obs;
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
        baseUrl + getAgency,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      agencies.value = agencyModelFromJson(response.body);
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
        baseUrl + getAgency + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      agencies.value = agencyModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String title,
    String companyTitle,
    String ownerName,
    String ownerMessage,
    String ownerProfilePic,
    String ownerDesignation,
    String country,
    String email,
    String website,
    String address,
    String description,
    String mobile,
    String landLine,
    String whatsApp,
    int userId,
    String featuredImage,
    String logoImage,
    String slug,
    int refrenceId,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "companyTitle": companyTitle,
      "ownerName": ownerName,
      "ownerMessage": ownerMessage,
      "ownerProfilePic": ownerProfilePic,
      "ownerDesignation": ownerDesignation,
      "country": country,
      "email": email,
      "website": website,
      "address": address,
      "description": description,
      "mobile": mobile,
      "landLine": landLine,
      "whatsapp": whatsApp,
      "userID": 1,
      "featuredImage": featuredImage,
      "logoImage": logoImage,
      "slug": slug,
      "refrenceId": refrenceId
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createAgency,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      agencies.addAll(agencyModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateAgency(
    int id,
    String title,
    String companyTitle,
    String ownerName,
    String ownerMessage,
    String ownerProfilePic,
    String ownerDesignation,
    String country,
    String email,
    String website,
    String address,
    String description,
    String mobile,
    String landLine,
    String whatsApp,
    int userId,
    String featuredImage,
    String logoImage,
    String slug,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "companyTitle": companyTitle,
      "ownerName": ownerName,
      "ownerMessage": ownerMessage,
      "ownerProfilePic": ownerProfilePic,
      "ownerDesignation": ownerDesignation,
      "country": country,
      "email": email,
      "website": website,
      "address": address,
      "description": description,
      "mobile": mobile,
      "landLine": landLine,
      "whatsapp": whatsApp,
      "userID": 1,
      "featuredImage": featuredImage,
      "logoImage": logoImage,
      "slug": slug,
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateAgencyUrl,
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
        baseUrl + deleteAgency + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedAgency = jsonDecode(response.body);
      var agency = deletedAgency['name'];
      Get.snackbar(
          'Agency Deleted', 'The Agency with name: $agency has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
