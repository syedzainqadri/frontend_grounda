import 'dart:convert';

import 'package:frontend_grounda/models/amenetiesModel/ameneties_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class AmenitiesController extends GetxController {
  var amenities = <AmenitiesModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;
  var iconImageUrl = ''.obs;

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
        baseUrl + getAmenities,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      amenities.value = amenitiesModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  // Future<void> getbyId(String id) async {
  //   isLoading.value = true;
  //   var response = await http.get(
  //     Uri.parse(
  //       baseUrl + getAmenities + id,
  //     ),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $token"
  //     },
  //   );
  //   if (response.statusCode == 200 && response.body != 'null') {
  //     amenities.value = amenitiesModelFromJson(response.body);
  //     isLoading.value = false;
  //   } else {
  //     Get.snackbar('Error', response.body,
  //         snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
  //     isLoading.value = false;
  //   }
  // }

  Future<void> create(
    String name,
    String description,
    String icon,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "name": name,
      "description": description,
      "status": status,
      "icon": icon
    };
    print(bodyPrepare);
    var response = await http.post(
      Uri.parse(
        baseUrl + createAmenities,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200 && response.body != 'null') {
      showSuccessSnak('Success', 'Amenity Created Sucessfully');
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateAmenities(
    int id,
    String name,
    String description,
    String icon,
    bool status,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "name": name,
      "description": description,
      "status": status,
      "icon": icon
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateAmenites,
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
    int id,
  ) async {
    isLoading.value = true;
    var response = await http.delete(
      Uri.parse(
        baseUrl + deleteAmenities + id.toString(),
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedAmenities = jsonDecode(response.body);
      var amenities = deletedAmenities['name'];
      Get.snackbar('Amenity Deleted',
          'The Amenity with name: $amenities has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  // getIcon() async {
  //   FilePickerResult? result = await FilePicker.platform
  //       .pickFiles(allowedExtensions: ['svg'], type: FileType.custom);
  //   if (result != null) {
  //     Uint8List fileBytes = result.files.first.bytes!;
  //     String fileName = result.files.first.name;

  //     // Upload file
  //     var upload = await FirebaseStorage.instance
  //         .ref('uploads/amenities/icon/$fileName')
  //         .putData(fileBytes);
  //     final url = upload.ref.getDownloadURL().then((value) {
  //       iconImageUrl.value = value;
  //       print(iconImageUrl.value);
  //     });
  //   }
  // }
}
