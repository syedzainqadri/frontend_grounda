// To parse this JSON data, do
//
//     final blogCategoryModel = blogCategoryModelFromJson(jsonString);

import 'dart:convert';

List<BlogCategoryModel> blogCategoryModelFromJson(String str) =>
    List<BlogCategoryModel>.from(
        json.decode(str).map((x) => BlogCategoryModel.fromJson(x)));

String blogCategoryModelToJson(List<BlogCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogCategoryModel {
  BlogCategoryModel({
    this.id,
    this.title,
    this.content,
    this.iconImage,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? content;
  String? iconImage;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BlogCategoryModel.fromJson(Map<String, dynamic> json) =>
      BlogCategoryModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        iconImage: json["iconImage"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "iconImage": iconImage,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
