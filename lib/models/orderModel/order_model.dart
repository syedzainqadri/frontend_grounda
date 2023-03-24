// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromJson(String str) => List<OrdersModel>.from(
    json.decode(str).map((x) => OrdersModel.fromJson(x)));

String ordersModelToJson(List<OrdersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdersModel {
  OrdersModel({
    this.id,
    this.orderAmount,
    this.userId,
    this.paymentMethodId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? orderAmount;
  int? userId;
  int? paymentMethodId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json["id"],
        orderAmount: json["orderAmount"],
        userId: json["userId"],
        paymentMethodId: json["paymentMethodId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderAmount": orderAmount,
        "userId": userId,
        "paymentMethodId": paymentMethodId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
