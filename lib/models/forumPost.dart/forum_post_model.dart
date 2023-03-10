// To parse this JSON data, do
//
//     final formPost = formPostFromJson(jsonString);

import 'dart:convert';

FormPost formPostFromJson(String str) => FormPost.fromJson(json.decode(str));

String formPostToJson(FormPost data) => json.encode(data.toJson());

class FormPost {
  FormPost({
    this.id,
    this.postTitle,
    this.postType,
    this.postDescription,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.slugId,
  });

  int? id;
  String? postTitle;
  String? postType;
  String? postDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? slugId;

  factory FormPost.fromJson(Map<String, dynamic> json) => FormPost(
        id: json["id"],
        postTitle: json["postTitle"],
        postType: json["postType"],
        postDescription: json["postDescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        slugId: json["slugId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postTitle": postTitle,
        "postType": postType,
        "postDescription": postDescription,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "slugId": slugId,
      };
}
