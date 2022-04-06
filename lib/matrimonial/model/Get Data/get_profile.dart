// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.bodyType,
    this.lastName,
    this.motherTongue,
    this.whereAreTheChildren,
    this.whatsAppNo,
    this.emailId,
    this.phoneNo,
    this.smoking,
    this.profilePic,
    this.permanentLivingIn,
    this.diet,
    this.height,
    this.presentLivingIn,
    this.ieltsTofel,
    this.address,
    this.drinking,
    this.noOfChildren,
    this.complexion,
    this.mId,
    this.gender,
    this.firstName,
    this.alternativePhoneNo,
    this.dob,
    this.livingStatus,
    this.age,
    this.maritalStatus,
  });

  String? bodyType;
  String? lastName;
  String? motherTongue;
  String? whereAreTheChildren;
  String? whatsAppNo;
  String? emailId;
  String? phoneNo;
  String? smoking;
  String? permanentLivingIn;
  String? diet;
  String? height;
  String? presentLivingIn;
  String? ieltsTofel;
  String? address;
  String? drinking;
  String? noOfChildren;
  String? profilePic;
  String? complexion;
  String? mId;
  String? gender;
  String? firstName;
  String? alternativePhoneNo;
  DateTime? dob;
  String? livingStatus;
  String? age;
  String? maritalStatus;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    bodyType: json["bodyType"],
    lastName: json["lastName"],
    motherTongue: json["motherTongue"],
    whereAreTheChildren: json["whereAreTheChildren"],
    whatsAppNo: json["whatsAppNo"],
    emailId: json["emailId"],
    phoneNo: json["phoneNo"],
    smoking: json["smoking"],
    permanentLivingIn: json["permanentLivingIn"],
    diet: json["diet"],
    height: json["height"],
    presentLivingIn: json["presentLivingIn"],
    ieltsTofel: json["ieltsTofel"],
    address: json["address"],
    drinking: json["drinking"],
    noOfChildren: json["noOfChildren"],
    profilePic: json["profilePic"],
    complexion: json["complexion"],
    mId: json["mId"],
    gender: json["gender"],
    firstName: json["firstName"],
    alternativePhoneNo: json["alternativePhoneNo"],
    dob: DateTime.parse(json["dob"]),
    livingStatus: json["livingStatus"],
    age: json["age"],
    maritalStatus: json["maritalStatus"],
  );

  Map<String, dynamic> toJson() => {
    "bodyType": bodyType,
    "lastName": lastName,
    "motherTongue": motherTongue,
    "whereAreTheChildren": whereAreTheChildren,
    "whatsAppNo": whatsAppNo,
    "emailId": emailId,
    "phoneNo": phoneNo,
    "smoking": smoking,
    "permanentLivingIn": permanentLivingIn,
    "diet": diet,
    "height": height,
    "presentLivingIn": presentLivingIn,
    "ieltsTofel": ieltsTofel,
    "address": address,
    "drinking": drinking,
    "noOfChildren": noOfChildren,
    "profilePic": profilePic,
    "complexion": complexion,
    "mId": mId,
    "gender": gender,
    "firstName": firstName,
    "alternativePhoneNo": alternativePhoneNo,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "livingStatus": livingStatus,
    "age": age,
    "maritalStatus": maritalStatus,
  };
}
