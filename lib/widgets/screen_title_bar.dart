import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'back_arrow.dart';

class ScreenTitleBar extends StatefulWidget {
  ScreenTitleBar({super.key, required this.title, this.isTrue});
  final title;
  bool? isTrue;

  @override
  State<ScreenTitleBar> createState() => _ScreenTitleBarState();
}

class _ScreenTitleBarState extends State<ScreenTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: const BoxDecoration(color: Colors.black12),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            child: backArrow,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          Text(widget.title),
          Spacer(),
        ],
      ),
    );
  }
}
