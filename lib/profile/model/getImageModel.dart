import 'dart:convert';

GetImageModel getImageModel(String str) =>
    GetImageModel.fromJson(json.decode(str));

class GetImageModel {
  bool? success;
  String? photoUrl;

  GetImageModel({this.success, this.photoUrl});

  GetImageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}
