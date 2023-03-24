// To parse this JSON data, do
//
//     final forumPostModel = forumPostModelFromJson(jsonString);

import 'dart:convert';

List<ForumPostModel> forumPostModelFromJson(String str) =>
    List<ForumPostModel>.from(
        json.decode(str).map((x) => ForumPostModel.fromJson(x)));

String forumPostModelToJson(List<ForumPostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForumPostModel {
  ForumPostModel({
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

  factory ForumPostModel.fromJson(Map<String, dynamic> json) => ForumPostModel(
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
