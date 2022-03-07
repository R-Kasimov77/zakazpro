import 'package:flutter/material.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  const CustomContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 70,
        width: 270,
        color: AppColors.blue,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
