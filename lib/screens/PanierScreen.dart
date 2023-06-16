
import 'package:e_shope/widgets/input.dart';
import 'package:e_shope/widgets/my_drawer.dart';
import 'package:e_shope/widgets/order_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/panier_widget.dart';
import '../widgets/screen_title_bar.dart';

class PanierListScreen extends StatefulWidget {
  const PanierListScreen({Key? key}) : super(key: key);

  @override
  State<PanierListScreen> createState() => _PanierListScreenState();
}

class _PanierListScreenState extends State<PanierListScreen> {
  @override
  Widget build(BuildContext context) {
    //final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      // drawer: MyDrawer(),
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   iconTheme: IconThemeData(
      //     color: Colors.black
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Row(
      //     children: [
      //       Container(
      //         width: widht * 0.6,
      //         child: Input(
      //           hintText: 'Recherche',
      //           prefixIcon: true,
      //           iconType: Icons.search,
      //           rayon: 15.0,
      //         ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Container(
      //         child: ClipRRect(
      //           child: Image.asset(
      //             'assets/images/victoire.jpeg',
      //             fit: BoxFit.contain,
      //             width: widht * 0.092,
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: widht * 0.064,
      //       ),
      //   ],
      // ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ScreenTitleBar(title: "Mon Pannier"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return PanierWidget(
                    ico: Icons.restore,
                    productNumber: 3,
                    imageUrl: "assets/images/vic0.jpeg",
                    productCurrentPrice: 20000,
                    productDescription: "productDescriptionsssssssssssssss",
                    productTitle: "Title",
                  );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
