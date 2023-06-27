import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/models/agencyModel/agency_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class AgencyController extends GetxController {
  late FocusNode formFocus;
  late FocusNode agencyOwnerNameFieldFocus;
  late FocusNode agencyEmailFieldFocus;
  late FocusNode agencyPhoneFieldFocus;
  late FocusNode agencyPasswordFieldFocus;
  var agencies = <AgencyModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var logo = ''.obs;
  var banner = ''.obs;
  var token = ''.obs;
  var countryCode = ''.obs;
  var countryName = 'PK'.obs;
  var isLoading = false.obs;
  var sell = false.obs;
  var rent = false.obs;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Location location = Location();
  var country = ''.obs;
  var state = ''.obs;
  var city = ''.obs;
  var userId = 0.obs;

  TextEditingController agencyNameController = TextEditingController();
  TextEditingController agencyOwnerNameController = TextEditingController();
  TextEditingController agencyEmailController = TextEditingController();
  TextEditingController agencyPhoneController = TextEditingController();
  TextEditingController agencyPasswordController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController agencyAddressController = TextEditingController();
  HtmlEditorController htmlEditorController = HtmlEditorController();

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    userId.value = int.parse(tokenHiveBox.get('userId'));
    formFocus = FocusNode();
    agencyOwnerNameFieldFocus = FocusNode();
    agencyEmailFieldFocus = FocusNode();
    agencyPhoneFieldFocus = FocusNode();
    agencyPasswordFieldFocus = FocusNode();
    getAll();
    getLocation();
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
      print('this is getting error here');
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

  Future<bool> create(
      String title,
      String ownerName,
      String description,
      String logoImage,
      String featuredImage,
      String email,
      String mobile,
      String address,
      String country,
      String state,
      String city,
      String purpose,
      String propertyType,
      int userId,
      String slug,
      bool status) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "ownerName": ownerName,
      "description": description,
      "logoImage": logoImage,
      "featuredImage": featuredImage,
      "email": email,
      "country": country,
      "address": address,
      "state": state,
      "city": city,
      "mobile": mobile,
      "userID": userId,
      "purpose": purpose,
      "propertyType": propertyType,
      "slug": slug,
      "status": status
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
      getAll();
      isLoading.value = false;
      return true;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
      return false;
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

  getAgencyLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/agency/logos/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        logo.value = value;
      });
    }
  }

  getAgencyBanner() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/agency/banners/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        banner.value = value;
      });
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
