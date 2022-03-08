import 'package:flutter/material.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomTagContainer extends StatelessWidget {
  final String text;
  final Color backgroundcolor;
  final Color textcolor;
  const CustomTagContainer(
      {Key? key,
      required this.text,
      required this.backgroundcolor,
      required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundcolor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 22, left: 22, bottom: 4, top: 4),
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
