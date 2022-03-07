import 'package:flutter/material.dart';
import 'package:zakazpro/screens/choose_city/components/custom_choose_city.dart';

class ChooseCity extends StatelessWidget {
  const ChooseCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.pushNamed(context, '/registration_first_screen');
                    },
                    child: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Выбор города",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Поиск", prefixIcon: Icon(Icons.search)),
              ),
              CustomChooseCity(text: "Москва"),
              CustomChooseCity(text: "Питер"),
              CustomChooseCity(text: "Астрахань")
            ],
          ),
        ),
      ),
    );
  }
}
