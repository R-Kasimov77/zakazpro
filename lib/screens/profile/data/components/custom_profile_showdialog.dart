import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/profile/cubit/profile_cubit.dart';
import 'package:zakazpro/screens/profile/data/components/custom_person_data.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/app_toasts.dart';
import 'package:zakazpro/widgets/custom_button.dart';

class CustomProfileShowDialog extends StatefulWidget {
  final TextField textField;
  // final Function onTap;
  final String mainText;
  final String buttonFirstText;
  final String buttonSecondText;
  final String text;
  final CustomButton customButton;
  const CustomProfileShowDialog({
    Key? key,
    // required this.onTap,
    required this.mainText,
    required this.buttonFirstText,
    required this.buttonSecondText,
    required this.text,
    required this.textField, required this.customButton,
  }) : super(key: key);

  @override
  State<CustomProfileShowDialog> createState() =>
      _CustomProfileShowDialogState();
}

class _CustomProfileShowDialogState extends State<CustomProfileShowDialog> {
  final cubit = ProfileCubit();
  // final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.mainText,
                      style: TextStyle(
                          color: AppColors.black, fontWeight: FontWeight.w600),
                    ),
                    widget.textField,
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          width: MediaQuery.of(context).size.width / 3.5,
                          text: 'Отменить',
                          onPressed: () => Navigator.pop(context),
                          backgroundColor: Colors.grey,
                        ),
                        BlocProvider.value(
                          value: cubit,
                          child: BlocListener<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                loaded: (response) {
                                  Navigator.pop(context);
                                  AppToasts().showBottomToast(
                                    'Имя изменено',
                                    context,
                                  );
                                },
                                failed: (e) {
                                  AppToasts().showBottomToast(
                                      "произошла ошибка", context, true);
                                },
                              );
                            },
                            child: widget.customButton
                            // CustomButton(
                            //   width: MediaQuery.of(context).size.width / 3.5,
                            //   text: 'Изменить',
                            //   onPressed: () {
                            //     widget.onTap;
                            //   },
                            //   backgroundColor: AppColors.blue,
                            // ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            });
      },
      child: CustomPersonData(
        icon: Icon(Icons.border_color_outlined),
        text: widget.text,
      ),
    );
  }
}
