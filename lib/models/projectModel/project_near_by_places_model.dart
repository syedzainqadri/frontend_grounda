// To parse this JSON data, do
//
//     final projectNearByPlacesModel = projectNearByPlacesModelFromJson(jsonString);

import 'dart:convert';

ProjectNearByPlacesModel projectNearByPlacesModelFromJson(String str) =>
    ProjectNearByPlacesModel.fromJson(json.decode(str));

String projectNearByPlacesModelToJson(ProjectNearByPlacesModel data) =>
    json.encode(data.toJson());

class ProjectNearByPlacesModel {
  ProjectNearByPlacesModel({
    this.id,
    this.title,
    this.latitude,
    this.longitude,
    this.placeCategory,
  });

  int? id;
  String? title;
  String? latitude;
  String? longitude;
  String? placeCategory;

  factory ProjectNearByPlacesModel.fromJson(Map<String, dynamic> json) =>
      ProjectNearByPlacesModel(
        id: json["id"],
        title: json["title"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        placeCategory: json["placeCategory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "latitude": latitude,
        "longitude": longitude,
        "placeCategory": placeCategory,
      };
}
