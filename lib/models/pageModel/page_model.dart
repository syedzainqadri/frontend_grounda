// To parse this JSON data, do
//
//     final pageModel = pageModelFromJson(jsonString);

import 'dart:convert';

PageModel pageModelFromJson(String str) => PageModel.fromJson(json.decode(str));

String pageModelToJson(PageModel data) => json.encode(data.toJson());

class PageModel {
  PageModel({
    this.id,
    this.title,
    this.content,
    this.featuredImage,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.slugId,
  });

  int? id;
  String? title;
  String? content;
  String? featuredImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? status;
  int? slugId;

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        featuredImage: json["featuredImage"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        slugId: json["slugId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "featuredImage": featuredImage,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "slugId": slugId,
      };
}
