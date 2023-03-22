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
    String description,
    String featuredImage,
    String gallaryImages,
    String video,
    String longDescription,
    String longitude,
    String latitude,
    String content,
    String plotNumber,
    double price,
    String city,
    String area,
    bool isInstallmentAvailable,
    double advanceAmmount,
    int noOfInstallment,
    int monthlyInstallments,
    bool readyForPossession,
    int bedrooms,
    int bathrooms,
    String contactName,
    String contactEmail,
    String contactMobile,
    String contactLandline,
    String featureAndAmenities,
    String areaSizeUnit,
    int authorId,
    int categoryId,
    String metaTitle,
    String metaDescrption,
    String status,
    bool isPublished,
    String contactPersonType,
    int refrenceId,
    String slug,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "description": description,
      "featuredImages": featuredImage,
      "galleryImages": gallaryImages,
      "video": video,
      "longDescription": longDescription,
      "longitude": longitude,
      "latitude": latitude,
      "content": content,
      "plotNumber": plotNumber,
      "price": price,
      "city": city,
      "area": area,
      "isInstallmentAvailable": isInstallmentAvailable,
      "advanceAmount": advanceAmmount,
      "noOfInstallments": noOfInstallment,
      "monthlyInstallments": monthlyInstallments,
      "readyForPossession": readyForPossession,
      "bedroooms": bedrooms,
      "bathrooms": bathrooms,
      "contactName": contactName,
      "contactEmail": contactEmail,
      "contactMobile": contactMobile,
      "contactLandline": contactLandline,
      "featureAndAmenities": int,
      "areaSizeUnit": {
        "AreaSizeUnit": areaSizeUnit,
      },
      "authorId": authorId,
      "categoryId": categoryId,
      "metaTitle": metaTitle,
      "metaDescription": metaDescrption,
      "status": status,
      "published": isPublished,
      "contactPersonType": contactPersonType,
      "refrenceId": refrenceId,
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
        type: FileType.image,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (var i = 0; i < files.length; i++) {
        String fileName = result.files[i].name;
        var upload = await FirebaseStorage.instance
            .ref('uploads/categories/images/$fileName')
            .putFile(files[i]);
        final url = upload.ref.getDownloadURL().then((value) {
          imageUrl.add(value);
        });
      }
    }
  }
}
