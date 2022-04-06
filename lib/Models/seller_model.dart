// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

List<SellerModel> sellerModelFromJson(String str) => List<SellerModel>.from(
    json.decode(str).map((x) => SellerModel.fromJson(x)));

String sellerModelToJson(List<SellerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellerModel {
  SellerModel({
    this.sId,
    this.companyName,
    this.profilePicture,
    this.city,
    this.categories,
  });

  String? sId;
  String? companyName;
  String? profilePicture;
  String? city;
  List<String>? categories;

  factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        sId: json["sId"],
        companyName: json["companyName"],
        profilePicture: json["profilePicture"],
        city: json["city"],
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "sId": sId,
        "companyName": companyName,
        "profilePicture": profilePicture,
        "city": city,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
      };
}
// To parse this JSON data, do
//
//     final sellerlListModel = sellerlListModelFromJson(jsonString);

// import 'dart:convert';

// List<SellerListModel> sellerlListModelFromJson(String str) => List<SellerListModel>.from(json.decode(str).map((x) => SellerListModel.fromJson(x)));

// String sellerlListModelToJson(List<SellerListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SellerListModel {
//     SellerListModel({
//         this.companyName,
//         this.title,
//         this.description,
//         this.postImage,
//         this.sId,
//         this.pId,
//         this.categories,
//         this.active,
//         this.click,
        
//     });

//     String? companyName;
//     String? title;
//     String? description;
//     String? postImage;
//     String? sId;
//     String? pId;
//     String? categories;
//     dynamic? active;
//     int? click;
  

//     factory SellerListModel.fromJson(Map<String, dynamic> json) => SellerListModel(
//         companyName: json["CompanyName"],
//         title: json["title"],
//         description: json["description"],
//         postImage: json["postImage"],
//         sId: json["sId"],
//         pId: json["pId"],
//         categories: json["categories"],
//         active: json["active"],
//         click: json["click"],
       
//     );

//     Map<String, dynamic> toJson() => {
//         "CompanyName": companyName,
//         "title": title,
//         "description": description,
//         "postImage": postImage,
//         "sId": sId,
//         "pId": pId,
//         "categories": categories,
//         "active": active,
//         "click": click,
        
//     };
// }

