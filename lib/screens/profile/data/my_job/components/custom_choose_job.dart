import 'package:flutter/material.dart';

class CustomChoosejob extends StatelessWidget {
  final String text;
  const CustomChoosejob({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (context) {}),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
