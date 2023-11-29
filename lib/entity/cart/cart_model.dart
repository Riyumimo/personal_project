import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product_model.dart';

part 'cart_model.freezed.dart';

@freezed
class CartModel with _$CartModel {
  factory CartModel({
    required List<Product> product,
    required double subtotal,
    required double amount,
    required int discount,
    required int feeApp,
    required int shippingFee,
    required double total,
  }) = _CartModel;
}
