import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationFirstScreen extends StatelessWidget {
  const RegistrationFirstScreen({Key? key}) : super(key: key);

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
              SizedBox(
                height: 10,
              ),
              Text(
                "Войти",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Укажите номер телефона",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "+7  xxxxxx"),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                width: 160,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registration_second_screen');
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
