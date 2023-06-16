import 'package:flutter/material.dart';

import '../screens/product_view_screnn.dart';

class WishItems extends StatefulWidget {
  WishItems({
    Key? key,
    required this.imageUrl,
    required this.productCurrentPrice,
    required this.productDescription,
    required this.productTitle,
    this.productlastPrice,
  }) : super(key: key);

  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final double productCurrentPrice;
  final double? productlastPrice;
  final double _baseFontSize = 16.0;

  @override
  _WishItemsState createState() => _WishItemsState();
}

class _WishItemsState extends State<WishItems> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white12,
        height: MediaQuery.of(context).size.height * 0.32,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductViewScreen()));
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Image.asset(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.productTitle,
                    style: TextStyle(
                      fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                      fontWeight: FontWeight.bold,
                      // Add other properties as needed
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.productDescription,
                    style: TextStyle(
                      fontSize:
                          widget._baseFontSize * MediaQuery.of(context).textScaleFactor,
                      // Add other properties as needed
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "CFA ${widget.productCurrentPrice}" +
                        (widget.productlastPrice != null && widget.productlastPrice! > 0
                            ? " ${widget.productlastPrice!}"
                            : ""),
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
          ],
        ),
      ),
    );
  }
}
