
import 'package:e_shope/widgets/order_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/panier_widget.dart';
import '../widgets/screen_title_bar.dart';

class PanierListScreen extends StatefulWidget {
  const PanierListScreen({Key? key}) : super(key: key);

  @override
  State<PanierListScreen> createState() => _PanierListScreenState();
}

class _PanierListScreenState extends State<PanierListScreen> {
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
                  return PanierWidget(
                  ico: Icons.restore,
                  productNumber: 3,
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
