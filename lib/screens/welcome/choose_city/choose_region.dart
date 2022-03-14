import 'package:flutter/material.dart';
import 'package:zakazpro/screens/welcome/choose_city/components/custom_choose_region.dart';

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
                        Navigator.pop(context);
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
              SizedBox(height: 24),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/choose_city');
                      },
                      child: CustomChooseRegion(text: "московская область"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
