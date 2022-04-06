// To parse this JSON data, do
//
//     final passportModel = passportModelFromJson(jsonString);

import 'dart:convert';

PassportModel passportModelFromJson(String str) => PassportModel.fromJson(json.decode(str));

String passportModelToJson(PassportModel data) => json.encode(data.toJson());

class PassportModel {
  PassportModel({
    this.fatherName,
    this.name,
    this.dob,
    this.cityName,
    this.mobileNo,
    this.typeOfPassport,
    this.typeOfServices,
  });

  String? fatherName;
  String? name;
  String? dob;
  String? cityName;
  String? mobileNo;
  String? typeOfPassport;
  String? typeOfServices;

  factory PassportModel.fromJson(Map<String, dynamic> json) => PassportModel(
    fatherName: json["fatherName"],
    name: json["name"],
    dob: json["dob"],
    cityName: json["cityName"],
    mobileNo: json["mobileNo"],
    typeOfPassport: json["typeOfPassport"],
    typeOfServices: json["typeOfServices"],
  );

  Map<String, dynamic> toJson() => {
    "fatherName": fatherName,
    "name": name,
    "dob": dob,
    "cityName": cityName,
    "mobileNo": mobileNo,
    "typeOfPassport": typeOfPassport,
    "typeOfServices": typeOfServices,
  };
}
