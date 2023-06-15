import 'package:e_shope/utilities/constants.dart';
import 'package:e_shope/widgets/card.dart';
import 'package:e_shope/widgets/catgorie.dart';
import 'package:e_shope/widgets/screen_title_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //margin: EdgeInsets.all(width * 0.03),
              width: width * 0.99,
              height: height / 1.7,
              color: Color.fromARGB(255, 241, 238, 238),
              child: const Column(
                children: [
                  HomeCard(),
                  HomeCategorie(),
                ],
              ),
            ),
            Container(
              height: height * 0.24,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width * 0.03),
                    height: height * 0.07,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Row(
                      children: [
                        Text(
                          "Best Sale",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Spacer(),
                        InkWell(
                          child: Row(
                            children: [
                              Text("View All"),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.03, right: width * 0.03),
                    height: height * 0.14,
                    //color: Colors.red,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Container(
                            width: width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                Container(
                                  width: width * 0.25,
                                  height: height * 0.1,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                              topStart: Radius.circular(12),
                                              topEnd: Radius.circular(12))),
                                  child: ClipRRect(
                                    borderRadius:
                                        const BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(10),
                                            topStart: Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/vic$i.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.25,
                                  height: height * 0.04,
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                              bottomEnd: Radius.circular(12),
                                              bottomStart:
                                                  Radius.circular(12))),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.125,
                                        height: height * 0.04,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: width * 0.125,
                                        height: height * 0.04,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) => SizedBox(
                              width: width * 0.05,
                            )),
                        itemCount: 7),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Nouveaute { lafayette, jefferson, Babry, Aymane, Ayman }
