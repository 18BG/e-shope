import 'package:e_shope/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/all_products.dart';
import '../widgets/panier_widget.dart';
import '../widgets/screen_title_bar.dart';

class PanierListScreen extends StatelessWidget {
  const PanierListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, child, _) => Container(
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
                          itemCount: child.panierList.length,
                          itemBuilder: (context, index) {
                            return PanierWidget(
                              ico: Icons.restore,
                              productNumber: 3,
                              pannier: child.panierList[index],
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
      ),
    );
  }
}
