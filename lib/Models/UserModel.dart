class UserModel {
  UserModel({
    required this.uId,
    required this.name,
    required this.phoneNo,
    required this.email,
    required this.city,
    required this.dateOfBirth,
     this.profilePicture,
  });
  late final String uId;
  late final String name;
  late final String phoneNo;
  late final String email;
  late final String city;
  late final String dateOfBirth;
   String? profilePicture;

  UserModel.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    city = json['city'];
    dateOfBirth = json['dateOfBirth'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uId'] = uId;
    _data['name'] = name;
    _data['phoneNo'] = phoneNo;
    _data['email'] = email;
    _data['city'] = city;
    _data['dateOfBirth'] = dateOfBirth;
    _data['profilePicture'] = profilePicture;
    return _data;
  }
}