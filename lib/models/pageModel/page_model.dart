// To parse this JSON data, do
//
//     final pagesModel = pagesModelFromJson(jsonString);

import 'dart:convert';

List<PagesModel> pagesModelFromJson(String str) =>
    List<PagesModel>.from(json.decode(str).map((x) => PagesModel.fromJson(x)));

String pagesModelToJson(List<PagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PagesModel {
  PagesModel({
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

  factory PagesModel.fromJson(Map<String, dynamic> json) => PagesModel(
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
