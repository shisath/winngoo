import 'dart:convert';

LoginData loginValueData(dynamic str) => LoginData.fromJson(json.decode(str));

class LoginData {
  bool? success;
  String? message;
  Data? data;

  LoginData({this.success, this.message, this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? firstName;
  String? surname;

  Data({this.token, this.firstName, this.surname});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    firstName = json['first_name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['first_name'] = this.firstName;
    data['surname'] = this.surname;
    return data;
  }
}
