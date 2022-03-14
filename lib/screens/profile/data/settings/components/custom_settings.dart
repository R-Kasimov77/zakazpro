import 'package:flutter/material.dart';

class CustomSettings extends StatelessWidget {
  final String text;
  CustomSettings({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            width: 20,
          ),
          Switch(
            value: true,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
