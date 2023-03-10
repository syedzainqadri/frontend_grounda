// To parse this JSON data, do
//
//     final paymentMethodModel = paymentMethodModelFromJson(jsonString);

import 'dart:convert';

PaymentMethodModel paymentMethodModelFromJson(String str) =>
    PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodModelToJson(PaymentMethodModel data) =>
    json.encode(data.toJson());

class PaymentMethodModel {
  PaymentMethodModel({
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

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
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
