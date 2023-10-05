import 'package:e_shope/models/commande_model.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
    required this.result,
    required this.commande,
    required this.ico,
  }) : super(key: key);
  final CommandeModel commande;
  final IconData ico;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  commande.produit.first.produit.first.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commande.firebaseToken!,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${commande.produit.length}",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "View Details",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.225,
              child: Row(
                children: [
                  Icon(
                    ico,
                    color: commande.etatCommande == "Livré"
                        ? Colors.green
                        : commande.etatCommande == "En attente"
                            ? Colors.orange
                            : Colors.red,
                    size: MediaQuery.of(context).devicePixelRatio * 8,
                  ),
                  SizedBox(width: MediaQuery.of(context).textScaleFactor * 4),
                  Text(
                    result,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
