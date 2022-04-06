// To parse this JSON data, do
//
//     final marriageInterestModel = marriageInterestModelFromJson(jsonString);

import 'dart:convert';

MarriageInterestModel marriageInterestModelFromJson(String str) => MarriageInterestModel.fromJson(json.decode(str));

String marriageInterestModelToJson(MarriageInterestModel data) => json.encode(data.toJson());

class MarriageInterestModel {
  MarriageInterestModel({
    this.wantMarriageCountryName,
    this.mId,
    this.livingStatus,
    this.interestedToMarriageWith,
    this.wantMarriageCityName,
  });

  String? wantMarriageCountryName;
  String? mId;
  String? livingStatus;
  String? interestedToMarriageWith;
  String? wantMarriageCityName;

  factory MarriageInterestModel.fromJson(Map<String, dynamic> json) => MarriageInterestModel(
    wantMarriageCountryName: json["wantMarriageCountryName"],
    mId: json["mId"],
    livingStatus: json["livingStatus"],
    interestedToMarriageWith: json["interestedToMarriageWith"],
    wantMarriageCityName: json["wantMarriageCityName"],
  );

  get preferredCountry => null;

  Map<String, dynamic> toJson() => {
    "wantMarriageCountryName": wantMarriageCountryName,
    "mId": mId,
    "livingStatus": livingStatus,
    "interestedToMarriageWith": interestedToMarriageWith,
    "wantMarriageCityName": wantMarriageCityName,
  };
}
