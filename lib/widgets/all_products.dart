import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/models/categorie_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/screens/product_view_screnn.dart';
import 'package:e_shope/widgets/productItem.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_shope/screens/login_screen.dart';

//import 'package:e_shope/provider/provider.dart';
//import 'package:e_shope/utilities/constants.dart';
//import 'package:e_shope/widgets/change_profil.dart';
//import 'package:e_shope/widgets/text_form_field.dart';
//import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/client_model.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AllProducts> {
  List<ProduitModel> allProduct = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<UserProvider>(
      builder: (context, child, _) {
        allProduct = child.listProduit;
        print(allProduct.length);
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.03),
              height: height * 0.075,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Row(
                children: [
                  Text(
                    "Tous les produits",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Container(
              child: DynamicHeightGridView(
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: allProduct.length,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                builder: (ctx, index) {
                  /// return your widget here.
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ProductViewScreen(
                                  produit: allProduct[index])));
                    },
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: ProductItemWidget(
                          produit: allProduct[index],
                        )),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
