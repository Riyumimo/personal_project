import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  static const name = "/checkout";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // physics: veri,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                // shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text("Lokasi Pengiriman"),
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                          "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font,"),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Column(
              children: List.generate(3, (index) => const CheckOutItem()),
            ),
            const Divider(
              thickness: 1,
            ),
            const Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                print("payment");
              },
              child: const SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Text("Payment Method"),
                    Spacer(),
                    Text("Qris"),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("SubTotal:"), Text("30.000")],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Ongkos Pengiriman:"), Text("30.000")],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Discount:"), Text("30.000")],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Fee Aplikasi"), Text("3.000")],
            ),
            const Divider(
              thickness: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total"), Text("30.000")],
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text("Lakukan Pembayaran"))
          ],
        ),
      ),
    );
  }
}

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                width: 183,
                child: Text("Procuct 1"),
              ),
              SizedBox(
                height: 12,
              ),
              Text("Rp.10.000.000"),
              Row(
                children: [
                  Text("0"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
