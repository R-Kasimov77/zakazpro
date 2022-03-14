import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/data/settings/components/custom_settings.dart';
import 'package:zakazpro/utils/app_colors.dart';

class SettingsMessage extends StatelessWidget {
  const SettingsMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(),
                  Row(
                    children: [
                      Text("Мой профиль/",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Text(
                        "Настройки",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Уведомления",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text("О новых заказах"),
              CustomSettings(
                text: "Пуш",
              ),
              CustomSettings(
                text: "Звук",
              ),
              CustomSettings(
                text: "СМС",
              ),
              Divider(
                color: AppColors.black,
              ),
              SizedBox(
                height: 12,
              ),
              Text("О сообщениях"),
              CustomSettings(
                text: "Пуш",
              ),
              Divider(
                color: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
