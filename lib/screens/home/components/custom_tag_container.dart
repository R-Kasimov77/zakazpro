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
      padding: const EdgeInsets.only(right: 8, bottom: 10, top: 8),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundcolor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
