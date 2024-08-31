import 'dart:convert';

PriceModel priceModelData(String str) => PriceModel.fromJson(json.decode(str));

class PriceModel {
  bool? success;
  List<Data>? data;

  PriceModel({this.success, this.data});

  PriceModel.fromJson(Map<String, dynamic> json) {
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
  int? minQuantity;
  int? maxQuantity;
  String? price;
  String? priceWithVat;
  Null createdAt;
  Null updatedAt;

  Data(
      {this.id,
      this.minQuantity,
      this.maxQuantity,
      this.price,
      this.priceWithVat,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
    price = json['price'];
    priceWithVat = json['price_with_vat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['min_quantity'] = this.minQuantity;
    data['max_quantity'] = this.maxQuantity;
    data['price'] = this.price;
    data['price_with_vat'] = this.priceWithVat;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
