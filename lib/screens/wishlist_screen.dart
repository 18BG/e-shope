import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/screens/product_view_screnn.dart';
import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/wishItems.dart';

import 'package:flutter/material.dart';

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
      drawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Container(
              width: widht * 0.6,
              child: Input(
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ScreenTitleBar(title: "Page de souhait"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductViewScreen()));
                    },
                    child: DynamicHeightGridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 5,
                      builder: (ctx, index) {
                        /// return your widget here.
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: WishItems(
                            imageUrl: "assets/images/vic0.jpeg",
                            productCurrentPrice: 20000,
                            productDescription: "best of the victory kepi",
                            productTitle: "Victory kepi",
                          ),
                        );
                      },
                    ),
                  ),
                  AllProducts()
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
