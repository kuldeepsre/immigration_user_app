// To parse this JSON data, do
//
//     final todayDealPostSellerModel = todayDealPostSellerModelFromJson(jsonString);

import 'dart:convert';

List<TodayDealPostSellerModel> todayDealPostSellerModelFromJson(String str) =>
    List<TodayDealPostSellerModel>.from(
        json.decode(str).map((x) => TodayDealPostSellerModel.fromJson(x)));

String todayDealPostSellerModelToJson(List<TodayDealPostSellerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodayDealPostSellerModel {
  TodayDealPostSellerModel({
    required this.companyName,
    required this.title,
    required this.description,
    required this.postImage,
    required this.sId,
    required this.pId,
    required this.categories,
    required this.active,
    required this.click,
    required this.timing,
  });

  String companyName;
  String title;
  String description;
  String postImage;
  String sId;
  String pId;
  String categories;
  dynamic active;
  int click;
  Timing timing;

  factory TodayDealPostSellerModel.fromJson(Map<String, dynamic> json) =>
      TodayDealPostSellerModel(
        companyName: json["CompanyName"],
        title: json["title"],
        description: json["description"],
        postImage: json["postImage"],
        sId: json["sId"],
        pId: json["pId"],
        categories: json["categories"],
        active: json["active"],
        click: json["click"],
        timing: Timing.fromJson(json["timing"]),
      );

  Map<String, dynamic> toJson() => {
        "CompanyName": companyName,
        "title": title,
        "description": description,
        "postImage": postImage,
        "sId": sId,
        "pId": pId,
        "categories": categories,
        "active": active,
        "click": click,
        "timing": timing.toJson(),
      };
}

class Timing {
  Timing({
    required this.seconds,
    required this.nanos,
  });

  int seconds;
  int nanos;

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
        seconds: json["seconds"],
        nanos: json["nanos"],
      );

  Map<String, dynamic> toJson() => {
        "seconds": seconds,
        "nanos": nanos,
      };
}