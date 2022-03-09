import 'package:flutter/material.dart';
import 'package:zakazpro/screens/home/components/custom_order_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Заказы 8456",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ScaleAnimationContainer(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  child: CustomOrderContainer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
