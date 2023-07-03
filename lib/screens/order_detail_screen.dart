import 'package:flutter/material.dart';

import '../widgets/order_detail_product.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text("Order Tracker"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10)),
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text("01 Dec, 2022"),
                          Spacer(),
                          Row(children: [
                            Text("Order ID :"),
                            Text("#1240350000"),
                            Spacer(),
                            Text("Amount :"),
                            Text(
                              "#234",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Spacer()
                        ]),
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return OrderProductDetailWidget(
                        productCurrentPrice: 250,
                        productDescription: "Capi",
                        productTitle: "best all",
                        productNumber: 20,
                        imageUrl: "assets/images/vic0.jpeg",
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
