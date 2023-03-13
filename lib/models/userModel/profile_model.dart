// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.postCode,
    this.phone,
    this.slug,
    this.images,
    this.longitude,
    this.latitude,
    this.published,
    this.userId,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? postCode;
  String? phone;
  String? slug;
  String? images;
  String? longitude;
  String? latitude;
  bool? published;
  int? userId;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        addressLine1: json["addressLine1"],
        addressLine2: json["addressLine2"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postCode: json["postCode"],
        phone: json["phone"],
        slug: json["slug"],
        images: json["images"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        published: json["published"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "addressLine1": addressLine1,
        "addressLine2": addressLine2,
        "city": city,
        "state": state,
        "country": country,
        "postCode": postCode,
        "phone": phone,
        "slug": slug,
        "images": images,
        "longitude": longitude,
        "latitude": latitude,
        "published": published,
        "userId": userId,
      };
}