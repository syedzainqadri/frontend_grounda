// To parse this JSON data, do
//
//     final reviewsModel = reviewsModelFromJson(jsonString);

import 'dart:convert';

List<ReviewsModel> reviewsModelFromJson(String str) => List<ReviewsModel>.from(
    json.decode(str).map((x) => ReviewsModel.fromJson(x)));

String reviewsModelToJson(List<ReviewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewsModel {
  ReviewsModel({
    this.id,
    this.rating,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.postId,
  });

  int? id;
  int? rating;
  String? message;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? postId;

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        id: json["id"],
        rating: json["rating"],
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "message": message,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "postId": postId,
      };
}
