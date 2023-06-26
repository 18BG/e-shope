import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final int index;
  const ProductItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Action when the product is tapped
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/vic10.jpeg",
                //width: width * 0.37,
                //height: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              const SizedBox(
                height: 70,
                child: Column(
                  children: [
                    Text(
                      "Pull",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Price: \$10',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Popularity: recommende',
                      style: TextStyle(fontSize: 14),
                    ),
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
