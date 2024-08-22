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
  String? name;
  String? date;
  String? time;
  String? user_id;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.date,
      this.time,
      this.user_id,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    time = json['time'];
    user_id = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['time'] = this.time;
    data['user_id'] = this.user_id;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
