// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.role,
    this.password,
    this.fcmtoken,
    this.salt,
    this.preferencesEmailNotification,
    this.preferencesNewsletter,
    this.preferencesAutomatedReport,
    this.currency,
    this.areaUnit,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? email;
  String? role;
  String? password;
  dynamic fcmtoken;
  String? salt;
  bool? preferencesEmailNotification;
  bool? preferencesNewsletter;
  bool? preferencesAutomatedReport;
  String? currency;
  String? areaUnit;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        role: json["role"],
        password: json["password"],
        fcmtoken: json["fcmtoken"],
        salt: json["salt"],
        preferencesEmailNotification: json["preferencesEmailNotification"],
        preferencesNewsletter: json["preferencesNewsletter"],
        preferencesAutomatedReport: json["preferencesAutomatedReport"],
        currency: json["currency"],
        areaUnit: json["AreaUnit"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
        "password": password,
        "fcmtoken": fcmtoken,
        "salt": salt,
        "preferencesEmailNotification": preferencesEmailNotification,
        "preferencesNewsletter": preferencesNewsletter,
        "preferencesAutomatedReport": preferencesAutomatedReport,
        "currency": currency,
        "AreaUnit": areaUnit,
        "createdAt": createdAt.toString(),
        "updatedAt": updatedAt.toString(),
      };
}
