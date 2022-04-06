class LuggagePost {
  LuggagePost({
    required this.pId,
    required this.uId,
     this.timing,
    required this.name,
    required this.fatherName,
    required this.address,
    required this.phoneNo,
    required this.alternatePhoneNo,
    required this.passportNo,
    required this.aadharCard,
    required this.countryName,
    required this.city,
    required this.flightTimeing,
    required this.flightNameAndNo,
    required this.description,
    required this.detailsOfLuggage,
    required this.totalWeight,
    required this.amountOffer,
    required this.receiverName,
    required this.receiverFatherName,
    required this.receiverPhoneNo,
    required this.receiverPassportNo,
    required this.receiverAddress,
    required this.receiverPersonImage,
  });
  late  String pId;
  late  String uId;
    String? timing;
  late  String name;
  late  String fatherName;
  late  String address;
  late  String phoneNo;
  late  String alternatePhoneNo;
  late  String passportNo;
  late  String aadharCard;
  late  String countryName;
  late  String city;
  late  String flightTimeing;
  late  String flightNameAndNo;
  late  String description;
  late  String detailsOfLuggage;
  late  String totalWeight;
  late  String amountOffer;
  late  String receiverName;
  late  String receiverFatherName;
  late  String receiverPhoneNo;
  late  String receiverPassportNo;
  late  String receiverAddress;
  late  String receiverPersonImage;

  LuggagePost.fromJson(Map<String, dynamic> json){
    pId = json['pId'];
    uId = json['uId'];
    timing = json['timing'];
    name = json['name'];
    fatherName = json['fatherName'];
    address = json['address'];
    phoneNo = json['phoneNo'];
    alternatePhoneNo = json['alternatePhoneNo'];
    passportNo = json['passportNo'];
    aadharCard = json['aadharCard'];
    countryName = json['countryName'];
    city = json['city'];
    flightTimeing = json['flightTimeing'];
    flightNameAndNo = json['flightNameAndNo'];
    description = json['description'];
    detailsOfLuggage = json['detailsOfLuggage'];
    totalWeight = json['totalWeight'];
    amountOffer = json['amountOffer'];
    receiverName = json['receiverName'];
    receiverFatherName = json['receiverFatherName'];
    receiverPhoneNo = json['receiverPhoneNo'];
    receiverPassportNo = json['receiverPassportNo'];
    receiverAddress = json['receiverAddress'];
    receiverPersonImage= json['receiverPersonImage;'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pId'] = pId;
    _data['uId'] = uId;
    _data['timing'] = timing;
    _data['name'] = name;
    _data['fatherName'] = fatherName;
    _data['address'] = address;
    _data['phoneNo'] = phoneNo;
    _data['alternatePhoneNo'] = alternatePhoneNo;
    _data['passportNo'] = passportNo;
    _data['aadharCard'] = aadharCard;
    _data['countryName'] = countryName;
    _data['city'] = city;
    _data['flightTimeing'] = flightTimeing;
    _data['flightNameAndNo'] = flightNameAndNo;
    _data['description'] = description;
    _data['detailsOfLuggage'] = detailsOfLuggage;
    _data['totalWeight'] = totalWeight;
    _data['amountOffer'] = amountOffer;
    _data['receiverName'] = receiverName;
    _data['receiverFatherName'] = receiverFatherName;
    _data['receiverPhoneNo'] = receiverPhoneNo;
    _data['receiverPassportNo'] = receiverPassportNo;
    _data['receiverAddress'] = receiverAddress;
    _data['receiverPersonImage;'] = receiverPersonImage;
    return _data;
  }
}