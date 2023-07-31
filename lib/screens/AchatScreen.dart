import 'package:flutter/material.dart';
import '../models/produit_model.dart';
import '../widgets/cartproduct.dart';
import '../widgets/input.dart';
import '../widgets/screen_title_bar.dart';

class AchatScreen extends StatefulWidget {
  AchatScreen({Key? key, required this.produit}) : super(key: key);
  ProduitModel produit;

  @override
  _AchatScreenState createState() => _AchatScreenState();
}

class _AchatScreenState extends State<AchatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool payAfterDelivery = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          width: width * 0.6,
          child: const Input(
            hintText: 'Recherche',
            prefixIcon: true,
            iconType: Icons.search,
            rayon: 15.0,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: width * 0.04),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/victoire.jpeg',
                fit: BoxFit.contain,
                width: width * 0.092,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScreenTitleBar(title: "Valider votre commande"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return CartWidget(
                            ico: Icons.restore,
                            productNumber: 3,
                            imageUrl: widget.produit.image,
                            productCurrentPrice: widget.produit.prix,
                            productDescription: widget.produit.description,
                            productTitle: widget.produit.nom,
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total :",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "600000 FCFA",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        "Adresse de livraison",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.home),
                          hintText: "Bamako",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: Text(
                        "Choix de paiement",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).devicePixelRatio * 1.0,
                        vertical:
                            MediaQuery.of(context).devicePixelRatio * 10.0,
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Radio<bool>(
                            value: false,
                            groupValue: payAfterDelivery,
                            onChanged: (value) {
                              setState(() {
                                payAfterDelivery = value!;
                              });
                            },
                          ),
                          Text(
                            "Payer maintenant",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 14,
                            ),
                          ),
                          const Spacer(),
                          Radio<bool>(
                            value: true,
                            groupValue: payAfterDelivery,
                            onChanged: (value) {
                              setState(() {
                                payAfterDelivery = value!;
                              });
                            },
                          ),
                          Text(
                            "Payer après livraison",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 14,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green)),
                              onPressed: () {
                                // Action lorsque le bouton "Acheter" est pressé
                              },
                              child: const Text("Acheter"),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red)),
                              onPressed: () {
                                // Action lorsque le bouton "Annuler" est pressé
                              },
                              child: const Text("Annuler"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
