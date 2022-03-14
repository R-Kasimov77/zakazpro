import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:zakazpro/screens/my_orders/create_order/components/custom_chek_box_container.dart';
import 'package:zakazpro/screens/my_orders/create_order/components/custom_text_field.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

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
                            'создание заказа',
                            'продажа обьекта',
                            'прокат инструмента'
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ScaleAnimationContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, '/detail');
                        },
                        child: CustomTextField(
                          hintText: "название города",
                          text: "В каком городе нужно выполнить работу?",
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text("Вид работы"),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCheckBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
