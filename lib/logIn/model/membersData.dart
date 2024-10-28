import 'dart:convert';

MembersData membersData(dynamic str) => MembersData.fromJson(json.decode(str));

class MembersData {
  bool? success;
  List<Data>? data;

  MembersData({this.success, this.data});

  MembersData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? firstName;
  String? surname;
  String? mobileNumber;
  String? email;
  String? profilePhoto;
  Null? emailVerifiedAt;
  String? country;
  int? agreement;
  String? createdAt;
  String? updatedAt;
  int? invitedBy;

  Data(
      {this.id,
      this.userId,
      this.firstName,
      this.surname,
      this.mobileNumber,
      this.email,
      this.profilePhoto,
      this.emailVerifiedAt,
      this.country,
      this.agreement,
      this.createdAt,
      this.updatedAt,
      this.invitedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    surname = json['surname'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    profilePhoto = json['profile_photo'];
    emailVerifiedAt = json['email_verified_at'];
    country = json['country'];
    agreement = json['agreement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    invitedBy = json['invited_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['surname'] = this.surname;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['profile_photo'] = this.profilePhoto;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['country'] = this.country;
    data['agreement'] = this.agreement;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['invited_by'] = this.invitedBy;
    return data;
  }
}
