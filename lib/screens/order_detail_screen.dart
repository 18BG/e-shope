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
        title: Text("Order Tracker"),
      ),
      body: Container(
        child: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(widget.commande.dateCommande.toString()),
                          Spacer(),
                          Row(children: [
                            Text("Order ID :"),
                            Text(widget.commande.firebaseToken.toString()),
                            Spacer(),
                            Text("Amount :"),
                            Text(
                              widget.commande.prix.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Spacer()
                        ]),
                  ),
                ),
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
      ),
    );
  }
}
