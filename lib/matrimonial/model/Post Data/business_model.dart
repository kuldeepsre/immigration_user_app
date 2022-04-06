// To parse this JSON data, do
//
//     final businessModel = businessModelFromJson(jsonString?);

import 'dart:convert';

BusinessModel businessModelFromJson(String? str) => BusinessModel.fromJson(json.decode(str!));

String? businessModelToJson(BusinessModel data) => json.encode(data.toJson());

class BusinessModel {
  BusinessModel({
    this.house,
    this.otherProperties,
    this.wheelerType,
    this.jobBusinessName,
    this.jobBusinessAddress,
    this.annualTurnOver,
    this.jobType,
    this.companyDepartmentName,
    this.designation,
    this.salary,
    this.rentalIncome,
    this.payIncomeTax,
    this.howLongInProfession,
  });

  String? house;
  String? howLongInProfession;
  String? otherProperties;
  String? wheelerType;
  String? jobBusinessName;
  String? jobBusinessAddress;
  String? annualTurnOver;
  String? jobType;
  String? companyDepartmentName;
  String? designation;
  String? salary;
  String? rentalIncome;
  String? payIncomeTax;

  factory BusinessModel.fromJson(Map<String?, dynamic> json) => BusinessModel(
    house: json["house"],
    otherProperties: json["otherProperties"],
    wheelerType: json["wheelerType"],
    jobBusinessName: json["jobBusinessName"],
    jobBusinessAddress: json["jobBusinessAddress"],
    annualTurnOver: json["annualTurnOver"],
    jobType: json["jobType"],
    companyDepartmentName: json["companyDepartmentName"],
    designation: json["designation"],
    salary: json["salary"],
    rentalIncome: json["rentalIncome"],
    payIncomeTax: json["payIncomeTax"],
      howLongInProfession: json["howLongInProfession"],
  );

  Map<String?, dynamic> toJson() => {
    "house": house,
    "otherProperties": otherProperties,
    "wheelerType": wheelerType,
    "jobBusinessName": jobBusinessName,
    "jobBusinessAddress": jobBusinessAddress,
    "annualTurnOver": annualTurnOver,
    "jobType": jobType,
    "companyDepartmentName": companyDepartmentName,
    "designation": designation,
    "payIncomeTax": payIncomeTax,
    "howLongInProfession":howLongInProfession,
  };
}
