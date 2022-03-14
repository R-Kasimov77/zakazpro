import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/data/questions/components/custom_instuction.dart';
import 'package:zakazpro/utils/app_colors.dart';

class InstuctionScreen extends StatelessWidget {
  const InstuctionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        "Как пользоваться ?",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
              ),
            ),
            CustomInstruction(text: "Как вообще всем пользоваться?"),
            CustomInstruction(
                text: "Почему у меня не получается создать \nаккаунт?"),
            CustomInstruction(
                text: "Для каких смартфонов подходит данное \nприложение?"),
            CustomInstruction(
                text: "Что такое тренировка в домашних условиях?"),
            CustomInstruction(
                text: "Могу ли я отправить сообщение другому \nюзеру?"),
            CustomInstruction(text: "Как посмотреть собщение?")
          ],
        ),
      ),
    );
  }
}
