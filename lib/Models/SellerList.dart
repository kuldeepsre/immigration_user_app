class SellerListModel {
  SellerListModel({
    required this.sId,
    required this.companyName,
    required this.profilePicture,
    required this.city,
  });
  late final String sId;
  late final String companyName;
  late final String profilePicture;
  late final String city;

  SellerListModel.fromJson(Map<String, dynamic> json){
    sId = json['sId'];
    companyName = json['companyName'];
    profilePicture = json['profilePicture'];
    city = json["city"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sId'] = sId;
    _data['companyName'] = companyName;
    _data['profilePicture'] = profilePicture;
    _data['city'] = city;
    return _data;
  }
}
// To parse this JSON data, do
//
//     final sellerlListModel = sellerlListModelFromJson(jsonString);

// import 'dart:convert';

// List<SellerlListModel> sellerlListModelFromJson(String str) => List<SellerlListModel>.from(json.decode(str).map((x) => SellerlListModel.fromJson(x)));

// String sellerlListModelToJson(List<SellerlListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class SellerlListModel {
//     SellerlListModel({
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
    

//     factory SellerlListModel.fromJson(Map<String, dynamic> json) => SellerlListModel(
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


