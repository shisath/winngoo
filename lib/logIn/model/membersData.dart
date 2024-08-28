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
  String? firstName;
  String? surname;
  String? mobileNumber;
  String? email;
  Null emailVerifiedAt;
  String? country;
  String? agreement;
  String? createdAt;
  String? updatedAt;
  String? user_id;
  Null inviteCode;
  String? invitedBy;

  Data(
      {this.id,
      this.firstName,
      this.surname,
      this.mobileNumber,
      this.email,
      this.emailVerifiedAt,
      this.country,
      this.agreement,
      this.createdAt,
      this.updatedAt,
      this.user_id,
      this.inviteCode,
      this.invitedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    surname = json['surname'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    country = json['country'];
    agreement = json['agreement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user_id = json['user_id'];
    inviteCode = json['invite_code'];
    invitedBy = json['invited_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['surname'] = this.surname;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['country'] = this.country;
    data['agreement'] = this.agreement;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.user_id;
    data['invite_code'] = this.inviteCode;
    data['invited_by'] = this.invitedBy;
    return data;
  }
}
