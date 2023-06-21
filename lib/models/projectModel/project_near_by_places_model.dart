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
    this.name,
    this.icon,
    this.status,
  });

  int? id;
  String? name;

  String? icon;
  bool? status;

  factory ProjectsNearByPlacesModel.fromJson(Map<String, dynamic> json) =>
      ProjectsNearByPlacesModel(
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
