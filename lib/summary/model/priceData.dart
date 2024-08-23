import 'dart:convert';

PriceData priceData(String str) => PriceData.fromJson(json.decode(str));

class PriceData {
  bool? success;
  Data? data;

  PriceData({this.success, this.data});

  PriceData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? vat;
  String? type;
  Null createdAt;
  Null updatedAt;

  Data(
      {this.id,
      this.minQuantity,
      this.maxQuantity,
      this.price,
      this.priceWithVat,
      this.vat,
      this.type,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    minQuantity = json['min_quantity'];
    maxQuantity = json['max_quantity'];
    price = json['price'];
    priceWithVat = json['price_with_vat'];
    vat = json['vat'];
    type = json['type'];
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
    data['vat'] = vat;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
