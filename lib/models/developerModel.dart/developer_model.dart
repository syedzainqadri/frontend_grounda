// To parse this JSON data, do
//
//     final developerModel = developerModelFromJson(jsonString);

import 'dart:convert';

DeveloperModel developerModelFromJson(String str) =>
    DeveloperModel.fromJson(json.decode(str));

String developerModelToJson(DeveloperModel data) => json.encode(data.toJson());

class DeveloperModel {
  DeveloperModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
