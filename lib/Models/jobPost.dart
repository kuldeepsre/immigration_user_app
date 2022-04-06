class JobPost {
  JobPost({
    required this.uId,
    required this.salary,
    required this.name,
    required this.mobileNo,
    required this.qualification,
    required this.exerience,
    required this.interested,
    required this.location,
    required this.postImage,
    required this.designation,
    required this.email,
  });
  late final String uId;
  late final String salary;
  late final String name;
  late final String mobileNo;
  late final String qualification;
  late final String exerience;
  late final String interested;
  late final String location;
  late final String postImage;
  late final String designation;
  late final String email;

  JobPost.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    salary = json['salary'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    qualification = json['qualification'];
    exerience = json['exerience'];
    interested = json['interested'];
    location = json['location'];
    postImage = json['postImage'];
    designation = json['designation'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uId'] = uId;
    _data['salary'] = salary;
    _data['name'] = name;
    _data['mobileNo'] = mobileNo;
    _data['qualification'] = qualification;
    _data['experience'] = exerience;
    _data['interested'] = interested;
    _data['location'] = location;
    _data['postImage'] = postImage;
    _data['designation'] = designation;
    _data['email'] = email;
    return _data;
  }
}