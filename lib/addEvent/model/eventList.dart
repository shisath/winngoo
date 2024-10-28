import 'dart:convert';

EventList eventListData(String str) => EventList.fromJson(json.decode(str));

class EventList {
  bool? success;
  List<Data>? data;

  EventList({this.success, this.data});

  EventList.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? meetingCode;
  String? date;
  String? time;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Transactions>? transactions;

  Data(
      {this.id,
      this.name,
      this.meetingCode,
      this.date,
      this.time,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    meetingCode = json['meeting_code'];
    date = json['date'];
    time = json['time'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['meeting_code'] = this.meetingCode;
    data['date'] = this.date;
    data['time'] = this.time;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? userId;
  String? firstName;
  String? surname;
  String? mobileNumber;
  String? email;
  String? priceId;
  String? profilePhoto;
  String? emailVerifiedAt;
  String? country;
  int? agreement;
  String? createdAt;
  String? updatedAt;
  int? invitedBy;

  User(
      {this.id,
      this.userId,
      this.firstName,
      this.surname,
      this.mobileNumber,
      this.email,
      this.priceId,
      this.profilePhoto,
      this.emailVerifiedAt,
      this.country,
      this.agreement,
      this.createdAt,
      this.updatedAt,
      this.invitedBy});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    surname = json['surname'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    priceId = json['price_id'];
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
    data['price_id'] = this.priceId;
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

class Transactions {
  int? id;
  String? stripeTransactionId;
  String? userId;
  int? eventId;
  String? amount;
  String? currency;
  String? status;
  String? createdAt;
  String? updatedAt;

  Transactions(
      {this.id,
      this.stripeTransactionId,
      this.userId,
      this.eventId,
      this.amount,
      this.currency,
      this.status,
      this.createdAt,
      this.updatedAt});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stripeTransactionId = json['stripe_transaction_id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    amount = json['amount'];
    currency = json['currency'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stripe_transaction_id'] = this.stripeTransactionId;
    data['user_id'] = this.userId;
    data['event_id'] = this.eventId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
