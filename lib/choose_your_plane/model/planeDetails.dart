import 'dart:convert';

PlaneDetails planeDetailsData(dynamic str) =>
    PlaneDetails.fromJson(json.decode(str));

class PlaneDetails {
  bool? success;
  List<Data>? data;

  PlaneDetails({this.success, this.data});

  PlaneDetails.fromJson(Map<String, dynamic> json) {
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
  String? minQuantity;
  String? maxQuantity;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['min_quantity'] = minQuantity;
    data['max_quantity'] = maxQuantity;
    data['price'] = price;
    data['price_with_vat'] = priceWithVat;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
