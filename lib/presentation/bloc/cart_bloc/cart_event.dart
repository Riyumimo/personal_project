part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddCartEvent extends CartEvent {
  final Product product;

  AddCartEvent({required this.product});
}

class IncrementProduct extends CartEvent {
  final int producId;

  IncrementProduct({required this.producId});
}

class DecrementProduct extends CartEvent {
  final int producId;

  DecrementProduct({required this.producId});
}

class RemoveCartEvent extends CartEvent {
  final Product product;

  RemoveCartEvent({required this.product});
}

class DeleteCartEvent extends CartEvent {}
