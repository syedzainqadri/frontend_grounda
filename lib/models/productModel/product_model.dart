// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
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

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
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
