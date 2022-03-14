import 'package:flutter/material.dart';
import 'package:zakazpro/screens/chat/components/custom_all_dialogues_container.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class AllDialoguesScreen extends StatelessWidget {
  const AllDialoguesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Диалоги",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ScaleAnimationContainer(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat_screen');
                  },
                  child: CustomAllDialoguesContainer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
