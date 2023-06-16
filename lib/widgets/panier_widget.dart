import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';



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
                child: Image.asset(
                  widget.imageUrl,
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
                      widget.productTitle,
                      style: TextStyle(
                        fontSize: 18 * MediaQuery.of(context).textScaleFactor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.productDescription,
                      style: TextStyle(
                        fontSize: _baseFontSize * MediaQuery.of(context).textScaleFactor,
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
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.productNumber--;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015, 0, MediaQuery.of(context).size.width*0.015, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2)
                      ),
                      child: Text("-"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 0, MediaQuery.of(context).size.width*0.04, 0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2)
                    ),
                    child: Text("${widget.productNumber}"),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.productNumber++;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.015, 0, MediaQuery.of(context).size.width*0.015, 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2)
                      ),
                      child: Text("+"),
                    ),
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
