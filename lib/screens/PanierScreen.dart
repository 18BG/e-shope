import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/widgets/dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/all_products.dart';
import '../widgets/panier_widget.dart';
import '../widgets/screen_title_bar.dart';
import 'AchatScreen.dart';

class PanierListScreen extends StatefulWidget {
  const PanierListScreen({Key? key}) : super(key: key);

  @override
  State<PanierListScreen> createState() => _PanierListScreenState();
}

class _PanierListScreenState extends State<PanierListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, child, _) => Container(
          color: Colors.white,
          child: Column(
            children: [
              ScreenTitleBar(title: "Mon Pannier"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: child.panierList.isNotEmpty
                              ? child.panierList.firstOrNull!.produit.length
                              : 0,
                          itemBuilder: (context, index) {
                            return PanierWidget(
                              ico: Icons.restore,
                              pan: child.panierList.first,
                              productNumber: 1,
                              pannier: child.panierList.first.produit[index],
                            );
                          },
                        ),
                      ),
                      child.panierList.isEmpty
                          ? Center(
                              heightFactor:
                                  MediaQuery.of(context).size.height * 0.004,
                              child: Text(
                                "Panier vide pour le moment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            18),
                              ),
                            )
                          : Container(
                              child: Row(
                                children: [
                                  Spacer(),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Dialogue(
                                              message:
                                                  "Panier vider avec succes");
                                          child.deletePannier(
                                              child.panierList.first);
                                        });
                                      },
                                      child: Text("videz le pannier")),
                                  Spacer(),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AchatScreen(
                                                        produit: child
                                                            .panierList
                                                            .first)));
                                      },
                                      child: Text("Valider la commande")),
                                  Spacer()
                                ],
                              ),
                            ),
                      AllProducts(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
