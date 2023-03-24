// To parse this JSON data, do
//
//     final postCommentModel = postCommentModelFromJson(jsonString);

import 'dart:convert';

List<PostCommentModel> postCommentModelFromJson(String str) =>
    List<PostCommentModel>.from(
        json.decode(str).map((x) => PostCommentModel.fromJson(x)));

String postCommentModelToJson(List<PostCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostCommentModel {
  PostCommentModel({
    this.id,
    this.postReplyTitle,
    this.postReplyDescription,
    this.createdAt,
    this.updatedAt,
    this.postId,
    this.userId,
  });

  int? id;
  String? postReplyTitle;
  String? postReplyDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? postId;
  int? userId;

  factory PostCommentModel.fromJson(Map<String, dynamic> json) =>
      PostCommentModel(
        id: json["id"],
        postReplyTitle: json["postReplyTitle"],
        postReplyDescription: json["postReplyDescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        postId: json["postId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postReplyTitle": postReplyTitle,
        "postReplyDescription": postReplyDescription,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "postId": postId,
        "userId": userId,
      };
}
