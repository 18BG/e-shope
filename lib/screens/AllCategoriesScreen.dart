import 'package:e_shope/widgets/all_products.dart';

import 'package:flutter/material.dart';

import '../widgets/input.dart';
import '../widgets/my_drawer.dart';
import '../widgets/screen_title_bar.dart';

class AllCategorieScreen extends StatefulWidget {
  const AllCategorieScreen({Key? key}) : super(key: key);

  @override
  State<AllCategorieScreen> createState() => _AllCategorieScreenState();
}

class _AllCategorieScreenState extends State<AllCategorieScreen> {
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
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
            ScreenTitleBar(
              title: "All ategorie",
              isTrue: true,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: AllProducts(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
