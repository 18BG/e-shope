import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/models/categorie_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/screens/product_view_screnn.dart';
import 'package:e_shope/widgets/productItem.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_shope/screens/login_screen.dart';

//import 'package:e_shope/provider/provider.dart';
//import 'package:e_shope/utilities/constants.dart';
//import 'package:e_shope/widgets/change_profil.dart';
//import 'package:e_shope/widgets/text_form_field.dart';
//import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/client_model.dart';

class AllProducts extends StatefulWidget {
  AllProducts({super.key, this.value, required this.isTrue});
  String? value;
  bool isTrue;
  @override
  State<AllProducts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AllProducts> {
  List<ProduitModel> allProduct = [];
  List<ProduitModel> produits = [];
  late UserProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
    if (provider.categoryList.isEmpty) {
      //provider.getCategoryProvider();
    }
    provider.categoryList.forEach((element) {
      items.add(element.nom);
    });
    widget.value != null
        ? selectedValue = widget.value
        : selectedValue = "Tous les produits";
    var cat = provider.categoryList;
    for (final categorie in cat) {
      if (categorie.nom == selectedValue) {
        categorie.listProduit!.forEach((element) {
          produits.add(element);
        });
      }
    }
  }

  final List<String> items = ["Tous les produits"];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<UserProvider>(
      builder: (context, child, _) {
        allProduct = child.listProduit;
        print(allProduct.length);
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.03),
              height: height * 0.075,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Text(
                    "Categorie :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 19),
                  ),
                  Spacer(),
                  widget.isTrue == false
                      ? Container()
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Filtrer',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  produits.clear();
                                  selectedValue = value;
                                  var cat = child.categoryList;
                                  for (final categorie in cat) {
                                    if (categorie.nom == selectedValue) {
                                      categorie.listProduit!.forEach((element) {
                                        produits.add(element);
                                      });
                                    }
                                  }
                                });
                                allProduct = child.listProduit;
                              },
                              iconStyleData: IconStyleData(icon: Icon(null)),
                              buttonStyleData: ButtonStyleData(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: const BoxDecoration(
                                  //borderRadius: BorderRadius.circular(14),
                                  color: Colors.grey,
                                ),
                                offset: const Offset(-20, 0),
                                // scrollbarTheme: ScrollbarThemeData(
                                //   //radius: const Radius.circular(40),
                                //   thickness: MaterialStateProperty.all<double>(6),
                                //   thumbVisibility: MaterialStateProperty.all<bool>(true),
                                // ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
            Container(
              child: DynamicHeightGridView(
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                shrinkWrap: true,
                itemCount: selectedValue == "Tous les produits"
                    ? allProduct.length
                    : produits.length,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                builder: (ctx, index) {
                  /// return your widget here.
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ProductViewScreen(
                                  produit: selectedValue == "Tous les produits"
                                      ? allProduct[index]
                                      : produits[index])));
                    },
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: ProductItemWidget(
                          produit: selectedValue == "Tous les produits"
                              ? allProduct[index]
                              : produits[index],
                        )),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
