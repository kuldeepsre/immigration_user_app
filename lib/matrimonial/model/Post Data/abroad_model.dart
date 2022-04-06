// To parse this JSON data, do
//
//     final abroadModel = abroadModelFromJson(jsonString?);

import 'dart:convert';

AbroadModel abroadModelFromJson(String? str) => AbroadModel.fromJson(json.decode(str!));

String? abroadModelToJson(AbroadModel data) => json.encode(data.toJson());

class AbroadModel {
  AbroadModel({
    this.howManyTimeYouGoAbroad,
    this.whereAreYouLivingInAbroad,
    this.typeOfVisaDoYouHave,
    this.sponsorshipFromAbroad,
    this.howLongHaveBeenLivingInAbroad,
    this.areYouMakingMoneyInAbroad,
    this.whenWillYouComeBackFromAbroad,
    this.doYouHaveWorkOrBusiness,
    // this.howLongHaveYouBeenInProfession,
    // this.annualIncome,
    // this.doYouPayIncomeTax,
  });

  String? howManyTimeYouGoAbroad;
  String? whereAreYouLivingInAbroad;
  String? typeOfVisaDoYouHave;
  String? sponsorshipFromAbroad;
  String? howLongHaveBeenLivingInAbroad;
  String? areYouMakingMoneyInAbroad;
  String? whenWillYouComeBackFromAbroad;
  String? doYouHaveWorkOrBusiness;
  // String? howLongHaveYouBeenInProfession;
  // String? annualIncome;
  // String? doYouPayIncomeTax;

  factory AbroadModel.fromJson(Map<String?, dynamic> json) => AbroadModel(
    howManyTimeYouGoAbroad: json["howManyTimeYouGoAbroad"],
    whereAreYouLivingInAbroad: json["whereAreYouLivingInAbroad"],
    typeOfVisaDoYouHave: json["typeOfVisaDoYouHave"],
    sponsorshipFromAbroad: json["sponsorshipFromAbroad"],
    howLongHaveBeenLivingInAbroad: json["howLongHaveBeenLivingInAbroad"],
    areYouMakingMoneyInAbroad: json["areYouMakingMoneyInAbroad"],
    whenWillYouComeBackFromAbroad: json["whenWillYouComeBackFromAbroad"],
    doYouHaveWorkOrBusiness: json["doYouHaveWorkOrBusiness"],
    // howLongHaveYouBeenInProfession: json["howLongHaveYouBeenInProfession"],
    // annualIncome: json["annualIncome"],
    // doYouPayIncomeTax: json["doYouPayIncomeTax"],
  );

  Map<String?, dynamic> toJson() => {
    "howManyTimeYouGoAbroad": howManyTimeYouGoAbroad,
    "whereAreYouLivingInAbroad": whereAreYouLivingInAbroad,
    "typeOfVisaDoYouHave": typeOfVisaDoYouHave,
    "sponsorshipFromAbroad": sponsorshipFromAbroad,
    "howLongHaveBeenLivingInAbroad": howLongHaveBeenLivingInAbroad,
    "areYouMakingMoneyInAbroad": areYouMakingMoneyInAbroad,
    "whenWillYouComeBackFromAbroad": whenWillYouComeBackFromAbroad,
    "doYouHaveWorkOrBusiness": doYouHaveWorkOrBusiness,
    // "howLongHaveYouBeenInProfession": howLongHaveYouBeenInProfession,
    // "annualIncome": annualIncome,
    // "doYouPayIncomeTax": doYouPayIncomeTax,
  };
}
