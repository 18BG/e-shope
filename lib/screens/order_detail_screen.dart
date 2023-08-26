import 'package:e_shope/models/commande_model.dart';
import 'package:flutter/material.dart';

import '../widgets/order_detail_product.dart';

class OrderDetailScreen extends StatefulWidget {
  OrderDetailScreen({required this.commande, super.key});
  CommandeModel commande;
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Center(
          child: Text(
            "Order Tracker",
            style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10)),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).textScaleFactor * 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              widget.commande.dateCommande.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            ),
                            const Spacer(),
                            Text(
                              "Etat : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16),
                            ),
                            Text(
                              widget.commande.etatCommande,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16,
                                  color: widget.commande.etatCommande == "Livré"
                                      ? Colors.green
                                      : widget.commande.etatCommande ==
                                              "En attente"
                                          ? Colors.orange
                                          : Colors.red),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(children: [
                          Text(
                            "Order ID :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        14),
                          ),
                          Text(widget.commande.firebaseToken.toString(),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          14)),
                          const Spacer(),
                          Text("Amount :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          14)),
                          Text(
                            widget.commande.prix.toString(),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 14,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                        const Spacer()
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Text("Produits",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 20,
                      fontWeight: FontWeight.bold)),
            ),
            Card(
              elevation: 3,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.commande.produit.first.produit.length,
                  itemBuilder: (context, i) {
                    return OrderProductDetailWidget(
                      produit: widget.commande.produit.first.produit[i],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
