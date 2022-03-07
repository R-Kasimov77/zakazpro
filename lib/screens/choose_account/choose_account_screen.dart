import 'package:flutter/material.dart';
import 'package:zakazpro/screens/choose_account/components/custom_container.dart';

class ChooseAccountScreen extends StatelessWidget {
  const ChooseAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.photo_size_select_actual_outlined,
                  size: 90,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Выберите тип аккаунта",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/presentation');
                    },
                    child: CustomContainer(text: "Заказчик")),
                CustomContainer(text: "Исполнитель (частник)"),
                CustomContainer(text: "Исполнитель (Фирма)"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


