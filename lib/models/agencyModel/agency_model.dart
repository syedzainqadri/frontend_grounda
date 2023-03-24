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
    this.featuredImage,
    this.logoImage,
    this.ownerName,
    this.ownerDesignation,
    this.ownerMessage,
    this.ownerProfilePic,
    this.companyTitle,
    this.country,
    this.email,
    this.website,
    this.address,
    this.description,
    this.mobile,
    this.landline,
    this.whatsapp,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.slugId,
  });

  int? id;
  String? title;
  String? featuredImage;
  String? logoImage;
  String? ownerName;
  String? ownerDesignation;
  String? ownerMessage;
  String? ownerProfilePic;
  String? companyTitle;
  String? country;
  String? email;
  String? website;
  String? address;
  String? description;
  String? mobile;
  String? landline;
  String? whatsapp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? slugId;

  factory AgencyModel.fromJson(Map<String, dynamic> json) => AgencyModel(
        id: json["id"],
        title: json["title"],
        featuredImage: json["featuredImage"],
        logoImage: json["logoImage"],
        ownerName: json["ownerName"],
        ownerDesignation: json["ownerDesignation"],
        ownerMessage: json["ownerMessage"],
        ownerProfilePic: json["ownerProfilePic"],
        companyTitle: json["companyTitle"],
        country: json["country"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        description: json["description"],
        mobile: json["mobile"],
        landline: json["landline"],
        whatsapp: json["whatsapp"],
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
        "ownerDesignation": ownerDesignation,
        "ownerMessage": ownerMessage,
        "ownerProfilePic": ownerProfilePic,
        "companyTitle": companyTitle,
        "country": country,
        "email": email,
        "website": website,
        "address": address,
        "description": description,
        "mobile": mobile,
        "landline": landline,
        "whatsapp": whatsapp,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "userId": userId,
        "slugId": slugId,
      };
}
