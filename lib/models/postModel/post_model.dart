// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.id,
    this.title,
    this.propertyNumber,
    this.description,
    this.featuredImages,
    this.galleryImages,
    this.video,
    this.longDescription,
    this.longitude,
    this.latitude,
    this.plotNumber,
    this.price,
    this.city,
    this.area,
    this.isInstallmentAvailable,
    this.showContactDetails,
    this.advanceAmount,
    this.noOfInstallments,
    this.monthlyInstallments,
    this.readyForPossession,
    this.areaSizeUnit,
    this.bedroooms,
    this.bathroom,
    this.featureAndAmenities,
    this.categoryId,
    this.authorId,
    this.slugId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  dynamic propertyNumber;
  String? description;
  String? featuredImages;
  String? galleryImages;
  String? video;
  String? longDescription;
  String? longitude;
  String? latitude;
  String? plotNumber;
  int? price;
  String? city;
  String? area;
  bool? isInstallmentAvailable;
  bool? showContactDetails;
  int? advanceAmount;
  int? noOfInstallments;
  int? monthlyInstallments;
  bool? readyForPossession;
  String? areaSizeUnit;
  int? bedroooms;
  int? bathroom;
  String? featureAndAmenities;
  int? categoryId;
  int? authorId;
  int? slugId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        title: json["title"],
        propertyNumber: json["propertyNumber"],
        description: json["description"],
        featuredImages: json["featuredImages"],
        galleryImages: json["galleryImages"],
        video: json["video"],
        longDescription: json["longDescription"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        plotNumber: json["plotNumber"],
        price: json["price"],
        city: json["city"],
        area: json["area"],
        isInstallmentAvailable: json["isInstallmentAvailable"],
        showContactDetails: json["showContactDetails"],
        advanceAmount: json["advanceAmount"],
        noOfInstallments: json["noOfInstallments"],
        monthlyInstallments: json["monthlyInstallments"],
        readyForPossession: json["readyForPossession"],
        areaSizeUnit: json["areaSizeUnit"],
        bedroooms: json["bedroooms"],
        bathroom: json["bathroom"],
        featureAndAmenities: json["featureAndAmenities"],
        categoryId: json["categoryId"],
        authorId: json["authorId"],
        slugId: json["slugId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "propertyNumber": propertyNumber,
        "description": description,
        "featuredImages": featuredImages,
        "galleryImages": galleryImages,
        "video": video,
        "longDescription": longDescription,
        "longitude": longitude,
        "latitude": latitude,
        "plotNumber": plotNumber,
        "price": price,
        "city": city,
        "area": area,
        "isInstallmentAvailable": isInstallmentAvailable,
        "showContactDetails": showContactDetails,
        "advanceAmount": advanceAmount,
        "noOfInstallments": noOfInstallments,
        "monthlyInstallments": monthlyInstallments,
        "readyForPossession": readyForPossession,
        "areaSizeUnit": areaSizeUnit,
        "bedroooms": bedroooms,
        "bathroom": bathroom,
        "featureAndAmenities": featureAndAmenities,
        "categoryId": categoryId,
        "authorId": authorId,
        "slugId": slugId,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
