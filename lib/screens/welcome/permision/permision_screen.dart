import 'package:flutter/material.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/custom_button.dart';

class PermisionScreen extends StatelessWidget {
  const PermisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(),
                  Text('Обработка персональных данных'),
                ],
              ),
              SizedBox(height: 16),
              Text('Информация'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    width: MediaQuery.of(context).size.width / 2.5,
                    text: 'Согласен',
                    onPressed: () {
                      Navigator.pushNamed(context, '/menu');
                    },
                    backgroundColor: AppColors.blue,
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width / 2.5,
                    text: 'не согласен',
                    onPressed: () {},
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
