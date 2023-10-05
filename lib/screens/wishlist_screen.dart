import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/screens/product_view_screnn.dart';
import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/my_app_bar.dart';
import 'package:e_shope/widgets/wishItems.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
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
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar(),
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
                      likeList.isEmpty
                          ? Center(
                              heightFactor:
                                  MediaQuery.of(context).size.height * 0.006,
                              child: Text(
                                "Page de souhait vide",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            20),
                              ),
                            )
                          : DynamicHeightGridView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
                                            builder: (context) =>
                                                ProductViewScreen(
                                                  produit: ProduitModel(
                                                      imageUrl: likeList[index]
                                                          .imageUrl,
                                                      nom: likeList[index].nom,
                                                      description:
                                                          likeList[index]
                                                              .description,
                                                      prix:
                                                          likeList[index].prix,
                                                      image:
                                                          likeList[index].image,
                                                      qteStock: likeList[index]
                                                          .qteStock,
                                                      like:
                                                          likeList[index].like),
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
                      AllProducts(
                        isTrue: true,
                      )
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
