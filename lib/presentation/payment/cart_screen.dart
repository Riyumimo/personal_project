import 'package:dicoding_project/entity/cart/cart_model.dart';
import 'package:dicoding_project/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:dicoding_project/services/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const name = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.shop), Text("Cart")],
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        switch (state.message) {
          case CartMessageState.Loading:
            return const Center(child: CircularProgressIndicator());
          case CartMessageState.Loaded:
            final product = state.cartModel.product;
            final cart = state.cartModel;
            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Product"),
                SizedBox(
                  height: 400.h,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffC4C4C4)),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                width: 183,
                                child: Text(product[index].name),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text("${product[index].price}"),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          DecrementProduct(producId: index));
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                  Text("${product[index].amount}"),
                                  InkWell(
                                    onTap: () {
                                      print("add");
                                      context.read<CartBloc>().add(
                                          IncrementProduct(producId: index));
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.delete)
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Color(0xffD0D0D0),
                      thickness: 1,
                    ),
                    itemCount: product.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("SubTotal :"),
                    Text("${cart.subtotal}")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount :"),
                    Text("${cart.discount}")
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total :"), Text("${cart.total}")],
                ),
                Center(
                    child: OutlinedButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(AddCartEvent(product: dummyProduct()));
                        },
                        child: const Text("CheckOut")))
              ],
            );
          case CartMessageState.Loaded:
            return const Center(
              child: Text("Errir"),
            );
          default:
            return Container();
        }
      }),
    );
  }
}
