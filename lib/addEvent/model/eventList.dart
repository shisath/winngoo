import 'dart:convert';

EventList eventListData(String str) => EventList.fromJson(json.decode(str));

// class EventList {
//   bool? success;
//   List<Data>? data;
//
//   EventList({this.success, this.data});
//
//   EventList.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? name;
//   String? date;
//   String? time;
//   String? user_id;
//   String? updatedAt;
//   String? createdAt;
//   int? id;
//
//   Data(
//       {this.name,
//       this.date,
//       this.time,
//       this.user_id,
//       this.updatedAt,
//       this.createdAt,
//       this.id});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     date = json['date'];
//     time = json['time'];
//     user_id = json['user_id'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['date'] = this.date;
//     data['time'] = this.time;
//     data['user_id'] = this.user_id;
//     data['updated_at'] = this.updatedAt;
//     data['created_at'] = this.createdAt;
//     data['id'] = this.id;
//     return data;
//   }
// }
class EventList {
  bool? success;
  List<Data>? data;

  EventList({this.success, this.data});

  EventList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? date;
  String? time;
  String? userId;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Transactions>? transactions;

  Data(
      {this.id,
      this.name,
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
    date = json['date'];
    time = json['time'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date'] = date;
    data['time'] = time;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
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
  String? meetingCode;
  String? profilePhoto;
  String? emailVerifiedAt;
  String? country;
  String? agreement;
  String? createdAt;
  String? updatedAt;
  Null inviteCode;
  Null invitedBy;

  User(
      {this.id,
      this.userId,
      this.firstName,
      this.surname,
      this.mobileNumber,
      this.email,
      this.meetingCode,
      this.profilePhoto,
      this.emailVerifiedAt,
      this.country,
      this.agreement,
      this.createdAt,
      this.updatedAt,
      this.inviteCode,
      this.invitedBy});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    surname = json['surname'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    meetingCode = json['meeting_code'];
    profilePhoto = json['profile_photo'];
    emailVerifiedAt = json['email_verified_at'];
    country = json['country'];
    agreement = json['agreement'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inviteCode = json['invite_code'];
    invitedBy = json['invited_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['surname'] = surname;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['meeting_code'] = meetingCode;
    data['profile_photo'] = profilePhoto;
    data['email_verified_at'] = emailVerifiedAt;
    data['country'] = country;
    data['agreement'] = agreement;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['invite_code'] = inviteCode;
    data['invited_by'] = invitedBy;
    return data;
  }
}

class Transactions {
  int? id;
  String? stripeTransactionId;
  String? userId;
  String? eventId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['stripe_transaction_id'] = stripeTransactionId;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['amount'] = amount;
    data['currency'] = currency;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
