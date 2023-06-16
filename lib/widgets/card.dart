import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  Nouveaute? _selectedCharacter;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(width * 0.03),
      width: width * 0.93,
      height: height / 2.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        child: Row(
          children: [
            Container(
              width: width * 0.45,
              height: height / 3,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: width * 0.45,
                    height: height / 6.19,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "news",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Chaussures de sports",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.45,
                    height: height / 6.19,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: Nouveaute.values
                            .map((character) => Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Radio<Nouveaute>(
                                    value: character,
                                    groupValue: _selectedCharacter,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCharacter = value;
                                      });
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 0.45,
              height: height / 3,
              child: Image.asset(
                'assets/images/vic6.jpeg',
                height: height / 2.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Nouveaute { Babry, Aymane, Ayman }
