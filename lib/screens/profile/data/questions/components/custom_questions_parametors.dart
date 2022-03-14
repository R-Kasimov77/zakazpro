import 'package:flutter/material.dart';

class CustomQuestionsParametors extends StatelessWidget {
  final String text;

  const CustomQuestionsParametors({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
