import 'package:flutter/material.dart';

class CustomPublicText extends StatelessWidget {
  const CustomPublicText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 28, ),
        child: Text(
            "Оферта (француз. offrir - предлагать цену) - \nэто предложение заключить сделку. По сути это \nделовое письмо или коммерческое \nпредложение, в котором прописан товар, цена, \nусловия доставки и условия оплаты и адресат."),
      ),
    );
  }
}
