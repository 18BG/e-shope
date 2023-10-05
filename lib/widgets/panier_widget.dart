import 'package:e_shope/models/panier_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/achat_produit.dart';
import '../models/produit_model.dart';
import '../provider/provider.dart';

class PanierWidget extends StatefulWidget {
  PanierWidget(
      {Key? key,
      required this.ico,
      required this.productNumber,
      required this.pan,
      required this.pannier})
      : super(key: key);

  int productNumber;
  AchatProduitModel pannier;
  PanierModel pan;
  final IconData ico;

  @override
  State<PanierWidget> createState() => _PanierWidgetState();
}

class _PanierWidgetState extends State<PanierWidget> {
  num prixTotal = 0;

  @override
  void initState() {
    super.initState();
    prixTotal = widget.productNumber * widget.pannier.prix;
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<UserProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.pannier.nom),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pannier.nom,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(height: 4),
                    Text(
                      widget.pannier.description,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 13,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const SizedBox(height: 4),
                    Text(
                      "CFA ${prixTotal.toStringAsFixed(2)}", // Format price with 2 decimal places
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 16,
                      ),
                    ),
                    // Add product rating or review widget here
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      provide.diseToPannierProduct(
                          widget.pan, widget.pannier.firebaseToken);
                    },
                    child: const Expanded(
                      child: Tooltip(
                        message: "Remove from Cart",
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.productNumber--;
                            prixTotal =
                                widget.productNumber * widget.pannier.prix;
                            widget.pannier.qteCommande = widget.productNumber;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: MediaQuery.of(context).textScaleFactor * 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${widget.productNumber}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.productNumber++;
                            prixTotal =
                                widget.productNumber * widget.pannier.prix;
                            widget.pannier.qteCommande = widget.productNumber;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2),
                          ),
                          child: Icon(
                            Icons.add,
                            size: MediaQuery.of(context).textScaleFactor * 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
