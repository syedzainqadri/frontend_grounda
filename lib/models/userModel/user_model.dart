// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.token,
    this.email,
    this.areaUnit,
    this.fcmToken,
    this.role,
    this.preferencesEmailNotification,
    this.preferencesNewsletter,
    this.preferencesAutomatedReport,
  });

  int? id;
  String? token;
  String? email;
  String? areaUnit;
  dynamic fcmToken;
  String? role;
  bool? preferencesEmailNotification;
  bool? preferencesNewsletter;
  bool? preferencesAutomatedReport;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        token: json["token"],
        email: json["email"],
        areaUnit: json["areaUnit"],
        fcmToken: json["fcmToken"],
        role: json["role"],
        preferencesEmailNotification: json["preferencesEmailNotification"],
        preferencesNewsletter: json["preferencesNewsletter"],
        preferencesAutomatedReport: json["preferencesAutomatedReport"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "email": email,
        "areaUnit": areaUnit,
        "fcmToken": fcmToken,
        "role": role,
        "preferencesEmailNotification": preferencesEmailNotification,
        "preferencesNewsletter": preferencesNewsletter,
        "preferencesAutomatedReport": preferencesAutomatedReport,
      };
}
