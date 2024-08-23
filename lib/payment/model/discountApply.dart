import 'dart:convert';

DiscountApplyModel discountApplyModel(String str) =>
    DiscountApplyModel.fromJson(json.decode(str));

class DiscountApplyModel {
  String? message;
  Discount? discount;

  DiscountApplyModel({this.message, this.discount});

  DiscountApplyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    return data;
  }
}

class Discount {
  int? id;
  String? name;
  String? value;
  String? type;
  String? startsAt;
  String? endsAt;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  Discount(
      {this.id,
      this.name,
      this.value,
      this.type,
      this.startsAt,
      this.endsAt,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    type = json['type'];
    startsAt = json['starts_at'];
    endsAt = json['ends_at'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['type'] = this.type;
    data['starts_at'] = this.startsAt;
    data['ends_at'] = this.endsAt;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
