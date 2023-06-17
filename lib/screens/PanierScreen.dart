import 'package:e_shope/widgets/input.dart';
import 'package:e_shope/widgets/my_drawer.dart';
import 'package:e_shope/widgets/order_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/all_products.dart';
import '../widgets/panier_widget.dart';
import '../widgets/screen_title_bar.dart';

class PanierListScreen extends StatelessWidget {
  const PanierListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ScreenTitleBar(title: "Mon Pannier"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return PanierWidget(
                            ico: Icons.restore,
                            productNumber: 3,
                            imageUrl: "assets/images/vic0.jpeg",
                            productCurrentPrice: 20000,
                            productDescription:
                                "productDescriptionsssssssssssssss",
                            productTitle: "Title",
                          );
                        },
                      ),
                    ),
                    AllProducts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
