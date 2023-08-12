import 'package:e_shope/models/produit_model.dart';
import 'package:flutter/material.dart';

import '../models/achat_produit.dart';

// ignore: must_be_immutable
class OrderProductDetailWidget extends StatelessWidget {
  OrderProductDetailWidget({Key? key, required this.produit}) : super(key: key);

  AchatProduitModel produit;

  final double _baseFontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  produit.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produit.nom,
                      style: TextStyle(
                        fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      produit.description,
                      style: TextStyle(
                        fontSize: _baseFontSize *
                            MediaQuery.of(context).textScaleFactor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "CFA ${produit.prix}${produit.prix > 0 ? " ${produit.prix}" : ""}",
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * MediaQuery.of(context).textScaleFactor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.04,
                        0,
                        MediaQuery.of(context).size.width * 0.04,
                        0),
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Text(produit.qteCommande.toString()),
                  ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
