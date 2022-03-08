import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CreatOrderScreen extends StatefulWidget {
  const CreatOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreatOrderScreen> createState() => _CreatOrderScreenState();
}

class _CreatOrderScreenState extends State<CreatOrderScreen> {
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
                  child: Text(
                    "Создать заказ",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropDown(
                isExpanded: true,
                items: ['a', 'b', 'c'],
                hint: Text("a"),
                icon: Icon(
                  Icons.expand_more,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
