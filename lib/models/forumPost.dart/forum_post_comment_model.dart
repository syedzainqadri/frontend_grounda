// To parse this JSON data, do
//
//     final forumPostCommentModel = forumPostCommentModelFromJson(jsonString);

import 'dart:convert';

List<ForumPostCommentModel> forumPostCommentModelFromJson(String str) =>
    List<ForumPostCommentModel>.from(
        json.decode(str).map((x) => ForumPostCommentModel.fromJson(x)));

String forumPostCommentModelToJson(List<ForumPostCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForumPostCommentModel {
  ForumPostCommentModel({
    this.id,
    this.postReplyTitle,
    this.postReplyDescription,
    this.createdAt,
    this.updatedAt,
    this.forumPostId,
    this.userId,
  });

  int? id;
  String? postReplyTitle;
  String? postReplyDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? forumPostId;
  int? userId;

  factory ForumPostCommentModel.fromJson(Map<String, dynamic> json) =>
      ForumPostCommentModel(
        id: json["id"],
        postReplyTitle: json["postReplyTitle"],
        postReplyDescription: json["postReplyDescription"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        forumPostId: json["forumPostId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postReplyTitle": postReplyTitle,
        "postReplyDescription": postReplyDescription,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "forumPostId": forumPostId,
        "userId": userId,
      };
}
