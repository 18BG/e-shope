// ignore_for_file: use_build_context_synchronously

import 'package:e_shope/models/Image_model.dart';
import 'package:e_shope/widgets/dialogue_widget.dart';
import 'package:e_shope/widgets/logindialogue.dart';
import 'package:e_shope/widgets/product_view_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/achat_produit.dart';
import '../models/produit_model.dart';
import '../provider/provider.dart';
import 'AchatScreen.dart';

class ProductViewScreen extends StatefulWidget {
  ProductViewScreen({super.key, required this.produit});
  ProduitModel produit;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final double baseFontSize = 16.0;
  String imageUrl = "";
  String productTitle = "";
  String productDescription = "";
  num productCurrentPrice = 0;
  double? productlastPrice;
  List<Image> image = [];
  List<Images> images = [];

  int _currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productCurrentPrice = widget.produit.prix;
    productTitle = widget.produit.nom;
    productDescription = widget.produit.description;

    widget.produit.image!.forEach((element) {
      image.add(
        Image.network(element.image),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (provider.firstName != null) {
                      final achat = AchatProduitModel(
                          imageUrl: widget.produit.imageUrl,
                          nom: widget.produit.nom,
                          description: widget.produit.description,
                          prix: widget.produit.prix,
                          image: widget.produit.image,
                          qteCommande: 1,
                          like: widget.produit.like);
                      await provider.addToPaannier(achat);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AchatScreen(
                                    produit: provider.panierList.first,
                                  )));
                    } else {
                      showAdaptiveDialog(
                          context: context,
                          builder: (conext) => LoginDialog(
                              message:
                                  "Vous ne pouvez pas acheter de produis veuillez vous connecter s'il vous plais"));
                    }
                  },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: const Center(
                      child: Text(
                        "Acheter maintenant",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Container(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              if (provider.firstName != null) {
                final achat = AchatProduitModel(
                    nom: widget.produit.nom,
                    imageUrl: widget.produit.imageUrl,
                    description: widget.produit.description,
                    prix: widget.produit.prix,
                    image: widget.produit.image,
                    qteCommande: 1,
                    like: widget.produit.like);
                provider.addToPaannier(achat);
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialogue(
                          message: "Produit ajouter au pannier avec succes");
                    });
                setState(() {});
              } else {
                showAdaptiveDialog(
                    context: context,
                    builder: (context) => LoginDialog(
                        message:
                            "Vous ne pouvez pas ajouter de produis veuillez vous connecter s'il vous plais"));
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: const Center(
                      child: Text(
                        "Ajouter au Panier",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        label: '',
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      items: kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(productTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ProductViewer(list: image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          productTitle,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "CFA $productCurrentPrice${productlastPrice != null && productlastPrice! > 0 ? " ${productlastPrice!}" : ""}",
                          style: const TextStyle(
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      Icon(Icons.favorite_border, size: 30),
                      Text("10"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    productDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
