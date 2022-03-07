import 'package:flutter/material.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomContainerBotton extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroungColor;
  const CustomContainerBotton(
      {Key? key,
      required this.text,
      required this.color,
      required this.backgroungColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        color: backgroungColor,
        width: 130,
        height: 40,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: color, fontSize: 16),
        )),
      ),
    );
  }
}
