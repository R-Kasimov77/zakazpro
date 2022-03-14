import 'package:flutter/material.dart';

class CustomPersonData extends StatelessWidget {
  final String text;
  const CustomPersonData({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 24,
          ),
          Icon(Icons.border_color_outlined)
        ],
      ),
    );
  }
}
