// To parse this JSON data, do
//
//     final faqGroupsModel = faqGroupsModelFromJson(jsonString);

import 'dart:convert';

List<FaqGroupsModel> faqGroupsModelFromJson(String str) =>
    List<FaqGroupsModel>.from(
        json.decode(str).map((x) => FaqGroupsModel.fromJson(x)));

String faqGroupsModelToJson(List<FaqGroupsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqGroupsModel {
  FaqGroupsModel({
    this.id,
    this.faqGroupName,
    this.sortOrder,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? faqGroupName;
  int? sortOrder;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory FaqGroupsModel.fromJson(Map<String, dynamic> json) => FaqGroupsModel(
        id: json["id"],
        faqGroupName: json["faqGroupName"],
        sortOrder: json["sortOrder"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faqGroupName": faqGroupName,
        "sortOrder": sortOrder,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
