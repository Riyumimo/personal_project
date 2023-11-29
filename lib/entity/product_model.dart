import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String name,
    required int price,
    required String desc,
    required String type,
    required int amount,
    required DateTime createAt,
  }) = _Product;
  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
