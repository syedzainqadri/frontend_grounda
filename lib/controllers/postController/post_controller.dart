// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/models/postModel/post_model.dart';
import 'package:frontend_grounda/utils/global_methods.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:location/location.dart';

class PostController extends GetxController {
  late FocusNode formFocus;
  late FocusNode titleFieldFocus;
  late FocusNode cityFieldFocus;
  late FocusNode areaFieldFocus;
  late FocusNode priceFieldFocus;

  var post = <PostModel>[].obs;
  var singlePost = SinglePostModel().obs;
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
  var postID = ''.obs;
  var catID = 0.obs;
  var subCatID = 0.obs;
  var selectedAmenitiesNames = [].obs;
  var selectedAmenitiesCodes = [].obs;
  var postAmenitiesNames = [].obs;
  var postAmenitiesCodes = [].obs;
  List purposeList = ["SELL", "RENT"];
  RxString purposeValue = 'SELL'.obs;
  RxString propertyAreaUnitValue = 'SQFT'.obs;
  List propertyAreaUnitList = ["MARLA", "SQFT", "SQMT"];
  var isPublished = false.obs;
  var hasInstallments = false.obs;
  var posessionReady = false.obs;
  var showContactDetials = false.obs;

  //<=================== Text Editing Controllers ==================>
  TextEditingController postTitleController = TextEditingController();
  TextEditingController totalAreaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController plotNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController videoUrlController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController noOfInstallmentController = TextEditingController();
  TextEditingController monthlyInstallmentController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    userId.value = int.parse(tokenHiveBox.get('userId'));
    getAll();
    getLocation();
    titleFieldFocus = FocusNode();
    cityFieldFocus = FocusNode();
    areaFieldFocus = FocusNode();
    priceFieldFocus = FocusNode();
    formFocus = FocusNode();
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

  Future<void> getPostById(String id) async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse('$baseUrl$getAllPost/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      singlePost.value = singlePostModelFromJson(response.body);
      postTitleController.text = singlePost.value.title!;
      totalAreaController.text = singlePost.value.totalAreaSize!;
      cityController.text = singlePost.value.city!;
      areaController.text = singlePost.value.area!;
      plotNumberController.text = singlePost.value.plotNumber!;
      priceController.text = singlePost.value.price!;
      videoUrlController.text = singlePost.value.video!;
      advanceController.text = singlePost.value.advanceAmount!;
      noOfInstallmentController.text =
          singlePost.value.noOfInstallments!.toString();
      monthlyInstallmentController.text = singlePost.value.monthlyInstallments!;
      bedroomController.text = singlePost.value.bedroooms!.toString();
      bathroomController.text = singlePost.value.bathroom!.toString();
      descriptionController.text = singlePost.value.longDescription!;
      imageUrl.value = jsonDecode(singlePost.value.galleryImages!);
      purposeValue.value = singlePost.value.purpose!;
      propertyAreaUnitValue.value = singlePost.value.areaSizeUnit!;
      postID.value = singlePost.value.id.toString();
      catID.value = singlePost.value.categoryId!;
      subCatID.value = singlePost.value.subCategoryId!;
      hasInstallments.value = singlePost.value.isInstallmentAvailable!;
      isPublished.value = singlePost.value.status!;
      posessionReady.value = singlePost.value.readyForPossession!;
      showContactDetials.value = singlePost.value.showContactDetails!;
      print(singlePost.value.amenitiesNames);
      print(singlePost.value.amenitiesIconCodes);
      postAmenitiesNames.value = jsonDecode(singlePost.value.amenitiesNames!);
      postAmenitiesCodes.value =
          jsonDecode(singlePost.value.amenitiesIconCodes!);

      print(postAmenitiesNames);
      print(postAmenitiesCodes);

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
      int subCategoryId,
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
      "subCategoryId": subCategoryId,
      "metaTitle": title,
      "metaDescription": description,
      "status": status,
      "slug": slug,
      "amenitiesIconCodes": amenitiesIconCodes,
      "amenitiesNames": amenitiesNames,
      "showContactDetails": showContactDetails,
      "purpose": purpose
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

  //Update Post

  Future<void> updatePost(
      String id,
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
      int subCategoryId,
      bool status,
      String slug) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
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
      "subCategoryId": subCategoryId,
      "metaTitle": title,
      "metaDescription": description,
      "status": status,
      "slug": slug,
      "amenitiesIconCodes": amenitiesIconCodes,
      "amenitiesNames": amenitiesNames,
      "showContactDetails": showContactDetails,
      "purpose": purpose
    };
    print(bodyPrepare);

    var response = await http.put(Uri.parse(baseUrl + updatePostUrl),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      post.value = postModelFromJson(response.body);
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
    int subCategoryId,
  ) async {
    var bodyPrepare = {
      "id": id,
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
      "subCategoryId": subCategoryId,
      "metaTitle": title,
      "metaDescription": description,
      "status": false,
      "amenitiesIconCodes": amenitiesIconCodes,
      "amenitiesNames": amenitiesNames,
      "showContactDetails": showContactDetails,
      "purpose": purpose
    };
    isLoading.value = true;
    var response = await http.put(Uri.parse(baseUrl + updatePostUrl),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      isLoading.value = false;
      showSuccessSnak('Softly Deleted',
          'This post has been updated as delted in the system');
    } else {
      showErrorSnak('Error', response.body);
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

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    postTitleController.text = '';
    totalAreaController.text = '';
    cityController.text = '';
    areaController.text = '';
    plotNumberController.text = '';
    priceController.text = '';
    videoUrlController.text = '';
    advanceController.text = '';
    noOfInstallmentController.text = '';
    monthlyInstallmentController.text = '';
    bedroomController.text = '';
    bathroomController.text = '';
    descriptionController.text = '';
    imageUrl.value = [];
    purposeValue.value = '';
    propertyAreaUnitValue.value = '';
    postID.value = '';
    catID.value = 0;
    subCatID.value = 0;
    hasInstallments.value = false;
    isPublished.value = false;
    posessionReady.value = false;
    showContactDetials.value = false;
    print(singlePost.value.amenitiesNames);
    print(singlePost.value.amenitiesIconCodes);
    postAmenitiesNames.value = [];
    postAmenitiesCodes.value = [];
    print(postAmenitiesNames);
    print(postAmenitiesCodes);
  }
}
