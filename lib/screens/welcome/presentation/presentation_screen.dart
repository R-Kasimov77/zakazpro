import 'package:flutter/material.dart';
import 'package:zakazpro/screens/welcome/presentation/components/custom_container.dart';
import 'package:zakazpro/utils/app_colors.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Icon(
              Icons.photo_outlined,
              size: 250,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. In convallis eleifend ex.\nNulla et metus ac ante porttitor \nsollicitudin. Curabitur rhoncus tortor vel \norci lacinia, vel venenatis erat fringilla. \nMorbi mattis, leo sed molestie mattis, odio \nest fermentum mi, et vestibulum quam elit \net sem.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainerBotton(
                  text: "Пропустить",
                  color: AppColors.white,
                  backgroungColor: AppColors.blue,
                ),
                InkWell( onTap: () {
                  Navigator.pushNamed(context, '/choose_region');
                },
                  child: CustomContainerBotton(
                    text: "Далее",
                    color: AppColors.black,
                    backgroungColor: Colors.grey.shade400,
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
