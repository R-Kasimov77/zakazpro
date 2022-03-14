import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/data/my_job/components/custom_choose_job.dart';
import 'package:zakazpro/utils/app_colors.dart';

class MyJobScreen extends StatelessWidget {
  const MyJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(),
                      Text(
                        "Выбрать сообщество",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            CustomChoosejob(text: "Сварщик"),
            CustomChoosejob(text: "Плиточник"),
            CustomChoosejob(text: "Прораб"),
            CustomChoosejob(text: "Инженер"),
          ],
        ),
      ),
    );
  }
}
