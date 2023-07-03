import 'package:flutter/material.dart';

class ProductItemWidget extends StatefulWidget {
  final int index;
  ProductItemWidget({super.key, required this.index});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isLiked = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Action when the product is tapped
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
                child: Stack(children: [
                  Image.asset(
                    "assets/images/vic10.jpeg",
                    //width: width * 0.37,
                    //height: 160,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
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
                      "Pull",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Mordern victory mark",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 12,
                          fontWeight: FontWeight.w100),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '\$10',
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
      ),
    );
  }
}
