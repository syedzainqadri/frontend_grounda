// To parse this JSON data, do
//
//     final amenetiesModel = amenetiesModelFromJson(jsonString);

import 'dart:convert';

AmenetiesModel amenetiesModelFromJson(String str) =>
    AmenetiesModel.fromJson(json.decode(str));

String amenetiesModelToJson(AmenetiesModel data) => json.encode(data.toJson());

class AmenetiesModel {
  AmenetiesModel({
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

  factory AmenetiesModel.fromJson(Map<String, dynamic> json) => AmenetiesModel(
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
