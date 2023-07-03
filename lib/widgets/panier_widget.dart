import 'package:flutter/material.dart';

class PanierWidget extends StatefulWidget {
  PanierWidget({
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
  State<PanierWidget> createState() => _PanierWidgetState();
}

class _PanierWidgetState extends State<PanierWidget> {
  @override
  Widget build(BuildContext context) {
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
                    Text(
                      widget.productTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.productDescription,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "CFA ${widget.productCurrentPrice * widget.productNumber}" +
                          (widget.productlastPrice != null &&
                                  widget.productlastPrice! > 0
                              ? " ${widget.productlastPrice!}"
                              : ""),
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  const Expanded(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 22,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.productNumber--;
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
                            size: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${widget.productNumber}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.productNumber++;
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
                            size: 10,
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
