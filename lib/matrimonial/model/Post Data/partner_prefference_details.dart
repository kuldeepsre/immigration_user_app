// To parse this JSON data, do
//
//     final partnerPreferenceModel = partnerPreferenceModelFromJson(jsonString);

import 'dart:convert';

PartnerPreferenceModel partnerPreferenceModelFromJson(String str) => PartnerPreferenceModel.fromJson(json.decode(str));

String partnerPreferenceModelToJson(PartnerPreferenceModel data) => json.encode(data.toJson());

class PartnerPreferenceModel {


  PartnerPreferenceModel({
    this.mId,
    this.preferredCountry,
    this.preferredLivingStatus,
    this.preferredWorkingStatus,
    this.preferredAge,
    this.preferredHeight,
    this.preferredHighestQualification,
    this.preferredMaritalStatus,
    this.preferredBodyType,
    this.preferredComplexion,
    this.PreferredIelts,
    this.preferredDiet,
    this.preferredDrinking,
    this.preferredSmoking,
    this.preferredMotherTounge,
    this.PreferredMarriageWith,
  });

  String? mId;
  String? preferredCountry;
  String? PreferredMarriageWith;
  String? preferredLivingStatus;
  String? preferredWorkingStatus;
  PreferredAge?   preferredAge;
  PreferredHeight? preferredHeight;
  String? preferredHighestQualification;
  String? PreferredIelts;
  String? preferredMaritalStatus;
  String? preferredBodyType;
  String? preferredComplexion;
  String? preferredDiet;
  String? preferredDrinking;
  String? preferredSmoking;
  String? preferredMotherTounge;

  factory PartnerPreferenceModel.fromJson(Map<String, dynamic> json) => PartnerPreferenceModel(
    mId: json["mId"],
    preferredCountry: json["PreferredCountry"],
    PreferredIelts: json["PreferredIelts"],
    PreferredMarriageWith: json["PreferredMarriageWith"],
    preferredLivingStatus: json["PreferredLivingStatus"],
    preferredWorkingStatus: json["PreferredWorkingStatus"],
    preferredAge: PreferredAge.fromJson(json["PreferredAge"]),
    preferredHeight: PreferredHeight.fromJson(json["PreferredHeight"]),
    preferredHighestQualification: json["PreferredHighestQualification"],
    preferredMaritalStatus: json["PreferredMaritalStatus"],
    preferredBodyType: json["PreferredBodyType"],
    preferredComplexion: json["PreferredComplexion"],
    preferredDiet: json["PreferredDiet"],
    preferredDrinking: json["PreferredDrinking"],
    preferredSmoking: json["PreferredSmoking"],
    preferredMotherTounge: json["PreferredMotherTounge"],
  );

  Map<String, dynamic> toJson() => {

  };
}

class PreferredAge {
  PreferredAge({
     this.minAge,
    this.maxAge,
  });

  String? minAge;
  String? maxAge;

  factory PreferredAge.fromJson(Map<String, dynamic> json) => PreferredAge(
    minAge: json["minAge"],
    maxAge: json["maxAge"],
  );

  Map<String, dynamic> toJson() => {
    "minAge": minAge,
    "maxAge": maxAge,
  };
}

class PreferredHeight {
  PreferredHeight({
     this.minHeight,
     this.maxHeight,
  });

  String? minHeight;
  String? maxHeight;

  factory PreferredHeight.fromJson(Map<String, dynamic> json) => PreferredHeight(
    minHeight: json["minHeight"],
    maxHeight: json["maxHeight"],
  );

  Map<String, dynamic> toJson() => {
    "minHeight": minHeight,
    "maxHeight": maxHeight,
  };
}
