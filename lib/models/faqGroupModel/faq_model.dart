// To parse this JSON data, do
//
//     final faqsModel = faqsModelFromJson(jsonString);

import 'dart:convert';

List<FaqsModel> faqsModelFromJson(String str) =>
    List<FaqsModel>.from(json.decode(str).map((x) => FaqsModel.fromJson(x)));

String faqsModelToJson(List<FaqsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqsModel {
  FaqsModel({
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

  factory FaqsModel.fromJson(Map<String, dynamic> json) => FaqsModel(
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
