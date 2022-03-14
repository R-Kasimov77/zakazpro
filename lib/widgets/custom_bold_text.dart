import 'package:flutter/material.dart';

class CustomBoldText extends StatelessWidget {
  final String text;
  const CustomBoldText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
    );
  }
}
