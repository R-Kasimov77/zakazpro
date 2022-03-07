import 'package:flutter/material.dart';
import 'package:zakazpro/screens/choose_city/components/custom_choose_region.dart';
import 'package:zakazpro/utils/app_colors.dart';

class ChooseRegion extends StatelessWidget {
  const ChooseRegion({Key? key}) : super(key: key);

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
                        Navigator.pushNamed(context, '/choose_city');
                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Выбор региона",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Поиск", prefixIcon: Icon(Icons.search)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
