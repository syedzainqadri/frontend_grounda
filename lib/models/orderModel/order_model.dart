// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
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

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
