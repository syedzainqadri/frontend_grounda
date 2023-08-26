// To parse this JSON data, do
//
//     final agencyModel = agencyModelFromJson(jsonString);

import 'dart:convert';

List<AgencyModel> agencyModelFromJson(String str) => List<AgencyModel>.from(
    json.decode(str).map((x) => AgencyModel.fromJson(x)));

String agencyModelToJson(List<AgencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgencyModel {
  AgencyModel({
    this.id,
    this.title,
    this.ownerName,
    this.featuredImage,
    this.logoImage,
    this.country,
    this.state,
    this.city,
    this.email,
    this.address,
    this.description,
    this.mobile,
    this.purpose,
    this.propertyType,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.slug,
    this.status,
  });

  int? id;
  String? title;
  String? featuredImage;
  String? logoImage;
  String? ownerName;
  String? country;
  String? state;
  String? city;
  String? email;
  String? address;
  String? description;
  String? propertyType;
  String? mobile;
  String? purpose;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  String? slug;
  bool? status;

  factory AgencyModel.fromJson(Map<String, dynamic> json) => AgencyModel(
        id: json["id"],
        title: json["title"],
        featuredImage: json["featuredImage"],
        logoImage: json["logoImage"],
        ownerName: json["ownerName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        email: json["email"],
        address: json["address"],
        description: json["description"],
        mobile: json["mobile"],
        purpose: json["purpose"],
        propertyType: json["propertyType"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        slug: json["slug"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featuredImage": featuredImage,
        "logoImage": logoImage,
        "ownerName": ownerName,
        "country": country,
        "email": email,
        "state": state,
        "city": city,
        "address": address,
        "description": description,
        "mobile": mobile,
        "purpose": purpose,
        "propertyType": propertyType,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "status": status,
        "slug": slug,
      };
}

SingleAgencies singleAgenciesFromJson(String str) =>
    SingleAgencies.fromJson(json.decode(str));

String singleAgenciesToJson(SingleAgencies data) => json.encode(data.toJson());

class SingleAgencies {
  int? id;
  String? title;
  String? featuredImage;
  String? logoImage;
  String? ownerName;
  String? country;
  String? state;
  String? city;
  String? email;
  String? address;
  String? description;
  String? propertyType;
  String? purpose;
  String? mobile;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? slugId;

  SingleAgencies({
    this.id,
    this.title,
    this.featuredImage,
    this.logoImage,
    this.ownerName,
    this.country,
    this.state,
    this.city,
    this.email,
    this.address,
    this.description,
    this.propertyType,
    this.purpose,
    this.mobile,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.slugId,
  });

  factory SingleAgencies.fromJson(Map<String, dynamic> json) => SingleAgencies(
        id: json["id"],
        title: json["title"],
        featuredImage: json["featuredImage"],
        logoImage: json["logoImage"],
        ownerName: json["ownerName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        email: json["email"],
        address: json["address"],
        description: json["description"],
        propertyType: json["propertyType"],
        purpose: json["purpose"],
        mobile: json["mobile"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["userId"],
        slugId: json["slugId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featuredImage": featuredImage,
        "logoImage": logoImage,
        "ownerName": ownerName,
        "country": country,
        "state": state,
        "city": city,
        "email": email,
        "address": address,
        "description": description,
        "propertyType": propertyType,
        "purpose": purpose,
        "mobile": mobile,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "slugId": slugId,
      };
}
