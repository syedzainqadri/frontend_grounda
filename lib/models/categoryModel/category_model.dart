import 'dart:convert';

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
    this.parentId,
    this.image,
    this.published,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  int? parentId;
  String? image;
  bool? published;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
