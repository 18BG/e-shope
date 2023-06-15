
import 'package:e_shope/widgets/order_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/screen_title_bar.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ScreenTitleBar(title: "Mes achats"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return OrderWidget(
                  ico: Icons.restore,
                  resultText: "restored",
                  imageUrl: "https://static.vecteezy.com/system/resources/previews/009/665/781/original/school-bag-for-student-or-bag-for-kid-free-png.png",
                  productCurrentPrice: 20000,
                  productDescription: "productDescriptionsssssssssssssss",
                  productTitle: "Title",
                );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
