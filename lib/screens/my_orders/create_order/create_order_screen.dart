import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:zakazpro/logic/creat_order/cubit/creat_order_cubit.dart';
import 'package:zakazpro/model/create_order_model.dart';
import 'package:zakazpro/screens/my_orders/create_order/components/custom_chek_box_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/app_toasts.dart';
import 'package:zakazpro/widgets/custom_button.dart';
import 'package:zakazpro/widgets/custom_text_field.dart';

class CreatOrderScreen extends StatefulWidget {
  const CreatOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreatOrderScreen> createState() => _CreatOrderScreenState();
}

class _CreatOrderScreenState extends State<CreatOrderScreen> {
  final citycontroller = TextEditingController();
  final adresscontroller = TextEditingController();
  final exercisecontroller = TextEditingController();
  final creatOrderCubit = CreatOrderCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
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
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black)),
                      child: DropdownButtonHideUnderline(
                        child: DropDown(
                          isExpanded: true,
                          items: [
                            '  создание заказа',
                            '  продажа обьекта',
                            '  прокат инструмента'
                          ],
                          hint: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text("создание заказа"),
                          ),
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("В каком городе нужно выполнить работу?"),
                  SizedBox(height: 8),
                  CustomTextField(
                    hintText: "название города",
                    controller: citycontroller,
                  ),
                  SizedBox(height: 10),
                  Text("Укажите адрес"),
                  SizedBox(height: 8),
                  CustomTextField(
                    hintText: "адрес в свободном формате",
                    controller: adresscontroller,
                  ),
                  SizedBox(height: 10),
                  Text("Описание задачи"),
                  SizedBox(height: 8),
                  CustomTextField(
                    hintText: "опишите задачу",
                    controller: exercisecontroller,
                  ), // ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  //   itemCount: 3,
                  //   shrinkWrap: true,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ScaleAnimationContainer(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/detail');
                  //       },
                  //       child: CustomTextField(
                  //         hintText: "название города",
                  //       ),
                  //     );
                  //   },
                  // ),
                  SizedBox(
                    height: 18,
                  ),
                  Text("Вид работы"),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCheckBox();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 12, right: 12),
              child: BlocProvider.value(
                value: creatOrderCubit,
                child: BlocListener<CreatOrderCubit, CreatOrderState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (response) {
                        print(citycontroller.text);
                        AppToasts().showBottomToast("Заказ создан", context);
                      },
                      failed: (e) {
                        AppToasts().showBottomToast("Ошибка", context, true);
                      },
                    );
                  },
                  child: CustomButton(
                      text: "Создать заказ",
                      onPressed: () {
                        if (citycontroller.text.isEmpty ||
                            adresscontroller.text.isEmpty ||
                            exercisecontroller.text.isEmpty) {
                          AppToasts().showBottomToast(
                            "Заполните все поля",
                            context,
                            true,
                          );
                        } else {
                          creatOrderCubit.creatorder(
                            CreateOrderModel(
                                paymentTypes: ['card'],
                                city: 'City',
                                address: 'adress',
                                description: 'description'),
                          );
                        }
                      },
                      backgroundColor: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
