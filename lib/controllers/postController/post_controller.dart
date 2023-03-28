import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frontend_grounda/models/postModel/post_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var post = <PostModel>[].obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var isLoading = false.obs;
  var imageUrl = [];

  @override
  onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    getAll();
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl + getAllPost), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
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
      double price,
      String city,
      String area,
      bool isInstallmentAvailable,
      bool showContactDetails,
      double advanceAmmount,
      int noOfInstallements,
      double monthlyInstallment,
      bool readyForPossession,
      String areaSizeUnit,
      int bedrooms,
      int bathrooms,
      String featureAndAmenities,
      int categoryId,
      int authorId,
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
      "featureAndAmenities": featureAndAmenities,
      "areaSizeUnit": {
        "AreaSizeUnit": areaSizeUnit,
      },
      "authorId": authorId,
      "categoryId": categoryId,
      "metaTitle": title,
      "metaDescription": description,
      "status": status,
      "slug": slug
    };

    var response = await http.post(Uri.parse(baseUrl + createPost),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200 && response.body != 'null') {
      post.value = postModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      List<File> files =
          result.files.map((path) => File(path.toString())).toList();
      for (var i = 0; i < files.length; i++) {
        String fileName = result.files[i].name;
        var upload = await FirebaseStorage.instance
            .ref('uploads/post/images/$fileName')
            .putFile(files[i]);
        final url = upload.ref.getDownloadURL().then((value) {
          imageUrl.add(value);
        });
      }
    }
  }
}
