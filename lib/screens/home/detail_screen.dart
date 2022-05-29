import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zakazpro/logic/candidature/cubit/candidature_cubit.dart';
import 'package:zakazpro/model/order.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/app_toasts.dart';
import 'package:zakazpro/widgets/custom_button.dart';

class Detailscreen extends StatefulWidget {
  final int index;
  final Order order;

  const Detailscreen({
    Key? key,
    required this.index,
    required this.order,
  }) : super(key: key);

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  final cubit = CandidatureCubit();
  @override
  Widget build(BuildContext context) {
    // final cubit = CandidatureCubit;
    final candidaturecontroller = TextEditingController();
    final _date = DateTime.tryParse(widget.order.results[widget.index].created);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Row(
                      children: [
                        BackButton(),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Заказ № ${widget.order.results[widget.index].id}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 4, top: 4),
                        child: Text(
                          DateFormat("${'dd.MM.yyyy'} в ${'HH:mm'}")
                              .format(_date ?? DateTime.now()),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 4, top: 4),
                        child: Text(
                          widget.order.results[widget.index].city,
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Описание задачи",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.order.results[widget.index].description,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Адрес",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${widget.order.results[widget.index].city}, ${widget.order.results[widget.index].address}',
                      // "Москва, Тверской пролет, дом 9",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Оплата",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Wrap(
                      children: [
                        CustomTagContainer(
                          text: widget.order.results[widget.index].paymentTypes
                              .toString(),
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                        // CustomTagContainer(
                        //   text: "Договор",
                        //   backgroundcolor: Colors.grey.shade300,
                        //   textcolor: AppColors.black,
                        // ),
                        // CustomTagContainer(
                        //   text: "Наличка",
                        //   backgroundcolor: Colors.grey.shade300,
                        //   textcolor: AppColors.black,
                        // ),
                      ],
                    ),
                    Text(
                      "Кто нужен",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Wrap(
                      children:
                          widget.order.results[widget.index].workCategories
                              .map(
                                (workCategory) => CustomTagContainer(
                                  text: workCategory.name ?? '',
                                  backgroundcolor: Colors.grey.shade300,
                                  textcolor: AppColors.black,
                                ),
                              )
                              .toList(),
                    ),
                    Center(
                      child: CustomButton(
                        text: "Предложить кандидатуру",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Предложить свою кандидатуру',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextField(
                                      controller: candidaturecontroller,
                                      decoration: InputDecoration(
                                        hintText: "Текст вашего предложения",
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          text: 'Отменить',
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          backgroundColor: Colors.grey,
                                        ),
                                        BlocProvider.value(
                                          value: cubit,
                                          child: BlocListener<CandidatureCubit,
                                              CandidatureState>(
                                            listener: (context, state) {
                                              state.maybeWhen(
                                                orElse: () {},
                                                loaded: (response) {
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          '/menu',
                                                          (route) => false);
                                                  AppToasts().showBottomToast(
                                                    'Ваша кандиатура принята',
                                                    context,
                                                  );
                                                },
                                                failed: (e) {
                                                  AppToasts().showBottomToast(
                                                      "произошла ошибка",
                                                      context,
                                                      true);
                                                },
                                              );
                                            },
                                            child: CustomButton(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              text: 'Предложить',
                                              onPressed: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                if (candidaturecontroller
                                                    .text.isEmpty) {
                                                  AppToasts().showBottomToast(
                                                      "введите текс",
                                                      context,
                                                      true);
                                                } else {
                                                  cubit.condidature(
                                                      candidaturecontroller
                                                          .text);
                                                }
                                              },
                                              backgroundColor: AppColors.blue,
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
                        backgroundColor: Colors.blue,
                        width: 260,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// BlocProvider.value(
//                                           value: cubit,
//                                           child: BlocListener<CandidatureCubit,
//                                               CandidatureState>(
//                                             listener: (context, state) {
//                                               state.maybeWhen(
//                                                 orElse: () {},
//                                                 loaded: (response) {},
//                                                 failed: (e) {
//                                                   AppToasts().showBottomToast(
//                                                       "введите текс",
//                                                       context,
//                                                       true);
//                                                 },
//                                               );
//                                             },
//                                             child: CustomButton(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width /
//                                                   3.5,
//                                               text: 'Предложить',
//                                               onPressed: () {},
//                                               backgroundColor: AppColors.blue,
//                                             ),
//                                           ),
//                                         ),


// BlocProvider(
//                                           create: (context) => CandidatureCubit(),
//                                           child: CustomButton(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 3.5,
//                                             text: 'Предложить',
//                                             onPressed: () {},
//                                             backgroundColor: AppColors.blue,
//                                           ),
//                                         ),