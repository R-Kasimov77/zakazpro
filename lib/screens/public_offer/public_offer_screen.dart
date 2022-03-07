import 'package:flutter/material.dart';
import 'package:zakazpro/screens/public_offer/components/custom_public_text.dart';

class PublicOfferScreen extends StatelessWidget {
  const PublicOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  Text("Публичная оферта"),
                  SizedBox()
                ],
              )),
              CustomPublicText(),
              CustomPublicText(),
              CustomPublicText()
            ],
          ),
        ),
      ),
    );
  }
}
