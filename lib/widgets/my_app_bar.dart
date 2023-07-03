import 'package:flutter/material.dart';

import 'input.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          SizedBox(
            width: widht * 0.55,
            child: const Input(
              hintText: 'Recherche',
              prefixIcon: true,
              iconType: Icons.search,
              rayon: 15.0,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          child: ClipRRect(
            child: Image.asset(
              'assets/images/victoire.jpeg',
              fit: BoxFit.contain,
              width: widht * 0.092,
            ),
          ),
        ),
        SizedBox(
          width: widht * 0.064,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
