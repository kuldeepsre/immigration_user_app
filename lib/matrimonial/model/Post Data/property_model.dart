// To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

import 'dart:convert';

PropertyModel propertyModelFromJson(String str) => PropertyModel.fromJson(json.decode(str));

String propertyModelToJson(PropertyModel data) => json.encode(data.toJson());

class PropertyModel {
  PropertyModel({
    this.mId,
    this.house,
    this.commercialProperties,
    this.agicutureLand,
    this.otherProperties,
    this.rentalIncome,
    this.wheelerType,
    this.whichTypeOfPropertiesDoYouHave,
  });

  String? mId;
  String? house;
  String? commercialProperties;
  String? agicutureLand;
  String? otherProperties;
  String? rentalIncome;
  List<String>? wheelerType;
  List<String>? whichTypeOfPropertiesDoYouHave;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    mId: json["mId"],
    house: json["house"],
    commercialProperties: json["commercialProperties"],
    agicutureLand: json["agicutureLand"],
    otherProperties: json["otherProperties"],
    rentalIncome: json["rentalIncome"],
    wheelerType: List<String>.from(json["wheelerType"].map((x) => x)),
    whichTypeOfPropertiesDoYouHave: List<String>.from(json["whichTypeOfPropertiesDoYouHave"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mId": mId,
    "house": house,
    "commercialProperties": commercialProperties,
    "agicutureLand": agicutureLand,
    "otherProperties": otherProperties,
    "rentalIncome": rentalIncome,
    "wheelerType": List<dynamic>.from(wheelerType!.map((x) => x)),
    "whichTypeOfPropertiesDoYouHave": List<dynamic>.from(whichTypeOfPropertiesDoYouHave!.map((x) => x)),
  };
}
