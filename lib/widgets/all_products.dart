import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_shope/widgets/productItem.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: width * 0.03),
          height: height * 0.075,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Row(
            children: [
              Text(
                "Tous les produits",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Spacer(),
            ],
          ),
        ),
        // Container(
        //   color: const Color.fromARGB(255, 241, 238, 238),
        //   margin: EdgeInsets.only(left: width * 0.025, right: width * 0.025),
        //   height: 170 * 7,
        //   child: GridView.builder(
        //     physics: const BouncingScrollPhysics(
        //         parent: NeverScrollableScrollPhysics()),
        //     itemCount: 7,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       crossAxisSpacing: width * 0.05,
        //       mainAxisSpacing: width * 0.05,
        //       childAspectRatio: height * 0.0009,
        //     ),
        //     itemBuilder: (context, index) {
        //       //final product = products[index];
        //       return Center(child: ProductItemWidget(index: index));
        //     },
        //   ),
        // ),
        Container(
          child: DynamicHeightGridView(
            physics: const BouncingScrollPhysics(
                parent: NeverScrollableScrollPhysics()),
            shrinkWrap: true,
            itemCount: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            builder: (ctx, index) {
              /// return your widget here.
              return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: ProductItemWidget(index: 7));
            },
          ),
        )
      ],
    );
  }
}
// Center(
//                   child: Container(
//                 color: Colors.red,
//               ));
