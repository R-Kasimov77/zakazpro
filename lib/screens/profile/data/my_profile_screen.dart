import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/profile/cubit/profile_cubit.dart';
import 'package:zakazpro/logic/profile_get/cubit/profile_get_cubit.dart';
import 'package:zakazpro/model/profile_get.dart';
import 'package:zakazpro/screens/profile/data/components/custom_person_data.dart';
import 'package:zakazpro/screens/profile/data/components/custom_profile_container.dart';
import 'package:zakazpro/screens/profile/data/components/custom_profile_parametors.dart';
import 'package:zakazpro/screens/profile/data/components/custom_profile_showdialog.dart';
import 'package:zakazpro/screens/profile/partfolio/components/custom_partfolio.dart';
import 'package:zakazpro/screens/profile/reviews/components/custom_review_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/utils/styles.dart';
import 'package:zakazpro/widgets/app_toasts.dart';
import 'package:zakazpro/widgets/custom_bold_text.dart';
import 'package:zakazpro/widgets/custom_button.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final cubit = ProfileCubit();
  final profileGetCubit = ProfileGetCubit();
  ValueNotifier<String> screen = ValueNotifier('data');

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    return BlocProvider.value(
      value: profileGetCubit,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileGetCubit, ProfileGetState>(
            builder: (context, state) {
              return state.when(
                initial: () => SizedBox(),
                loading: () => SizedBox(),
                loaded: (profileGet) => ListView(
                  physics: ClampingScrollPhysics(),
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
                          child:
                              // BackButton(),
                              Center(
                            child: Text(
                              "Мой профиль",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValueListenableBuilder(
                          valueListenable: screen,
                          builder: (context, str, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: screen.value == 'data'
                                          ? Colors.blueGrey.shade200
                                          : Colors.transparent,
                                      minimumSize: Size(
                                          Styles.getWidth(context) / 3.5, 50),
                                      primary: Colors.black,
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    screen.value = screen.value = 'data';
                                  },
                                  child: Text("Данные"),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: screen.value == 'port'
                                          ? Colors.blueGrey.shade200
                                          : Colors.transparent,
                                      minimumSize: Size(
                                          Styles.getWidth(context) / 3.5, 50),
                                      primary: Colors.black,
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    screen.value = screen.value = 'port';
                                  },
                                  child: Text("Портфолио"),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: screen.value == 'otzyv'
                                          ? Colors.blueGrey.shade200
                                          : Colors.transparent,
                                      minimumSize: Size(
                                          Styles.getWidth(context) / 3.5, 50),
                                      primary: Colors.black,
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    screen.value = screen.value = 'otzyv';
                                  },
                                  child: Text("Отзывы"),
                                )
                              ],
                            );
                          }),
                    ),
                    ValueListenableBuilder(
                      valueListenable: screen,
                      builder: (context, str, _) {
                        return SizedBox(
                          child: screen.value == 'data'
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      Container(
                                                    height: 200,
                                                    color: Colors.white,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Загрузить фото",
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child: Center(
                                                              child: Container(
                                                                child: Center(
                                                                    child: Text(
                                                                        "Из галлереи")),
                                                                height: 44,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.2,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child: Center(
                                                              child: Container(
                                                                child: Center(
                                                                    child: Text(
                                                                        "сделать фото с камеры")),
                                                                height: 44,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.2,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                width: 120,
                                                height: 120,
                                                child: Center(
                                                  child: Text(
                                                    "Photo",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Имя',
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  nameController,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "Новое имя",
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 16),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                CustomButton(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3.5,
                                                                  text:
                                                                      'Отменить',
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                                BlocProvider
                                                                    .value(
                                                                  value: cubit,
                                                                  child: BlocListener<
                                                                      ProfileCubit,
                                                                      ProfileState>(
                                                                    listener:
                                                                        (context,
                                                                            state) {
                                                                      state
                                                                          .maybeWhen(
                                                                        orElse:
                                                                            () {},
                                                                        loaded:
                                                                            (response) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          AppToasts()
                                                                              .showBottomToast(
                                                                            'Имя изменено',
                                                                            context,
                                                                          );
                                                                        },
                                                                        failed:
                                                                            (e) {
                                                                          AppToasts().showBottomToast(
                                                                              "произошла ошибка",
                                                                              context,
                                                                              true);
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        CustomButton(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.5,
                                                                      text:
                                                                          'Изменить',
                                                                      onPressed:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        if (nameController
                                                                            .text
                                                                            .isEmpty) {
                                                                          AppToasts().showBottomToast(
                                                                              "введите текс!",
                                                                              context,
                                                                              true);
                                                                        } else {
                                                                          profileGet.username =
                                                                              nameController.text;
                                                                          cubit.profile(
                                                                              profileGet);
                                                                        }
                                                                      },
                                                                      backgroundColor:
                                                                          AppColors
                                                                              .blue,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: CustomPersonData(
                                                  text: profileGet.username
                                                      .toString(),
                                                  icon: Icon(Icons
                                                      .border_color_outlined),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Номер',
                                                              style: TextStyle(
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .phone,
                                                              controller:
                                                                  phoneController,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "Новый номер",
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 16),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                CustomButton(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3.5,
                                                                  text:
                                                                      'Отменить',
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                                BlocProvider
                                                                    .value(
                                                                  value: cubit,
                                                                  child: BlocListener<
                                                                      ProfileCubit,
                                                                      ProfileState>(
                                                                    listener:
                                                                        (context,
                                                                            state) {
                                                                      state
                                                                          .maybeWhen(
                                                                        orElse:
                                                                            () {},
                                                                        loaded:
                                                                            (response) {
                                                                          Navigator.pop(
                                                                              context);
                                                                          AppToasts()
                                                                              .showBottomToast(
                                                                            'Имя изменено',
                                                                            context,
                                                                          );
                                                                        },
                                                                        failed:
                                                                            (e) {
                                                                          AppToasts().showBottomToast(
                                                                              "произошла ошибка",
                                                                              context,
                                                                              true);
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        CustomButton(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.5,
                                                                      text:
                                                                          'Изменить',
                                                                      onPressed:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        if (phoneController
                                                                            .text
                                                                            .isEmpty) {
                                                                          AppToasts().showBottomToast(
                                                                              "введите текс!",
                                                                              context,
                                                                              true);
                                                                        } else {
                                                                          profileGet.phone =
                                                                              phoneController.text;
                                                                          cubit.profile(
                                                                              profileGet);
                                                                        }
                                                                      },
                                                                      backgroundColor:
                                                                          AppColors
                                                                              .blue,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: CustomPersonData(
                                                    text: profileGet.phone
                                                        .toString(),
                                                    icon: Icon(Icons
                                                        .border_color_outlined)),
                                              ),
                                              // CustomProfileShowDialog(
                                              //   buttonFirstText: "Отмена",
                                              //   buttonSecondText: 'Изменить',
                                              //   mainText: 'Номер',
                                              //   text:
                                              //       profileGet.phone.toString(),
                                              //   textField: TextField(
                                              //     keyboardType:
                                              //         TextInputType.phone,
                                              //     controller: phoneController,
                                              //     decoration: InputDecoration(
                                              //       hintText: 'Изменить номер',
                                              //     ),
                                              //   ),
                                              //   customButton: CustomButton(
                                              //     width: MediaQuery.of(context)
                                              //             .size
                                              //             .width /
                                              //         3.5,
                                              //     backgroundColor: Colors.blue,
                                              //     onPressed: () {
                                              //       FocusScope.of(context)
                                              //           .unfocus();
                                              //       if (phoneController
                                              //           .text.isEmpty) {
                                              //         AppToasts()
                                              //             .showBottomToast(
                                              //                 "введите текс!",
                                              //                 context,
                                              //                 true);
                                              //       } else {
                                              //         profileGet.phone =
                                              //             phoneController.text;
                                              //         cubit.profile(profileGet);
                                              //       }
                                              //     },
                                              //     text: 'Изменить',
                                              //   ),
                                              // ),
                                              // CustomPersonData(
                                              //   text: "srdarov@mail.com",
                                              //   icon: Icon(Icons
                                              //       .border_color_outlined),
                                              // ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, right: 12),
                                            child: Text(
                                              "Коротко о моей деятельности",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Icon(Icons.border_color_outlined)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis eleifend ex. Nulla et metus ac ante porttitor sollicitudin. Curabitur rhoncus tortor vel orci lacinia",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Row(
                                        children: [
                                          CustomBoldText(
                                              text: "Я юридическое лицо:"),
                                          Switch(
                                            activeColor: Colors.green,
                                            value: profileGet.isLegalEntity,
                                            onChanged: (value) {},
                                          )
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: Row(
                                          children: [
                                            CustomBoldText(
                                                text: "Стаж работы:"),
                                            SizedBox(width: 8),
                                            Text(
                                              "более 5 лет",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: Icon(
                                                  Icons.border_color_outlined),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: CustomBoldText(
                                            text: "Направление моей работы"),
                                      ),
                                      Wrap(
                                        children: [
                                          CustomProfileContainer(
                                              text: "Сварщик"),
                                          // CustomProfileContainer(text: "Сварщик"),
                                          // CustomProfileContainer(text: "Сварщик"),
                                          // CustomProfileContainer(text: "Сварщик"),
                                          // CustomProfileContainer(text: "Сварщик"),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      CustomProfileParametors(
                                          text: "Настройки уведомлений",
                                          navigator: '/settings_message'),
                                      CustomProfileParametors(
                                          text: "Вопросы и ответы",
                                          navigator: "/questions_screen"),
                                    ],
                                  ),
                                )
                              : screen.value == 'port'
                                  ? ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 10,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ScaleAnimationContainer(
                                          onPressed: () {},
                                          child: CustomParfolio(),
                                        );
                                      },
                                      // children: [
                                      //   CustomParfolio(),
                                      //   CustomParfolio(),
                                      //   CustomParfolio()
                                      // ],
                                    )
                                  : ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: 10,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ScaleAnimationContainer(
                                          onPressed: () {},
                                          child: CustomReview(),
                                        );
                                      },
                                    ),
                        );
                      },
                    ),
                  ],
                ),
                failed: (error) => Center(
                  child: Text(error),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
