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
  DevelopersModel(
      {this.id,
      this.title,
      this.description,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.status});

  int? id;
  String? title;
  String? description;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? status;

  factory DevelopersModel.fromJson(Map<String, dynamic> json) =>
      DevelopersModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "logo": logo,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status!,
      };
}
