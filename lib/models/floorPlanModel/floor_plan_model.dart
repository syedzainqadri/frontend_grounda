// To parse this JSON data, do
//
//     final floorPlansModel = floorPlansModelFromJson(jsonString);

import 'dart:convert';

List<FloorPlansModel> floorPlansModelFromJson(String str) =>
    List<FloorPlansModel>.from(
        json.decode(str).map((x) => FloorPlansModel.fromJson(x)));

String floorPlansModelToJson(List<FloorPlansModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FloorPlansModel {
  FloorPlansModel({
    this.id,
    this.title,
    this.floorPlanPath,
    this.projectId,
  });

  int? id;
  String? title;
  String? floorPlanPath;
  int? projectId;

  factory FloorPlansModel.fromJson(Map<String, dynamic> json) =>
      FloorPlansModel(
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
