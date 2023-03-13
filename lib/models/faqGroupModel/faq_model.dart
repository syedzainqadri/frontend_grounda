// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));

String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    this.id,
    this.qusestion,
    this.answer,
    this.sortOrder,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.faqGroupId,
  });

  int? id;
  String? qusestion;
  String? answer;
  int? sortOrder;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? faqGroupId;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json["id"],
        qusestion: json["qusestion"],
        answer: json["answer"],
        sortOrder: json["sortOrder"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        faqGroupId: json["faqGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qusestion": qusestion,
        "answer": answer,
        "sortOrder": sortOrder,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "faqGroupId": faqGroupId,
      };
}
