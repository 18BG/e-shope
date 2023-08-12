import 'package:e_shope/widgets/all_products.dart';
import 'package:e_shope/widgets/my_drawer.dart';
import 'package:e_shope/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../widgets/input.dart';
import '../widgets/screen_title_bar.dart';
import 'order_detail_screen.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
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
            ScreenTitleBar(title: "Mes achats"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: ListView.builder(
                    itemCount: provider.commandeList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetailScreen(
                                      commande: provider.commandeList[index])));
                        },
                        child: OrderWidget(
                          ico:
                              provider.commandeList[index].etatCommande == false
                                  ? Icons.restore
                                  : Icons.stay_current_landscape_sharp,
                          result: "restored",
                          commande: provider.commandeList[index],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
