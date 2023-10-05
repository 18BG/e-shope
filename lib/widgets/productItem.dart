import 'package:e_shope/models/categorie_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/widgets/logindialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class ProductItemWidget extends StatefulWidget {
  ProduitModel produit;
  ProductItemWidget({super.key, required this.produit});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isLiked = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.produit.like;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provide = Provider.of<UserProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
              child: Stack(children: [
                widget.produit.image == ""
                    ? CircularProgressIndicator()
                    : Image.network(
                        widget.produit.imageUrl,
                        width: width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.09,
                        fit: BoxFit.cover,
                      ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (provide.firstName != null) {
                        setState(() {
                          isLiked = !isLiked;
                          if (isLiked == true) {
                            widget.produit.like = isLiked;
                            bool isOk = provide.likeList.any((element) =>
                                element.nom == widget.produit.nom &&
                                widget.produit.description ==
                                    element.description &&
                                element.prix == widget.produit.prix);
                            if (!isOk) {
                              provide.likeProduct(widget.produit);
                            }
                          } else {
                            if (provide.likeList.isNotEmpty) {
                              provide.diseLikeProduct(
                                  provide.likeList.firstWhere((element) {
                                return element.nom == widget.produit.nom &&
                                    widget.produit.description ==
                                        element.description &&
                                    element.prix == widget.produit.prix;
                              }));
                            }
                          }
                        });
                      } else {
                        showAdaptiveDialog(
                            context: context,
                            builder: (context) => LoginDialog(
                                message:
                                    "Vous ne pouvez pas aimer de produits veuillez vous connecter s'il vous plais"));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: MediaQuery.of(context).textScaleFactor * 22,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.03,
                  0,
                  MediaQuery.of(context).size.width * 0.03,
                  MediaQuery.of(context).size.width * 0.03),
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    widget.produit.nom,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "${widget.produit.prix}",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 14),
                      ),
                      Spacer(),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: MediaQuery.of(context).textScaleFactor * 15,
                      ),
                      Text(
                        '4.4',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
