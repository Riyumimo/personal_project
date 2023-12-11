part of 'cart_bloc.dart';

enum CartMessageState {
  Loaded,
  Loading,
  Error,
}

@immutable
class CartState {
  CartState._({required this.message, CartModel? cartModel})
      : cartModel = cartModel ??
            CartModel(
                product: [],
                subtotal: 0,
                amount: 0,
                discount: 0,
                feeApp: 0,
                shippingFee: 0,
                total: 0);
  CartState.loaded(CartModel cartModel)
      : this._(message: CartMessageState.Loaded, cartModel: cartModel);
  CartState.loading() : this._(message: CartMessageState.Loading);
  CartState.error(String message) : this._(message: CartMessageState.Error);
  final CartMessageState message;
  final CartModel cartModel;
}
