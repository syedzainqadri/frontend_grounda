// To parse this JSON data, do
//
//     final contactPerson = contactPersonFromJson(jsonString);

import 'dart:convert';

ContactPerson contactPersonFromJson(String str) =>
    ContactPerson.fromJson(json.decode(str));

String contactPersonToJson(ContactPerson data) => json.encode(data.toJson());

class ContactPerson {
  ContactPerson({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.landLine,
    this.ccontactPersonType,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? landLine;
  String? ccontactPersonType;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        landLine: json["landLine"],
        ccontactPersonType: json["ccontactPersonType"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "landLine": landLine,
        "ccontactPersonType": ccontactPersonType,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
