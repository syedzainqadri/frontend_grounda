// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) =>
    WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

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
