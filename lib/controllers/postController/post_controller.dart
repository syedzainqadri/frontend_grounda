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

  getImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
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
