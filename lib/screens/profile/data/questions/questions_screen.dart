import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/data/questions/components/custom_questions_parametors.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                        width: 120,
                      ),
                      Text(
                        "FAQ",
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ScaleAnimationContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, '/instruction_screen');
                        },
                        child: CustomQuestionsParametors(
                          text: "Как начать работу в приложении?",
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// CustomQuestionsParametors(
//                       text: "Как начать работу в приложении?", navigator: ""),
