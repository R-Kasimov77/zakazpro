import 'package:flutter/material.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/custom_button.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      children: [
                        BackButton(),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Заказ № 2543534",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 4, top: 4),
                        child: Text(
                          "Сегодня в 18:19",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 4, top: 4),
                        child: Text(
                          "Москва",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "(11 ответов)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Описание задачи",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In convallis eleifend ex. Nulla et \nmetus ac ante porttitor sollicitudin. Curabitur \nrhoncus tortor vel orci lacinia, vel venenatis erat \nfringilla. Morbi mattis, leo sed molestie mattis, \nodio est fermentum mi, et vestibulum quam elit et sem.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Адрес",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Москва, Тверской пролет, дом 9",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Оплата",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Wrap(
                      children: [
                        CustomTagContainer(
                          text: "Безнал",
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                        CustomTagContainer(
                            text: "Договор",
                            backgroundcolor: Colors.grey.shade300,
                            textcolor: AppColors.black,),
                        CustomTagContainer(
                            text: "Наличка",
                            backgroundcolor: Colors.grey.shade300,
                            textcolor: AppColors.black,),
                      ],
                    ),
                    Text(
                      "Кто нужен",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Wrap(
                      children: [
                        CustomTagContainer(
                          text: "Сварщик",
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                        CustomTagContainer(
                          text: "Плиточник",
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                        CustomTagContainer(
                          text: "Прораб",
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                        CustomTagContainer(
                          text: "Инженер",
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        )
                      ],
                    ),
                    Center(
                      child: CustomButton(
                        text: "Предложить кандидатуру",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Предложить свою кандидатуру',
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "Текст вашего предложения",
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomButton(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            text: 'Отменить',
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            backgroundColor: Colors.grey,
                                          ),
                                          CustomButton(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.5,
                                            text: 'Предложить',
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            backgroundColor: AppColors.blue,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        backgroundColor: Colors.blue,
                        width: 260,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
