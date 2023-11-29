// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartModel {
  List<Product> get product => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  int get feeApp => throw _privateConstructorUsedError;
  int get shippingFee => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {List<Product> product,
      double subtotal,
      double amount,
      int discount,
      int feeApp,
      int shippingFee,
      double total});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? subtotal = null,
    Object? amount = null,
    Object? discount = null,
    Object? feeApp = null,
    Object? shippingFee = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      feeApp: null == feeApp
          ? _value.feeApp
          : feeApp // ignore: cast_nullable_to_non_nullable
              as int,
      shippingFee: null == shippingFee
          ? _value.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product> product,
      double subtotal,
      double amount,
      int discount,
      int feeApp,
      int shippingFee,
      double total});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? subtotal = null,
    Object? amount = null,
    Object? discount = null,
    Object? feeApp = null,
    Object? shippingFee = null,
    Object? total = null,
  }) {
    return _then(_$CartModelImpl(
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      feeApp: null == feeApp
          ? _value.feeApp
          : feeApp // ignore: cast_nullable_to_non_nullable
              as int,
      shippingFee: null == shippingFee
          ? _value.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CartModelImpl implements _CartModel {
  _$CartModelImpl(
      {required final List<Product> product,
      required this.subtotal,
      required this.amount,
      required this.discount,
      required this.feeApp,
      required this.shippingFee,
      required this.total})
      : _product = product;

  final List<Product> _product;
  @override
  List<Product> get product {
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_product);
  }

  @override
  final double subtotal;
  @override
  final double amount;
  @override
  final int discount;
  @override
  final int feeApp;
  @override
  final int shippingFee;
  @override
  final double total;

  @override
  String toString() {
    return 'CartModel(product: $product, subtotal: $subtotal, amount: $amount, discount: $discount, feeApp: $feeApp, shippingFee: $shippingFee, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.feeApp, feeApp) || other.feeApp == feeApp) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_product),
      subtotal,
      amount,
      discount,
      feeApp,
      shippingFee,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);
}

abstract class _CartModel implements CartModel {
  factory _CartModel(
      {required final List<Product> product,
      required final double subtotal,
      required final double amount,
      required final int discount,
      required final int feeApp,
      required final int shippingFee,
      required final double total}) = _$CartModelImpl;

  @override
  List<Product> get product;
  @override
  double get subtotal;
  @override
  double get amount;
  @override
  int get discount;
  @override
  int get feeApp;
  @override
  int get shippingFee;
  @override
  double get total;
  @override
  @JsonKey(ignore: true)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
