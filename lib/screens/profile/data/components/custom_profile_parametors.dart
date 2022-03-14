import 'package:flutter/material.dart';

class CustomProfileParametors extends StatelessWidget {
  final String text;
  final String navigator;
  const CustomProfileParametors(
      {Key? key, required this.text, required this.navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, navigator);
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
