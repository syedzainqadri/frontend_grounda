// To parse this JSON data, do
//
//     final faqGroupModel = faqGroupModelFromJson(jsonString);

import 'dart:convert';

FaqGroupModel faqGroupModelFromJson(String str) =>
    FaqGroupModel.fromJson(json.decode(str));

String faqGroupModelToJson(FaqGroupModel data) => json.encode(data.toJson());

class FaqGroupModel {
  FaqGroupModel({
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

  factory FaqGroupModel.fromJson(Map<String, dynamic> json) => FaqGroupModel(
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
