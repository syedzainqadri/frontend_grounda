// To parse this JSON data, do
//
//     final formPostComment = formPostCommentFromJson(jsonString);

import 'dart:convert';

FormPostComment formPostCommentFromJson(String str) =>
    FormPostComment.fromJson(json.decode(str));

String formPostCommentToJson(FormPostComment data) =>
    json.encode(data.toJson());

class FormPostComment {
  FormPostComment({
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

  factory FormPostComment.fromJson(Map<String, dynamic> json) =>
      FormPostComment(
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
