// To parse this JSON data, do
//
//     final floorPlanModel = floorPlanModelFromJson(jsonString);

import 'dart:convert';

FloorPlanModel floorPlanModelFromJson(String str) =>
    FloorPlanModel.fromJson(json.decode(str));

String floorPlanModelToJson(FloorPlanModel data) => json.encode(data.toJson());

class FloorPlanModel {
  FloorPlanModel({
    this.id,
    this.title,
    this.floorPlanPath,
    this.projectId,
  });

  int? id;
  String? title;
  String? floorPlanPath;
  int? projectId;

  factory FloorPlanModel.fromJson(Map<String, dynamic> json) => FloorPlanModel(
        id: json["id"],
        title: json["title"],
        floorPlanPath: json["floorPlanPath"],
        projectId: json["projectId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "floorPlanPath": floorPlanPath,
        "projectId": projectId,
      };
}
