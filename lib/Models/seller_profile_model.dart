// To parse this JSON data, do
//
//     final sellerProfileModel = sellerProfileModelFromJson(jsonString);

import 'dart:convert';

SellerProfileModel sellerProfileModelFromJson(String str) =>
    SellerProfileModel.fromJson(json.decode(str));

String sellerProfileModelToJson(SellerProfileModel data) =>
    json.encode(data.toJson());

class SellerProfileModel {
  var getaddress;

  SellerProfileModel({
    required this.sId,
    required this.lat,
    required this.lng,
    required this.companyName,
    required this.contactPersonName,
    required this.roleOfPerson,
    required this.phoneNo,
    required this.email,
    required this.address,
    required this.city,
    required this.profilePicture,
    required this.joiningDate,
    required this.plan,
    required this.accountStatus,
    required this.status,
    required this.district,
    required this.state,
    required this.view,
    required this.star,
    required this.companyCertification,
    required this.companyImages,
    required this.reviews,
    required this.previousResult,
    required this.categories,
  });

  String sId;
  double lat;
  double lng;
  String companyName;
  String contactPersonName;
  String roleOfPerson;
  String phoneNo;
  String email;
  String address;
  String city;
  String profilePicture;
  DateTime joiningDate;
  String plan;
  String accountStatus;
  String status;
  String district;
  String state;
  int view;
  int star;
  List<String> companyCertification;
  List<String> companyImages;
  List<String> reviews;
  List<String> previousResult;
  List<String> categories;

  factory SellerProfileModel.fromJson(Map<String, dynamic> json) =>
      SellerProfileModel(
        sId: json["sId"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        companyName: json["companyName"],
        contactPersonName: json["contactPersonName"],
        roleOfPerson: json["roleOfPerson"],
        phoneNo: json["phoneNo"],
        email: json["email"],
        address: json["address"],
        city: json["city"],
        profilePicture: json["profilePicture"],
        joiningDate: DateTime.parse(json["joiningDate"]),
        plan: json["plan"],
        accountStatus: json["accountStatus"],
        status: json["status"],
        district: json["district"],
        state: json["state"],
        view: json["view"],
        star: json["star"],
        companyCertification:
        List<String>.from(json["companyCertification"].map((x) => x)),
        companyImages: List<String>.from(json["companyImages"].map((x) => x)),
        reviews: List<String>.from(json["reviews"].map((x) => x)),
        previousResult: List<String>.from(json["previousResult"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "sId": sId,
    "lat": lat,
    "lng": lng,
    "companyName": companyName,
    "contactPersonName": contactPersonName,
    "roleOfPerson": roleOfPerson,
    "phoneNo": phoneNo,
    "email": email,
    "address": address,
    "city": city,
    "profilePicture": profilePicture,
    "joiningDate": joiningDate.toIso8601String(),
    "plan": plan,
    "accountStatus": accountStatus,
    "status": status,
    "district": district,
    "state": state,
    "view": view,
    "star": star,
    "companyCertification":
    List<dynamic>.from(companyCertification.map((x) => x)),
    "companyImages": List<dynamic>.from(companyImages.map((x) => x)),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "previousResult": List<dynamic>.from(previousResult.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x)),
  };
}