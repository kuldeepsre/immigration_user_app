// To parse this JSON data, do
//
//     final sellerThreePostModel = sellerThreePostModelFromJson(jsonString);

import 'dart:convert';

List<SellerThreePostModel> sellerThreePostModelFromJson(String str) => List<SellerThreePostModel>.from(json.decode(str).map((x) => SellerThreePostModel.fromJson(x)));

String sellerThreePostModelToJson(List<SellerThreePostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SellerThreePostModel {
    SellerThreePostModel({
        this.companyName,
        this.title,
        this.description,
        this.postImage,
        this.sId,
        this.pId,
        this.categories,
        this.active,
        this.click,
      
    });

    String? companyName;
    String? title;
    String? description;
    String? postImage;
    String? sId;
    String? pId;
    String? categories;
    dynamic? active;
    int? click;


    factory SellerThreePostModel.fromJson(Map<String, dynamic> json) => SellerThreePostModel(
        companyName: json["CompanyName"],
        title: json["title"],
        description: json["description"],
        postImage: json["postImage"],
        sId: json["sId"],
        pId: json["pId"],
        categories: json["categories"],
        active: json["active"],
        click: json["click"],
       
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
 
    };
}


