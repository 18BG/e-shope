import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/screens/product_view_screnn.dart';
import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/wishItems.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/achat_produit.dart';
import '../provider/provider.dart';
import '../widgets/input.dart';
import '../widgets/my_drawer.dart';
import '../widgets/screen_title_bar.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({Key? key}) : super(key: key);

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            SizedBox(
              width: widht * 0.6,
              child: const Input(
                hintText: 'Recherche',
                prefixIcon: true,
                iconType: Icons.search,
                rayon: 15.0,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            child: ClipRRect(
              child: Image.asset(
                'assets/images/victoire.jpeg',
                fit: BoxFit.contain,
                width: widht * 0.092,
              ),
            ),
          ),
          SizedBox(
            width: widht * 0.064,
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          List<LikeModel> likeList = value.likeList;
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                ScreenTitleBar(title: "Page de souhait"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      DynamicHeightGridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: likeList.length,
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 5,
                        builder: (ctx, index) {
                          /// return your widget here.
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductViewScreen(
                                            produit: ProduitModel(
                                                nom: likeList[index].nom,
                                                description:
                                                    likeList[index].description,
                                                prix: likeList[index].prix,
                                                image: likeList[index].image,
                                                qteStock:
                                                    likeList[index].qteStock,
                                                like: likeList[index].like),
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: WishItems(
                                produit: likeList[index],
                              ),
                            ),
                          );
                        },
                      ),
                      AllProducts()
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
