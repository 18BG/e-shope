import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({
    Key? key,
    required this.productCurrentPrice,
    required this.imageUrl,
    required this.productDescription,
    required this.productTitle,
    required this.ico,
    required this.resultText,
    this.productlastPrice,
  }) : super(key: key);

  final String resultText;
  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final double productCurrentPrice;
  final double? productlastPrice;
  final IconData ico;
  final double _baseFontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
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
                      productTitle,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      productDescription,
                      style: TextStyle(
                        fontSize: _baseFontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "CFA $productCurrentPrice" +
                          (productlastPrice != null && productlastPrice! > 0
                              ? " ${productlastPrice!}"
                              : ""),
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
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
                  Icon(ico, color: Colors.green),
                  SizedBox(width: 4),
                  Text(resultText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
