class PostModel {
  PostModel({
    required this.title,
    required this.description,
    required this.postImage,
    required this.sId,
    required this.pId,
    required this.categories,
  });
  late final String title;
  late final String description;
  late final String postImage;
  late final String sId;
  late final String pId;
  late final String categories;

  PostModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    postImage = json['postImage'];
    sId = json['sId'];
    pId = json['pId'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['postImage'] = postImage;
    _data['sId'] = sId;
    _data['pId'] = pId;
    _data['categories'] = categories;
    return _data;
  }
}