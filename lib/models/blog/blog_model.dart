// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.id,
    this.title,
    this.content,
    this.featuredImage,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.blogCategoryId,
    this.slugId,
    this.authorId,
  });

  int? id;
  String? title;
  String? content;
  String? featuredImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? status;
  int? blogCategoryId;
  int? slugId;
  int? authorId;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        featuredImage: json["featuredImage"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
        blogCategoryId: json["blogCategoryId"],
        slugId: json["slugId"],
        authorId: json["authorId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "featuredImage": featuredImage,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
        "blogCategoryId": blogCategoryId,
        "slugId": slugId,
        "authorId": authorId,
      };
}
