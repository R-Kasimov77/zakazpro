import 'package:flutter/material.dart';

class CustomChooseRegion extends StatelessWidget {
  final String text;
  const CustomChooseRegion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 38,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.shade400), 
      ],
    );
  }
}
