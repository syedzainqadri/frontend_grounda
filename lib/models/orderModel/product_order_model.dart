// To parse this JSON data, do
//
//     final productOrderModel = productOrderModelFromJson(jsonString);

import 'dart:convert';

List<ProductOrderModel> productOrderModelFromJson(String str) =>
    List<ProductOrderModel>.from(
        json.decode(str).map((x) => ProductOrderModel.fromJson(x)));

String productOrderModelToJson(List<ProductOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductOrderModel {
  ProductOrderModel({
    this.id,
    this.price,
    this.isProductUsed,
    this.productActiveDate,
    this.productExpireDate,
    this.productId,
    this.orderId,
    this.postId,
  });

  int? id;
  int? price;
  bool? isProductUsed;
  DateTime? productActiveDate;
  DateTime? productExpireDate;
  int? productId;
  int? orderId;
  dynamic postId;

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) =>
      ProductOrderModel(
        id: json["id"],
        price: json["price"],
        isProductUsed: json["isProductUsed"],
        productActiveDate: DateTime.parse(json["productActiveDate"]),
        productExpireDate: DateTime.parse(json["productExpireDate"]),
        productId: json["productId"],
        orderId: json["orderId"],
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "isProductUsed": isProductUsed,
        "productActiveDate": productActiveDate!.toIso8601String(),
        "productExpireDate": productExpireDate!.toIso8601String(),
        "productId": productId,
        "orderId": orderId,
        "postId": postId,
      };
}
