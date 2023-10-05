import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/best_sale.dart';
import 'package:e_shope/widgets/card.dart';
import 'package:e_shope/widgets/catgorie.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
    if (provider.categoryList.isEmpty) {
      provider.getCategoryProvider();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(width * 0.03),
                        width: width * 0.99,
                        height: height / 1.59,
                        color: const Color.fromARGB(255, 241, 238, 238),
                        child: const Column(
                          children: [
                            Expanded(child: HomeCard()),
                            HomeCategorie(),
                          ],
                        ),
                      ),
                      BestSale(
                        nbBestSale: 4,
                      ),
                      AllProducts(
                        isTrue: false,
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
