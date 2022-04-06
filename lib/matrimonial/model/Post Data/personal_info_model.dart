// To parse this JSON data, do
//
//     final personalInfoModel = personalInfoModelFromJson(jsonString?);

import 'dart:convert';

PersonalInfoModel personalInfoModelFromJson(String? str) => PersonalInfoModel.fromJson(json.decode(str!));

String? personalInfoModelToJson(PersonalInfoModel data) => json.encode(data.toJson());

class PersonalInfoModel {


  PersonalInfoModel({
     this.firstName,
    this.lastName,
    this.whatsappNo,
    this.dob,
    this.height,
    this.gender,
    this.weight,
    this.bodyType,
    this.complexion,
    this.maritalStatus,
    this.noOfChildren,
    this.whereAreTheChildren,
    this.diet,
    this.smoking,
    this.drinking,
    this.presentLivingIn,
    this.permanentLivingIn,
    this.motherTongue,
    this.ieltsTofel,
    this.age,
    this.livingStatus,
    this.interestedCountry,
    this.cast
  });

  String? firstName;
  String? interestedCountry;
  String? lastName;
  String? livingStatus;
  String? profilePic;
  String? mId;
  String? dob;
  String? gender;
  String? age;
  String? height;
  String? weight;
  String? bodyType;
  String? complexion;
  String? maritalStatus;
  String? noOfChildren;
  String? whereAreTheChildren;
  String? diet;
  String? drinking;
  String? smoking;
  String? presentLivingIn;
  String? permanentLivingIn;
  String? motherTongue;
  String? ieltsTofel;
  String? phoneNo;
  String? alternativePhoneNo;
  String? emailId;
  String? passportNo;
  String? address;
  String? religion;
  String? cast;
  String? whatsappNo;
  String? subCast;


  factory PersonalInfoModel.fromJson(Map<String?, dynamic> json) => PersonalInfoModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    dob: json["dob"],
    gender: json["gender"],
    interestedCountry: json["interestedCountry"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    bodyType: json["bodyType"],
    complexion: json["complexion"],
    maritalStatus: json["maritalStatus"],
    noOfChildren: json["noOfChildren"],
    whereAreTheChildren: json["whereAreTheChildren"],
    diet: json["diet"],
    drinking: json["drinking"],
    smoking: json["smoking"],
    presentLivingIn: json["presentLivingIn"],
    permanentLivingIn: json["permanentLivingIn"],
    motherTongue: json["motherTongue"],
    ieltsTofel: json["ieltsTofel"],
    whatsappNo: json["whatsappNo"],
    livingStatus: json["LivingStatus"],
  );

  Map<String?, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "livingStatus": livingStatus,
    "profilePic": profilePic,
    "mId": mId,
    "gender": gender,
    "dob": dob,
    "age": age,
    "height": height,
    "weight": weight,
    "bodyType": bodyType,
    "complexion": complexion,
    "maritalStatus": maritalStatus,
    "noOfChildren": noOfChildren,
    "whereAreTheChildren": whereAreTheChildren,
    "diet": diet,
    "drinking": drinking,
    "smoking": smoking,
    "presentLivingIn": presentLivingIn,
    "permanentLivingIn": permanentLivingIn,
    "motherToung": motherTongue,
    "ieltsTofel": ieltsTofel,
    "phoneNo": phoneNo,
    "alternativePhoneNo": alternativePhoneNo,
    "whatsAppNo": whatsappNo,
    "emailId": emailId,
    "passportNo": passportNo,
    "address": address,
    "religion": religion,
    "cast": cast,
    "interestedCountry":interestedCountry,
    "subCast": subCast,
  };
}
