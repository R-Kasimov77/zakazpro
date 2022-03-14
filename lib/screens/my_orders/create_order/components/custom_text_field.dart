import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String hintText;
  const CustomTextField({Key? key, required this.text, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(text),
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: TextField(
            decoration: InputDecoration(hintText: hintText),
          ),
        )
      ],
    );
  }
}
