class RequirementPost {
  RequirementPost({
    required this.uId,
    required this.category,
    required this.title,
    required this.mobileNo,
    required this.qualification,
    required this.required,
    required this.describeYourRequirement,
    required this.postImage,
  });
  late final String uId;
  late final String category;
  late final String title;
  late final String mobileNo;
  late final String qualification;
  late final String required;
  late final String describeYourRequirement;
  late final String postImage;

  RequirementPost.fromJson(Map<String, dynamic> json){
    uId = json['uId'];
    category = json['category'];
    title = json['title'];
    mobileNo = json['mobileNo'];
    qualification = json['qualification'];
    required = json['required'];
    describeYourRequirement = json['describeYourRequirement'];
    postImage = json['postImage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uId'] = uId;
    _data['category'] = category;
    _data['title'] = title;
    _data['mobileNo'] = mobileNo;
    _data['qualification'] = qualification;
    _data['required'] = required;
    _data['describeYourRequirement'] = describeYourRequirement;
    _data['postImage'] = postImage;
    return _data;
  }
}