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
    this.description,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  int? id;
  String? name;
  String? description;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? status;

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "icon": icon,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
      };
}
