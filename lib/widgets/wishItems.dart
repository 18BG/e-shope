import 'package:e_shope/models/like_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class WishItems extends StatefulWidget {
  const WishItems({
    Key? key,
    required this.produit,
  }) : super(key: key);

  final LikeModel produit;
  final int _baseFontSize = 12;

  @override
  _WishItemsState createState() => _WishItemsState();
}

class _WishItemsState extends State<WishItems> {
  bool isLiked = false;
  @override
  void initState() {
    // TODO: implement initState
    isLiked = widget.produit.like;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<UserProvider>(context, listen: false);
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white12,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Image.network(
                      widget.produit.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.produit.nom,
                    style: TextStyle(
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      fontWeight: FontWeight.bold,
                      // Add other properties as needed
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.produit.description,
                    style: TextStyle(
                      fontSize: widget._baseFontSize *
                          MediaQuery.of(context).textScaleFactor,
                      // Add other properties as needed
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "CFA ${widget.produit.prix}${widget.produit.prix > 0 ? " ${widget.produit.prix}" : ""}",
                    style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * MediaQuery.of(context).textScaleFactor,
                      // Add other properties as needed
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    widget.produit.like = isLiked;
                    if (isLiked == false) {
                      provide.listProduit.forEach((element) {
                        if (element.nom == widget.produit.nom &&
                            widget.produit.description == element.description) {
                          element.like = false;
                        }
                      });
                      provide.diseLikeProduct(widget.produit);
                    }
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
