// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      desc: json['desc'] as String,
      type: json['type'] as String,
      amount: json['amount'] as int,
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'desc': instance.desc,
      'type': instance.type,
      'amount': instance.amount,
      'createAt': instance.createAt.toIso8601String(),
    };
