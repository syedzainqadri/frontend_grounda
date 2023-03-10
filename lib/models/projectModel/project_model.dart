// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.id,
    this.title,
    this.address,
    this.featuredImage,
    this.gallery,
    this.locality,
    this.city,
    this.startingPrice,
    this.endingPrice,
    this.walkthroughThreeD,
    this.createdAt,
    this.updatedAt,
    this.developerId,
    this.categoryId,
    this.projectNearByPlaceId,
  });

  int? id;
  String? title;
  String? address;
  String? featuredImage;
  String? gallery;
  String? locality;
  String? city;
  int? startingPrice;
  int? endingPrice;
  dynamic walkthroughThreeD;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? developerId;
  int? categoryId;
  dynamic projectNearByPlaceId;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        featuredImage: json["featuredImage"],
        gallery: json["gallery"],
        locality: json["locality"],
        city: json["city"],
        startingPrice: json["startingPrice"],
        endingPrice: json["endingPrice"],
        walkthroughThreeD: json["walkthroughThreeD"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        developerId: json["developerId"],
        categoryId: json["categoryId"],
        projectNearByPlaceId: json["projectNearByPlaceId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "featuredImage": featuredImage,
        "gallery": gallery,
        "locality": locality,
        "city": city,
        "startingPrice": startingPrice,
        "endingPrice": endingPrice,
        "walkthroughThreeD": walkthroughThreeD,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "developerId": developerId,
        "categoryId": categoryId,
        "projectNearByPlaceId": projectNearByPlaceId,
      };
}
