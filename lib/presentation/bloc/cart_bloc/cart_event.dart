part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddCartEvent extends CartEvent {}

class RemoveCartEvent extends CartEvent {}

class DeleteCartEvent extends CartEvent {}
