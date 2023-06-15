import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/widgets/wishItems.dart';
import 'package:flutter/material.dart';

import '../widgets/screen_title_bar.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({Key? key}) : super(key: key);

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ScreenTitleBar(title: "Page de souhait"),
          Expanded(
            child: DynamicHeightGridView(
              itemCount: 120,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              builder: (ctx, index) {
                /// return your widget here.
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: WishItems(
                    imageUrl: "https://i.pinimg.com/originals/5a/9c/57/5a9c57757209c881706bab086c150931.png",
                    productCurrentPrice: 20000,
                    productDescription: "productDescriptionsssssssssssssss",
                    productTitle: "Title",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
