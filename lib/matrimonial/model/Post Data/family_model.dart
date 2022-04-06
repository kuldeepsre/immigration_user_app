import 'dart:convert';

FamilyModel personalInfoModelFromJson(String? str) => FamilyModel.fromJson(json.decode(str!));

String? personalInfoModelToJson(FamilyModel data) => json.encode(data.toJson());

class FamilyModel {
  FamilyModel({
    this.fatherName,
    this.affulence,
    this.fatherStatus,
    this.fatherCountryStatus,
    this.fatherLivingStatus,
    this.motherName,
    this.motherStatus,
    this.motherCountryStatus,
    this.motherLivingStatus,
    this.noOfBrother,
    this.brotherCountryStatus,
    this.brotherLivingStatus,
    this.noOfSister,
    this.sisterCountryStatus,
    this.sisterLivingStatus,
    this.cast,
    this.religiion,
    this.subCast,
  });

  String? fatherName;
  String? cast;
  String? subCast;
  String? religiion;
  String? affulence;
  String? fatherStatus;
  String? fatherCountryStatus;
  String? fatherLivingStatus;
  String? motherName;
  String? motherStatus;
  String? motherCountryStatus;
  String? motherLivingStatus;
  String? noOfBrother;
  String? brotherCountryStatus;
  String? brotherLivingStatus;
  String? noOfSister;
  String? sisterCountryStatus;
  String? sisterLivingStatus;

  factory FamilyModel.fromJson(Map<String?, dynamic> json) => FamilyModel(
    fatherName: json["fatherName"],
    affulence: json["affulence"],
    cast: json["cast"],
    religiion: json["religion"],
    fatherStatus: json["fatherStatus"],
    fatherCountryStatus: json["fatherCountryStatus"],
    fatherLivingStatus: json["fatherLivingStatus"],
    motherName: json["motherName"],
    motherStatus: json["motherStatus"],
    motherCountryStatus: json["motherCountryStatus"],
    motherLivingStatus: json["motherLivingStatus"],
    noOfBrother: json["noOfBrother"],
    brotherCountryStatus: json["brotherCountryStatus"],
    brotherLivingStatus: json["brotherLivingStatus"],
    noOfSister: json["noOfSister"],
    sisterCountryStatus: json["sisterCountryStatus"],
    sisterLivingStatus: json["sisterLivingStatus"],
    subCast: json["subCast"],
  );

  Map<String?, dynamic> toJson() => {
    "fatherName": fatherName,
    "affulence": affulence,
    "fatherStatus": fatherStatus,
    "fatherCountryStatus": fatherCountryStatus,
    "fatherLivingStatus": fatherLivingStatus,
    "motherName": motherName,
    "motherStatus": motherStatus,
    "motherCountryStatus": motherCountryStatus,
    "motherLivingStatus": motherLivingStatus,
    "noOfBrother": noOfBrother,
    "brotherCountryStatus": brotherCountryStatus,
    "brotherLivingStatus": brotherLivingStatus,
    "noOfSister": noOfSister,
    "sisterCountryStatus": sisterCountryStatus,
    "sisterLivingStatus": sisterLivingStatus,
    "religion": religiion,
    "cast": cast,
    "subCast": subCast,
  };
}
