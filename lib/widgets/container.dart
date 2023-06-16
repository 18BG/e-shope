import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          "Vous devrez avoir un compte pour avoir des produits favoris",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
