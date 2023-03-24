// To parse this JSON data, do
//
//     final developersModel = developersModelFromJson(jsonString);

import 'dart:convert';

List<DevelopersModel> developersModelFromJson(String str) =>
    List<DevelopersModel>.from(
        json.decode(str).map((x) => DevelopersModel.fromJson(x)));

String developersModelToJson(List<DevelopersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DevelopersModel {
  DevelopersModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DevelopersModel.fromJson(Map<String, dynamic> json) =>
      DevelopersModel(
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
