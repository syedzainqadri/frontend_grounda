// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.salePrice,
    this.image,
    this.productType,
    this.description,
    this.productLifeInDays,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  int? price;
  int? salePrice;
  String? image;
  String? productType;
  String? description;
  int? productLifeInDays;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        salePrice: json["salePrice"],
        image: json["image"],
        productType: json["productType"],
        description: json["description"],
        productLifeInDays: json["productLifeInDays"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "salePrice": salePrice,
        "image": image,
        "productType": productType,
        "description": description,
        "productLifeInDays": productLifeInDays,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
