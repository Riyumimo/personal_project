import 'package:flutter/material.dart';
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
      body: Column(
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
                          shape: BoxShape.circle, color: Color(0xffC4C4C4)),
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
                          child: const Text("Procuct 1"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("Rp.10.000.000"),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                print("remove");
                              },
                              child: const Icon(Icons.remove),
                            ),
                            const Text("0"),
                            InkWell(
                              onTap: () {
                                print("add");
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
              itemCount: 4,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("SubTotal :"), Text("100.0000.000")],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Discount :"), Text("100")],
          ),
          const Divider(
            thickness: 2,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total :"), Text("100")],
          ),
          Center(
              child: OutlinedButton(
                  onPressed: () {}, child: const Text("CheckOut")))
        ],
      ),
    );
  }
}
