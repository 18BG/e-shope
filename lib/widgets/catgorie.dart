import 'package:e_shope/models/categorie_model.dart';
import 'package:e_shope/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/constants.dart';

class HomeCategorie extends StatefulWidget {
  const HomeCategorie({super.key});

  @override
  State<HomeCategorie> createState() => _HomeCategorieState();
}

class _HomeCategorieState extends State<HomeCategorie> {
  List<Map<String, dynamic>> map = [
    {"Képi": 0},
    {"marque": 1},
    {"complet": 2},
    {"Pull": 3},
    {"Shirt": 4},
    {"Sport": 5},
    {"Képi1": 6},
    {"pull": 7},
    {"Victoire": 8},
    {"shirt": 9}
  ];
  late UserProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        List<CategorieModel> categorie = value.categoryList;
        return SizedBox(
          height: height * 0.22,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(width * 0.03),
                    height: height * 0.05,
                    width: width * 0.25,
                    child: const Text(
                      catgorieUpper,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: height * 0.13,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          Container(
                            width: height * 0.09,
                            height: height * 0.09,
                            decoration: BoxDecoration(
                                color: (index % 2 == 0)
                                    ? Colors.teal
                                    : Colors.green,
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(categorie[index].image!),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          SizedBox(
                              height: height * 0.035,
                              child: Text(categorie[index].nom))
                        ],
                      );
                    },
                    separatorBuilder: ((context, index) => SizedBox(
                          width: width * 0.05,
                        )),
                    itemCount: categorie.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
