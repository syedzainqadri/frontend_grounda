// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

List<WishListModel> wishListModelFromJson(String str) =>
    List<WishListModel>.from(
        json.decode(str).map((x) => WishListModel.fromJson(x)));

String wishListModelToJson(List<WishListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishListModel {
  WishListModel({
    this.id,
    this.postId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? postId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        id: json["id"],
        postId: json["postId"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "userId": userId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
