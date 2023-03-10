import 'dart:convert';

import 'package:flutter/material.dart';

MenuModel userModelFromJson(String str) => MenuModel.fromJson(json.decode(str));
String userModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
  String? label;
  String? rout;
  IconData? icon;
  bool? permissions;

  MenuModel(
      {required this.icon,
      required this.label,
      required this.rout,
      required this.permissions});

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
      label: json["label"],
      rout: json["rout"],
      icon: json["icon"],
      permissions: json["permissions"]);

  Map<String, dynamic> toJson() => {
        "label": label,
        "rout": rout,
        "icon": icon,
        "permissions": permissions,
      };
}
