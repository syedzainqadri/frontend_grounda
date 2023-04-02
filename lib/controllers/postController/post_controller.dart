// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frontend_grounda/models/postModel/post_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:location/location.dart';

class PostController extends GetxController {
  var post = <PostModel>[].obs;
  Location location = Location();
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;
  var imageUrl = [].obs;
  var userId = 0.obs;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  @override
  onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    userId.value = int.parse(tokenHiveBox.get('userId'));
    getAll();
    getLocation();
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(baseUrl + getAllPost),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      post.value = postModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
      String title,
      int propertyNumber,
      String description,
      String featuredImage,
      String gallerImages,
      String video,
      String longDescription,
      String longitude,
      String latitude,
      String plotNumber,
      String price,
      String city,
      String area,
      bool isInstallmentAvailable,
      bool showContactDetails,
      String advanceAmmount,
      int noOfInstallements,
      String monthlyInstallment,
      bool readyForPossession,
      String areaSizeUnit,
      String purpose,
      String totalAreaSize,
      int bedrooms,
      int bathrooms,
      String amenitiesIconCodes,
      String amenitiesNames,
      int categoryId,
      bool status,
      String slug) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "propertyNumber": propertyNumber,
      "description": description,
      "featuredImages": featuredImage,
      "galleryImages": gallerImages,
      "video": video,
      "longDescription": longDescription,
      "longitude": longitude,
      "latitude": latitude,
      "plotNumber": plotNumber,
      "price": price,
      "city": city,
      "area": area,
      "isInstallmentAvailable": isInstallmentAvailable,
      "advanceAmount": advanceAmmount,
      "noOfInstallments": noOfInstallements,
      "monthlyInstallments": monthlyInstallment,
      "readyForPossession": readyForPossession,
      "bedroooms": bedrooms,
      "bathrooms": bathrooms,
      "areaSizeUnit": {
        "AreaSizeUnit": areaSizeUnit,
      },
      "totalAreaSize": totalAreaSize,
      "authorId": userId.value,
      "categoryId": categoryId,
      "metaTitle": title,
      "metaDescription": description,
      "status": status,
      "slug": slug,
      "amenitiesIconCodes": amenitiesIconCodes,
      "amenitiesNames": amenitiesNames,
      "showContactDetails": showContactDetails,
      "purpose": purpose
      //TODO: Check Spellings
    };
    print(bodyPrepare);

    var response = await http.post(Uri.parse(baseUrl + createPost),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      post.value = postModelFromJson(response.body);
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
            .ref('uploads/post/images/$fileName')
            .putBlob(res[i]);
        final url = upload.ref.getDownloadURL().then((value) {
          imageUrl.add(value);
        });
      }
    }
  }

  Future<void> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    latitude.value = _locationData.latitude!;
    longitude.value = _locationData.longitude!;
    print("latitude = $latitude longitude = $longitude");
  }
}
