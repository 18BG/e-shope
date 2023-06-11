import 'package:e_shope/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProgressIndicator extends StatelessWidget {
  final Widget? child;
  final bool? inAsyncCall;
  final double? opacity;
  final Color? color;
  final Animation<Color>? animColor;

  const ProgressIndicator(
      {Key? key,
      @required this.child,
      @required this.inAsyncCall,
      this.opacity = 0.3,
      this.color = Colors.grey,
      this.animColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget>? widgetList = [];
    widgetList.add(child!);
    if (inAsyncCall!) {
      final modele = Stack(
        children: [
          Opacity(
            opacity: opacity!,
            child: ModalBarrier(
              dismissible: false,
              color: color,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: animColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  bePatient1,
                  style: TextStyle(color: Color(0xFF634075)),
                )
              ],
            ),
          )
        ],
      );
      widgetList.add(modele);
    }
    return Stack(
      children: widgetList,
    );
  }
}
