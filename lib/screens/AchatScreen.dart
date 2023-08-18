import 'package:e_shope/models/commande_model.dart';
import 'package:e_shope/models/panier_model.dart';
import 'package:e_shope/utilities/constants.dart';
import 'package:e_shope/widgets/dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/produit_model.dart';
import '../provider/provider.dart';
import '../widgets/cartproduct.dart';
import '../widgets/input.dart';
import '../widgets/screen_title_bar.dart';

class AchatScreen extends StatefulWidget {
  AchatScreen({Key? key, required this.produit}) : super(key: key);
  PanierModel produit;

  @override
  _AchatScreenState createState() => _AchatScreenState();
}

class _AchatScreenState extends State<AchatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool payAfterDelivery = false;
  CommandeModel? commande;
  num Total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.produit.produit.forEach((element) {
      Total += element.prix;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    widget.produit.produit.forEach((element) {
      Total += element.prix;
    });
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
                        itemCount: widget.produit.produit.length,
                        itemBuilder: (context, index) {
                          return CartWidget(
                            ico: Icons.restore,
                            productNumber:
                                widget.produit.produit[index].qteCommande,
                            imageUrl: widget.produit.produit[index].image,
                            productCurrentPrice:
                                widget.produit.produit[index].prix,
                            productDescription:
                                widget.produit.produit[index].description,
                            productTitle: widget.produit.produit[index].nom,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total :",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "$Total CFA",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
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
                              onPressed: () async {
                                if (payAfterDelivery) {
                                  commande = CommandeModel(
                                      prix: Total,
                                      produit: [widget.produit],
                                      dateCommande: DateTime.now(),
                                      etatCommande: "En attente",
                                      adresseLivraison: _controller.text,
                                      qteCommande:
                                          widget.produit.produit.length);

                                  var isOk =
                                      await provider.addCommande(commande!);
                                  if (isOk == true) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialogue(
                                            message:
                                                "Commande effectuer avec success"));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialogue(
                                            message:
                                                "Erruer lors de l'envoi de la commande"));
                                  }
                                } else {
                                  commande = CommandeModel(
                                      prix: Total,
                                      produit: [widget.produit],
                                      dateCommande: DateTime.now(),
                                      etatCommande: "Livré",
                                      adresseLivraison: _controller.text,
                                      qteCommande:
                                          widget.produit.produit.length);
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialogue(
                                          message:
                                              "Commande effectuer avec success"));
                                }
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
