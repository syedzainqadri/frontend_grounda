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
    this.icon,
    this.status,
  });

  int? id;
  String? name;

  String? icon;
  bool? status;

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": status,
      };
}
