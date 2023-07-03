import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeProductViewer extends StatelessWidget {
  HomeProductViewer({super.key, required this.list});
  List<Image> list;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: list.length,
        child: Builder(builder: (context) {
          return Column(
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100))),
                      child: TabBarView(children: list))),
              const TabPageSelector(),
            ],
          );
        }));
  }
}
