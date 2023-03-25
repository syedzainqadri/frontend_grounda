import 'dart:convert';

import 'package:frontend_grounda/models/forumPost.dart/forum_post_comment_model.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ForumPostCommentController extends GetxController {
  var forumPostsComments = <ForumPostCommentModel>[].obs;
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
        baseUrl + allForumPostComment,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      forumPostsComments.value = forumPostCommentModelFromJson(response.body);
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
        baseUrl + allForumPostComment + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      forumPostsComments.value = forumPostCommentModelFromJson(response.body);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> create(
    String title,
    String postType,
    String description,
    int userId,
    int forumPostId,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "postReplyTitle": title,
      "postReplyType": postType,
      "postReplyDescription": description,
      "userId": userId,
      "forumPostId": forumPostId
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createForumPostComment,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      forumPostsComments.addAll(forumPostCommentModelFromJson(response.body));
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> updateFloorPlan(
    int id,
    String title,
    String postType,
    String description,
    int userId,
    int forumPostId,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "postReplyTitle": title,
      "postReplyType": postType,
      "postReplyDescription": description,
      "userId": userId,
      "forumPostId": forumPostId
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateForumPostCommentUrl,
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
        baseUrl + deleteForumPostComment + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedForumPostComment = jsonDecode(response.body);
      var forumPostComment = deletedForumPostComment['title'];
      Get.snackbar(
          'Comment Deleted', 'The Comment: $forumPostComment has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }
}
