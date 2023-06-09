import 'package:flutter/material.dart';

import 'back_arrow.dart';

class ScreenTitleBar extends StatelessWidget {
  ScreenTitleBar({super.key, required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(color: Colors.black12),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(child: backArrow, onTap: (){
            Navigator.pop(context);
          },),
          Spacer(),
          Text(title),
          Spacer()
        ],
      ),
    );
  }
}
