import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/models/agencyModel/agency_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

//Todo: Need to create an api for the customer
//NOTE: this should not be an agency any single buyer
//will be considered a customer
class CustomerController extends GetxController {
  late FocusNode formFocus;
  late FocusNode firstNameFocus;
  late FocusNode lastNameFocus;
  late FocusNode phoneFocus;
  late FocusNode phoneTwoFocus;
  late FocusNode dobFocus;
  late FocusNode whatsAppFocus;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode postCodeFocus;
  late FocusNode addressLineOneFocus;
  late FocusNode addressLineTwoFocus;
  var agencies = <AgencyModel>[].obs;
  var logo = ''.obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var countryCode = ''.obs;
  var countryName = 'PK'.obs;
  var isLoading = false.obs;
  var sell = false.obs;
  var rent = false.obs;
  var country = ''.obs;
  var state = ''.obs;
  var city = ''.obs;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Location location = Location();

  //Text Field Controllers

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phoneTwoController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController addressLineOneController =
      TextEditingController();
  final TextEditingController addressLineTwoController =
      TextEditingController();
  final TextEditingController whatsAppController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    formFocus = FocusNode();
    firstNameFocus = FocusNode();
    lastNameFocus = FocusNode();
    phoneFocus = FocusNode();
    phoneTwoFocus = FocusNode();
    dobFocus = FocusNode();
    whatsAppFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    postCodeFocus = FocusNode();
    addressLineOneFocus = FocusNode();
    addressLineTwoFocus = FocusNode();
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

  getAgencyLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/developers/logos/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        logo.value = value;
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
