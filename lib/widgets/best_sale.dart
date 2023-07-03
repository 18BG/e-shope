import 'package:e_shope/screens/login_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BestSale extends StatefulWidget {
  int nbBestSale;
  BestSale({required this.nbBestSale, super.key});

  @override
  State<BestSale> createState() => _BestSaleState();
}

class _BestSaleState extends State<BestSale> {
  //List<bool> isLiked = List<bool>.filled(firebaseItems.length, false);
  List<bool>? isLike;
  bool haveAncount = false;

  @override
  void initState() {
    super.initState();
    isLike = List<bool>.filled(widget.nbBestSale, false);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: width * 0.03),
            height: height * 0.075,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Row(
              children: [
                Text(
                  "Best Sale",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                Spacer(),
                InkWell(
                  child: Row(
                    children: [Text("View All"), Icon(Icons.arrow_forward)],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
            height: height * 0.2,
            //color: Colors.red,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.nbBestSale,
              itemBuilder: (context, i) {
                return Container(
                  width: width * 0.25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      Container(
                        width: width * 0.25,
                        height: height * 0.15,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(12),
                                topEnd: Radius.circular(12))),
                        child: ClipRRect(
                          borderRadius: const BorderRadiusDirectional.only(
                              topEnd: Radius.circular(10),
                              topStart: Radius.circular(10)),
                          child: Image.asset(
                            "assets/images/vic$i.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        width: width * 0.25,
                        height: height * 0.04,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                bottomEnd: Radius.circular(12),
                                bottomStart: Radius.circular(12))),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: width * 0.02),
                              width: width * 0.15,
                              height: height * 0.04,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "460FCFA",
                                  textScaleFactor: 0.7,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.08,
                              height: height * 0.04,
                              child: InkWell(
                                onTap: () {
                                  haveAncount
                                      ? setState(() {
                                          isLike![i] = !isLike![i];
                                        })
                                      : Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                          return const LoginScreen();
                                        }));
                                },
                                child: Center(
                                  child: isLike![i]
                                      ? Icon(
                                          Icons.favorite,
                                          size: height * 0.04,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          size: height * 0.04,
                                          color: Colors.black,
                                        ),
                                ),
                              ),
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
            ),
          )
        ],
      ),
    );
  }
}
