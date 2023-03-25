// To parse this JSON data, do
//
//     final allPaymentMethodsModel = allPaymentMethodsModelFromJson(jsonString);

import 'dart:convert';

List<AllPaymentMethodsModel> allPaymentMethodsModelFromJson(String str) =>
    List<AllPaymentMethodsModel>.from(
        json.decode(str).map((x) => AllPaymentMethodsModel.fromJson(x)));

String allPaymentMethodsModelToJson(List<AllPaymentMethodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPaymentMethodsModel {
  AllPaymentMethodsModel({
    this.id,
    this.name,
    this.apiKey,
    this.secret,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  int? id;
  String? name;
  String? apiKey;
  String? secret;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;

  factory AllPaymentMethodsModel.fromJson(Map<String, dynamic> json) =>
      AllPaymentMethodsModel(
        id: json["id"],
        name: json["name"],
        apiKey: json["apiKey"],
        secret: json["secret"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "apiKey": apiKey,
        "secret": secret,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "status": status,
      };
}
