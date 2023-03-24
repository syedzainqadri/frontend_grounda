// To parse this JSON data, do
//
//     final projectsNearByPlacesModel = projectsNearByPlacesModelFromJson(jsonString);

import 'dart:convert';

List<ProjectsNearByPlacesModel> projectsNearByPlacesModelFromJson(String str) =>
    List<ProjectsNearByPlacesModel>.from(
        json.decode(str).map((x) => ProjectsNearByPlacesModel.fromJson(x)));

String projectsNearByPlacesModelToJson(List<ProjectsNearByPlacesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectsNearByPlacesModel {
  ProjectsNearByPlacesModel({
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

  factory ProjectsNearByPlacesModel.fromJson(Map<String, dynamic> json) =>
      ProjectsNearByPlacesModel(
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
