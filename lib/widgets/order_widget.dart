import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
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
                child: Image.asset(
                  imageUrl,
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
                      productTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Qty: 3",
                      style: TextStyle(
                        fontSize: 12,
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
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Row(
                children: [
                  Icon(
                    ico,
                    color: Colors.green,
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Text(
                    resultText,
                    style: TextStyle(fontSize: 12),
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
