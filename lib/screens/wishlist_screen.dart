import 'package:e_shope/utilities/constants.dart';

import 'package:flutter/material.dart';

import '../widgets/screen_title_bar.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({super.key});

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ScreenTitleBar(
            title: wishList,
          ),
        ],
      ),
    );
  }
}
