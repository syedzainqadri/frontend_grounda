import 'dart:convert';

// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.parentId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.amenitiesIds,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  int? parentId;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? amenitiesIds;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        parentId: json["parentId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        amenitiesIds: json["amenitiesIds"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "parentId": parentId,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "amenitiesIds": amenitiesIds,
      };
}

// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

List<SubCategoryModel> subCategoryModelFromJson(String str) =>
    List<SubCategoryModel>.from(
        json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  SubCategoryModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.parentId,
    this.published,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  int? parentId;
  bool? published;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        parentId: json["parentId"],
        published: json["published"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "parentId": parentId,
        "published": published,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
