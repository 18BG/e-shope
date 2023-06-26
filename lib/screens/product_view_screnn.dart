import 'package:e_shope/widgets/product_view_card_widget.dart';
import 'package:flutter/material.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});
  // final String imageUrl;
  // final String productTitle;
  // final String productDescription;
  // final double productCurrentPrice;
  // final double? productlastPrice;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final double baseFontSize = 16.0;
  String imageUrl = "";
  String productTitle = "Titre";
  String productDescription = "descriptionsssssssssss";
  double productCurrentPrice = 2000;
  double? productlastPrice;
  List<Image> image = [
    Image.asset("assets/images/vic0.jpeg"),
    Image.asset("assets/images/vic1.jpeg"),
    Image.asset("assets/images/vic2.jpeg"),
    Image.asset("assets/images/vic3.jpeg")
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: const Center(
                    child: Text(
                      "Acheter maintenant",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: const Center(
                    child: Text(
                      "Ajouter au Panier",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        label: '',
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      items: kBottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ProductViewer(list: image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          productTitle,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "CFA $productCurrentPrice${productlastPrice != null && productlastPrice! > 0
                                  ? " ${productlastPrice!}"
                                  : ""}",
                          style: const TextStyle(
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      Icon(Icons.favorite_border, size: 30),
                      Text("10"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "data dsmafmndf dsafdafd",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
