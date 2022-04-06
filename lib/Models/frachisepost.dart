class FranchisePost {
  FranchisePost({
    required this.uId,
    required this.name,
    required this.interested,
    required this.areaType,
    required this.phoneNo,
    required this.qualification,
    required this.totalArea,
    required this.floorArea,
    required this.aadharCard,
    required this.panCard,
    required this.readyToInvest,
    required this.postImage,
  });
  late final String uId;
  late final String name;
  late final String interested;
  late final String areaType;
  late final String phoneNo;
  late final String qualification;
  late final String totalArea;
  late final String floorArea;
  late final String aadharCard;
  late final String panCard;
  late final String readyToInvest;
  late final String postImage;

  FranchisePost.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    interested = json['interested'];
    areaType = json['areaType'];
    phoneNo = json['phoneNo'];
    qualification = json['qualification'];
    totalArea = json['totalArea'];
    floorArea = json['floorArea'];
    aadharCard = json['aadharCard'];
    panCard = json['panCard'];
    readyToInvest = json['readyToInvest'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uId'] = uId;
    _data['name'] = name;
    _data['interested'] = interested;
    _data['areaType'] = areaType;
    _data['phoneNo'] = phoneNo;
    _data['qualification'] = qualification;
    _data['totalArea'] = totalArea;
    _data['floorArea'] = floorArea;
    _data['aadharCard'] = aadharCard;
    _data['panCard'] = panCard;
    _data['readyToInvest'] = readyToInvest;
    _data['postImage'] = postImage;
    return _data;
  }
}