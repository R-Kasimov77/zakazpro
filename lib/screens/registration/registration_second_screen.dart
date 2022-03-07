import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationSecondScreen extends StatelessWidget {
  const RegistrationSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.photo_size_select_actual_outlined,
                  size: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child:
                    Text("Подтверждение входа", style: TextStyle(fontSize: 16)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.phone), Text("+79320987654")],
              ),
              Text(
                "На этот номер телефона был \nотправлен SMS с кодом, введите его",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey.shade500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 56,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "XXXX",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("получить код повторно \nможно через 60 сек")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Divider(
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 160,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/premision_screen');
                  },
                  child: Text(
                    "далее",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Нажимая на кнопку Далее, вы \nподтверждаете, что ознакомлены\n и согласны с условиями ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                  context,
                                  '/public_offer',
                                ),
                          text: 'Публичной оферты',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
