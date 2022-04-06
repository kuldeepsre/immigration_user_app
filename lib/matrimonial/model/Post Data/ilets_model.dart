// To parse this JSON data, do
//
//     final iletsModel = iletsModelFromJson(jsonString);

import 'dart:convert';

IletsModel iletsModelFromJson(String str) => IletsModel.fromJson(json.decode(str));

String iletsModelToJson(IletsModel data) => json.encode(data.toJson());

class IletsModel {
  IletsModel({
    this.iletsClearedFrom,
    this.scoredOrBand,
    this.iletsPassingDate,
    this.iletsExpiryDate,
  });

  String? iletsClearedFrom;
  String? scoredOrBand;
  String? iletsPassingDate;
  String? iletsExpiryDate;

  factory IletsModel.fromJson(Map<String, dynamic> json) => IletsModel(
    iletsClearedFrom: json["iletsClearedFrom"],
    scoredOrBand: json["scoredOrBand"],
    iletsPassingDate: json["iletsPassingDate"],
    iletsExpiryDate: json["iletsExpiryDate"],
  );

  Map<String, dynamic> toJson() => {
    "iletsClearedFrom": iletsClearedFrom,
    "scoredOrBand": scoredOrBand,
    "iletsPassingDate": iletsPassingDate,
    "iletsExpiryDate": iletsExpiryDate,
  };
}
