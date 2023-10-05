import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/my_app_bar.dart';

import 'package:flutter/material.dart';

import '../widgets/input.dart';
import '../widgets/my_drawer.dart';
import '../widgets/screen_title_bar.dart';

class AllCategorieScreen extends StatefulWidget {
  AllCategorieScreen({Key? key, this.value}) : super(key: key);
  String? value;
  @override
  State<AllCategorieScreen> createState() => _AllCategorieScreenState();
}

class _AllCategorieScreenState extends State<AllCategorieScreen> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ScreenTitleBar(
              title: "All ategorie",
              isTrue: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: AllProducts(
                  value: widget.value,
                  isTrue: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
