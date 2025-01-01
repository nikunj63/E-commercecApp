import 'package:ecommerce_frontend/Data/models/products/product_model.dart';

class CartItemModel {
  ProductModel? product;
  int? quantity;
  String? sId;

  CartItemModel({this.quantity, this.sId, this.product});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    product = ProductModel.fromJson(json["product"]);
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = product!.sId;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}