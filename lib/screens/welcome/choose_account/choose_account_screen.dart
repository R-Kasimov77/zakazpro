import 'package:flutter/material.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/custom_button.dart';

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
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/registration_first_screen');
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/presentation');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CustomButton(
                            text: 'Заказчик',
                            onPressed: () {
                              Navigator.pushNamed(context, '/presentation');
                            },
                            backgroundColor: AppColors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
