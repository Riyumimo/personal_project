import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dicoding_project/entity/cart/cart_model.dart';
import 'package:dicoding_project/entity/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.loading()) {
    on<CartEvent>(_cartEvent);
    on<AddCartEvent>(_addCartEvent);
    on<RemoveCartEvent>(_removeCartEvent);
    on<DeleteCartEvent>(_deleteCartEvent);
    on<IncrementProduct>(_incrementProductEvent);
    on<DecrementProduct>(_decrementProductEvent);
  }

  FutureOr<void> _cartEvent(CartEvent event, Emitter<CartState> emit) {}

  FutureOr<void> _addCartEvent(
      AddCartEvent event, Emitter<CartState> emit) async {
    final product = event.product;
    final List<Product> updateProduct = List.from(state.cartModel.product);
    updateProduct.add(product);
    final updateCartModel = state.cartModel.copyWith(product: updateProduct);
    emit(CartState.loading());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(CartState.loaded(updateCartModel));
    print(state.cartModel.product.length);
  }

  FutureOr<void> _removeCartEvent(
      RemoveCartEvent event, Emitter<CartState> emit) {
    final listProduct = state.cartModel.product;
    listProduct.remove(event.product);
  }

  FutureOr<void> _deleteCartEvent(
      DeleteCartEvent event, Emitter<CartState> emit) {}

  FutureOr<void> _incrementProductEvent(
      IncrementProduct event, Emitter<CartState> emit) {
    final List<Product> products = List.from(state.cartModel.product);
    if (event.producId >= 0 && event.producId < products.length) {
      final Product selectedProduct = products[event.producId];

      //update amount product
      final int updateAmount = selectedProduct.amount + 1;

      final updateProduct = selectedProduct.copyWith(amount: updateAmount);
      //Replace old product with new
      products[event.producId] = updateProduct;
      //copyWith cartModel

      final updateCart = state.cartModel.copyWith(product: products);
      emit(CartState.loaded(updateCart));
    }
  }

  FutureOr<void> _decrementProductEvent(
      DecrementProduct event, Emitter<CartState> emit) {
    final List<Product> products = List.from(state.cartModel.product);
    if (event.producId >= 0 && event.producId < products.length) {
      final Product selectedProduct = products[event.producId];

      // Update amount of the product (decrement by 1)
      final int updatedAmount = selectedProduct.amount - 1;

      // Ensure the amount doesn't go below zero
      final int newAmount = updatedAmount >= 0 ? updatedAmount : 0;

      final updatedProduct = selectedProduct.copyWith(amount: newAmount);
      products[event.producId] = updatedProduct;

      final updatedCart = state.cartModel.copyWith(product: products);
      emit(CartState.loaded(updatedCart));
    }
  }
}
