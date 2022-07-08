import 'package:flutter/material.dart';
import 'package:zakazpro/screens/profile/reviews/components/custom_review_container.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ScaleAnimationContainer(
                  onPressed: () {},
                  child: 
                  CustomReview(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
