import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/sign_in/cubit/sign_in_cubit.dart';
import 'package:zakazpro/logic/sign_up/cubit/sign_up_cubit.dart';
import 'package:zakazpro/widgets/custom_button.dart';
import 'package:zakazpro/widgets/custom_text_field.dart';

class RegistrationFirstScreen extends StatefulWidget {
  const RegistrationFirstScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationFirstScreen> createState() =>
      _RegistrationFirstScreenState();
}

class _RegistrationFirstScreenState extends State<RegistrationFirstScreen> {
  final phonecontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final surnamecontroller = TextEditingController();

  final signUpCubit = SignUpCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Spacer(),
                Center(
                    // child: Icon(
                    //   Icons.photo_size_select_actual_outlined,
                    //   size: 80,
                    // ),
                    ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Войти",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Укажите свои данные!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: "+7  xxxxxx",
                  textInputType: TextInputType.number,
                  controller: phonecontroller,
                ),
                SizedBox(height: 26),
                CustomTextField(
                  hintText: "Имя",
                  controller: namecontroller,
                ),
                SizedBox(height: 26),
                CustomTextField(
                  hintText: "Фамилия",
                  controller: surnamecontroller,
                ),
                SizedBox(
                  height: 22,
                ),
                BlocProvider.value(
                  value: signUpCubit,
                  child: BlocListener<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          loaded: (token) {
                            print(token);
                            Navigator.pushNamed(
                                context, '/registration_second_screen');
                          },
                          failed: (e) {
                            print("Ошибка");
                          });
                    },
                    child: CustomButton(
                      text: 'Зарегитсрироваться',
                      onPressed: () {
                        signUpCubit.signUp(phonecontroller.text,
                            namecontroller.text, surnamecontroller.text);
                      },
                      backgroundColor: Colors.blue,
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
      ),
    );
  }
}

// BlocProvider.value(
//                   value: signInCubit,
//                   child: BlocListener<SignInCubit, SignInState>(
//                     listener: (context, state) {
//                       state.maybeWhen(
//                         orElse: () {},
//                         loaded: (token) {
//                           print(token);
//                         },
//                       );
//                     },
//                     child: CustomButton(
//                       text: 'Войти',
//                       onPressed: () {
//                         signInCubit.signIn(
//                             logincontroller.text, passwordController.text);
//                       },
//                       backgroundColor: Colors.blue,
//                     ),
//                   ),
//                 ),
