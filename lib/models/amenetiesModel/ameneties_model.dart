// To parse this JSON data, do
//
//     final amenitiesModel = amenitiesModelFromJson(jsonString);

import 'dart:convert';

List<AmenitiesModel> amenitiesModelFromJson(String str) =>
    List<AmenitiesModel>.from(
        json.decode(str).map((x) => AmenitiesModel.fromJson(x)));

String amenitiesModelToJson(List<AmenitiesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmenitiesModel {
  AmenitiesModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.published,
    this.categoryId,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? published;
  int? categoryId;

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        published: json["published"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "published": published,
        "categoryId": categoryId,
      };
}
