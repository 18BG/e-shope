import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/best_sale.dart';
import 'package:e_shope/widgets/card.dart';
import 'package:e_shope/widgets/catgorie.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLike = false;
  List<Map<String, dynamic>> map = [
    {"Képi": 0},
    {"marque": 1},
    {"complet": 2},
    {"Pull": 3},
    {"Shirt": 4},
    {"Sport": 5},
    {"Képi1": 6},
    {"pull": 7},
    {"Victoire": 8},
    {"shirt": 9}
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin: EdgeInsets.all(width * 0.03),
              width: width * 0.99,
              height: height / 1.65,
              color: Color.fromARGB(255, 241, 238, 238),
              child: const Column(
                children: [
                  HomeCard(),
                  HomeCategorie(),
                ],
              ),
            ),
            BestSale(
              nbBestSale: 4,
            ),
            AllProducts()
          ],
        ),
      ),
    );
  }
}

enum Nouveaute { lafayette, jefferson, Babry, Aymane, Ayman }

// ignore: must_be_immutable
class ProductItemWidget extends StatelessWidget {
  int index;
  ProductItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Action when the product is tapped
      },
      child: Container(
        width: width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/vic$index.jpeg",
              width: width * 0.37,
              height: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Container(
              height: 70,
              child: const Column(
                children: [
                  Text(
                    "Pull",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Price: \$10',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Popularity: recommende',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
