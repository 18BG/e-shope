import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(width * 0.03),
                height: height * 0.03,
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
            margin: EdgeInsets.only(left: 10, right: 10),
            height: height * 0.12,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Container(
                        width: height * 0.09,
                        decoration: BoxDecoration(
                            color:
                                (index % 2 == 0) ? Colors.teal : Colors.green,
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/vic${index}.jpeg",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Container(
                          child: Text(
                        map[index].entries.first.key,
                      ))
                    ],
                  );
                },
                separatorBuilder: ((context, index) => SizedBox(
                      width: width * 0.05,
                    )),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
