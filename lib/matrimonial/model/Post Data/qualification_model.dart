// To parse this JSON data, do
//
//     final qualificationModel = qualificationModelFromJson(jsonString?);

import 'dart:convert';

QualificationModel qualificationModelFromJson(String? str) => QualificationModel.fromJson(json.decode(str!));

String? qualificationModelToJson(QualificationModel data) => json.encode(data.toJson());

class QualificationModel {
  QualificationModel({
    this.highestQualifiction,
    this.universityName,
    this.percentageGrade,
    this.passingYear,
  });

  String? highestQualifiction;
  String? universityName;
  String? percentageGrade;
  String? passingYear;

  factory QualificationModel.fromJson(Map<String?, dynamic> json) => QualificationModel(
    highestQualifiction: json["highestQualifiction"],
    universityName: json["universityName"],
    percentageGrade: json["percentageGrade"],
    passingYear: json["passingYear"],
  );

  Map<String?, dynamic> toJson() => {
    "highestQualifiction": highestQualifiction,
    "universityName": universityName,
    "percentageGrade": percentageGrade,
    "passingYear": passingYear,
  };
}
