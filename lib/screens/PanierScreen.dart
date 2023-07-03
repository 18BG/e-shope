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
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return PanierWidget(
                            ico: Icons.restore,
                            productNumber: 3,
                            imageUrl: "assets/images/vic0.jpeg",
                            productCurrentPrice: 20000,
                            productDescription:
                                "produit victoire de haute gamme pour les victorieux seulements ou pour les victorieux en devenir",
                            productTitle: "kepi Victoire",
                          );
                        },
                      ),
                    ),
                    const AllProducts(),
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
