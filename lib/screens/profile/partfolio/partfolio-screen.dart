import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/partfolio/components/custom_partfolio.dart';
import 'package:zakazpro/utils/app_colors.dart';

class PartfolioScreen extends StatelessWidget {
  const PartfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(6)),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                     "Мой профиль",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            CustomParfolio(),
            CustomParfolio(),
            CustomParfolio(),
          ],
        ),
      ),
    );
  }
}
