import 'dart:convert';

List<videoCategory> videoCategoryData(dynamic str) => List<videoCategory>.from(
    (json.decode(str) as List<dynamic>).map((x) => videoCategory.fromJson(x)));

class videoCategory {
  int? id;
  String? title;
  String? url;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  videoCategory(
      {this.id,
      this.title,
      this.url,
      this.categoryId,
      this.createdAt,
      this.updatedAt});

  videoCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
