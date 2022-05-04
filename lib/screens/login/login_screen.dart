import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/sign_in/cubit/sign_in_cubit.dart';
import 'package:zakazpro/widgets/custom_button.dart';
import 'package:zakazpro/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final logincontroller = TextEditingController();
  final passwordController = TextEditingController();

  final signInCubit = SignInCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Логин',
                controller: logincontroller,
              ),
              SizedBox(
                height: 22,
              ),
              CustomTextField(
                hintText: 'Логин',
                controller: passwordController,
              ),
              SizedBox(height: 12),
              BlocProvider.value(
                value: signInCubit,
                child: BlocListener<SignInCubit, SignInState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      loaded: (token) {
                        print(token);
                      },
                    );
                  },
                  child: CustomButton(
                    text: 'Войти',
                    onPressed: () {
                      signInCubit.signIn(
                          logincontroller.text, passwordController.text);
                    },
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 12),
              CustomButton(
                text: 'Войти',
                onPressed: () {},
                backgroundColor: Colors.blue,
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
                              'Нажимая на кнопку Далее, вы \nподтверждаете, что ознакомлены\nи согласны с условиями ',
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
