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
    this.purpose,
    this.amenitiesNames,
    this.amenitiesIconCodes,
    this.isInstallmentAvailable,
    this.showContactDetails,
    this.advanceAmount,
    this.noOfInstallments,
    this.monthlyInstallments,
    this.readyForPossession,
    this.areaSizeUnit,
    this.totalAreaSize,
    this.bedroooms,
    this.bathroom,
    this.categoryId,
    this.subCategoryId,
    this.authorId,
    this.slugId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  int? propertyNumber;
  String? description;
  String? featuredImages;
  String? galleryImages;
  String? video;
  String? longDescription;
  String? longitude;
  String? latitude;
  String? plotNumber;
  String? price;
  String? city;
  String? area;
  String? purpose;
  String? amenitiesNames;
  String? amenitiesIconCodes;
  bool? isInstallmentAvailable;
  bool? showContactDetails;
  String? advanceAmount;
  int? noOfInstallments;
  String? monthlyInstallments;
  bool? readyForPossession;
  String? areaSizeUnit;
  String? totalAreaSize;
  int? bedroooms;
  int? bathroom;
  int? categoryId;
  int? subCategoryId;
  int? authorId;
  int? slugId;
  bool? status;
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
        purpose: json["purpose"],
        amenitiesNames: json["amenitiesNames"],
        amenitiesIconCodes: json["amenitiesIconCodes"],
        isInstallmentAvailable: json["isInstallmentAvailable"],
        showContactDetails: json["showContactDetails"],
        advanceAmount: json["advanceAmount"],
        noOfInstallments: json["noOfInstallments"],
        monthlyInstallments: json["monthlyInstallments"],
        readyForPossession: json["readyForPossession"],
        areaSizeUnit: json["areaSizeUnit"],
        totalAreaSize: json["totalAreaSize"],
        bedroooms: json["bedroooms"],
        bathroom: json["bathroom"],
        categoryId: json["categoryId"],
        subCategoryId: json["subCategoryId"],
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
        "purpose": purpose,
        "amenitiesNames": amenitiesNames,
        "amenitiesIconCodes": amenitiesIconCodes,
        "isInstallmentAvailable": isInstallmentAvailable,
        "showContactDetails": showContactDetails,
        "advanceAmount": advanceAmount,
        "noOfInstallments": noOfInstallments,
        "monthlyInstallments": monthlyInstallments,
        "readyForPossession": readyForPossession,
        "areaSizeUnit": areaSizeUnit,
        "totalAreaSize": totalAreaSize,
        "bedroooms": bedroooms,
        "bathroom": bathroom,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "authorId": authorId,
        "slugId": slugId,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final singlePostModel = singlePostModelFromJson(jsonString);

SinglePostModel singlePostModelFromJson(String str) =>
    SinglePostModel.fromJson(json.decode(str));

String singlePostModelToJson(SinglePostModel data) =>
    json.encode(data.toJson());

class SinglePostModel {
  SinglePostModel({
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
    this.purpose,
    this.amenitiesNames,
    this.amenitiesIconCodes,
    this.isInstallmentAvailable,
    this.showContactDetails,
    this.advanceAmount,
    this.noOfInstallments,
    this.monthlyInstallments,
    this.readyForPossession,
    this.areaSizeUnit,
    this.totalAreaSize,
    this.bedroooms,
    this.bathroom,
    this.categoryId,
    this.subCategoryId,
    this.authorId,
    this.slugId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  int? propertyNumber;
  String? description;
  String? featuredImages;
  String? galleryImages;
  String? video;
  String? longDescription;
  String? longitude;
  String? latitude;
  String? plotNumber;
  String? price;
  String? city;
  String? area;
  String? purpose;
  String? amenitiesNames;
  String? amenitiesIconCodes;
  bool? isInstallmentAvailable;
  bool? showContactDetails;
  String? advanceAmount;
  int? noOfInstallments;
  String? monthlyInstallments;
  bool? readyForPossession;
  String? areaSizeUnit;
  String? totalAreaSize;
  int? bedroooms;
  int? bathroom;
  int? categoryId;
  int? subCategoryId;
  int? authorId;
  int? slugId;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SinglePostModel.fromJson(Map<String, dynamic> json) =>
      SinglePostModel(
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
        purpose: json["purpose"],
        amenitiesNames: json["amenitiesNames"],
        amenitiesIconCodes: json["amenitiesIconCodes"],
        isInstallmentAvailable: json["isInstallmentAvailable"],
        showContactDetails: json["showContactDetails"],
        advanceAmount: json["advanceAmount"],
        noOfInstallments: json["noOfInstallments"],
        monthlyInstallments: json["monthlyInstallments"],
        readyForPossession: json["readyForPossession"],
        areaSizeUnit: json["areaSizeUnit"],
        totalAreaSize: json["totalAreaSize"],
        bedroooms: json["bedroooms"],
        bathroom: json["bathroom"],
        categoryId: json["categoryId"],
        subCategoryId: json["subCategoryId"],
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
        "purpose": purpose,
        "amenitiesNames": amenitiesNames,
        "amenitiesIconCodes": amenitiesIconCodes,
        "isInstallmentAvailable": isInstallmentAvailable,
        "showContactDetails": showContactDetails,
        "advanceAmount": advanceAmount,
        "noOfInstallments": noOfInstallments,
        "monthlyInstallments": monthlyInstallments,
        "readyForPossession": readyForPossession,
        "areaSizeUnit": areaSizeUnit,
        "totalAreaSize": totalAreaSize,
        "bedroooms": bedroooms,
        "bathroom": bathroom,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "authorId": authorId,
        "slugId": slugId,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
