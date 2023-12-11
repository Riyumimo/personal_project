import 'package:dicoding_project/entity/cart/cart_model.dart';
import 'package:dicoding_project/entity/product/product_model.dart';

Product dummyProduct() {
  final product = Product(
      id: 1,
      name: "name",
      price: 100,
      desc: "LoremImplus",
      type: "min",
      amount: 100,
      createAt: DateTime.now());
  final cart = CartModel(
      product: [product],
      subtotal: product.price.toDouble(),
      amount: 3,
      discount: 20000,
      feeApp: 200,
      shippingFee: 100,
      total: 10000);
  return product;
}
