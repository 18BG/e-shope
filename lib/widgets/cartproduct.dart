import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  CartWidget({
    Key? key,
    required this.productCurrentPrice,
    required this.imageUrl,
    required this.productDescription,
    required this.productTitle,
    required this.ico,
    required this.productNumber,
    this.productlastPrice,
  }) : super(key: key);

  int productNumber;
  final String imageUrl;
  final String productTitle;
  final String productDescription;
  final double productCurrentPrice;
  final double? productlastPrice;
  final IconData ico;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        widget.productDescription,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 18,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      const SizedBox(height: 4),
                      Text(
                        "CFA ${widget.productCurrentPrice}" +
                            (widget.productlastPrice != null &&
                                    widget.productlastPrice! > 0
                                ? " ${widget.productlastPrice!}"
                                : ""),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).devicePixelRatio *
                                          10)),
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                children: [
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.productNumber--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: MediaQuery.of(context)
                                              .textScaleFactor *
                                          16,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${widget.productNumber}",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.productNumber++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: MediaQuery.of(context)
                                              .textScaleFactor *
                                          16,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
