import 'package:flutter/material.dart';

class ProductViewer extends StatelessWidget {
  ProductViewer({super.key,required this.list});
  List<Image> list;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: list.length, child: Builder(builder: (context){
      return Column(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(60),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
            ),
            child: TabBarView(children: list)
          )),
          TabPageSelector(),
        ],
      );
    }));
  }
}