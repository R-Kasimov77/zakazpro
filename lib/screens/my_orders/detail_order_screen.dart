import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';
import 'package:zakazpro/model/order.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';

import 'package:zakazpro/utils/app_colors.dart';

class DetailOrderScreen extends StatelessWidget {
  final int index;
  final Order order;

  DetailOrderScreen({
    Key? key,
    required this.index,
    required this.order,
  }) : super(key: key);

  final ValueNotifier<bool> isDetail = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final _date = DateTime.tryParse(order.results[index].created);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackButton(),
                        Text(
                          "Заказы: ${order.count}",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        // SizedBox(width: 1,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                    valueListenable: isDetail,
                    builder: (context, str, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: !isDetail.value
                                    ? Colors.blueGrey.shade200
                                    : Colors.transparent,
                                minimumSize: Size(180, 50),
                                primary: Colors.black,
                                side: BorderSide(color: Colors.black)),
                            onPressed: () {
                              isDetail.value = false;
                            },
                            child: Text("Детали заказа"),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: isDetail.value
                                    ? Colors.blueGrey.shade200
                                    : Colors.transparent,
                                minimumSize: Size(180, 50),
                                primary: Colors.black,
                                side: BorderSide(color: Colors.black)),
                            onPressed: () {
                              isDetail.value = true;
                            },
                            child: Text("Ответы на заказ"),
                          )
                        ],
                      );
                    }),
              ),
              ValueListenableBuilder(
                valueListenable: isDetail,
                builder: (context, str, _) {
                  return !isDetail.value
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16,
                                          left: 16,
                                          bottom: 4,
                                          top: 4),
                                      child: Text(
                                        DateFormat(
                                                "${'dd.MM.yyyy'} в ${'HH:mm'}")
                                            .format(_date ?? DateTime.now()),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16,
                                            left: 16,
                                            bottom: 4,
                                            top: 4),
                                        child: Text(
                                          order.results[index].city,
                                          style:
                                              TextStyle(color: AppColors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   "(11 ответов)",
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w800),
                                  // ),
                                ],
                              ),
                              Text(
                                "Описание задачи",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                order.results[index].description,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Адрес",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${order.results[index].city}, ${order.results[index].address}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Оплата",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Wrap(
                                children: [
                                  CustomTagContainer(
                                    text: order.results[index].paymentTypes
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
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: order.results[index].workCategories
                                    .map((workCategory) => Container(
                                        margin: EdgeInsets.only(right: 6),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(workCategory.name ?? '')))
                                    .toList(),
                              ),
                              // Wrap(
                              //   children: [
                              //     CustomTagContainer(
                              //       text: order.results[index].workCategories.toString(),
                              //       backgroundcolor: Colors.grey.shade300,
                              //       textcolor: AppColors.black,
                              // ),
                              // CustomTagContainer(
                              //   text: "Плиточник",
                              //   backgroundcolor: Colors.grey.shade300,
                              //   textcolor: AppColors.black,
                              // ),
                              // CustomTagContainer(
                              //   text: "Прораб",
                              //   backgroundcolor: Colors.grey.shade300,
                              //   textcolor: AppColors.black,
                              // ),
                              // CustomTagContainer(
                              //   text: "Инженер",
                              //   backgroundcolor: Colors.grey.shade300,
                              //   textcolor: AppColors.black,
                              // )
                              //   ],
                              // )
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: order.results[index].responses.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8, top: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: order.results[index]
                                                        .responses.isNotEmpty
                                                    ? Text(
                                                        DateFormat(
                                                                "${'dd.MM.yyyy'} в ${'HH:mm'}")
                                                            .format(DateTime
                                                                    .tryParse(
                                                                  order
                                                                      .results[
                                                                          index]
                                                                      .responses[
                                                                          i]
                                                                      .user
                                                                      .dateJoined,
                                                                ) ??
                                                                DateTime.now()),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.photo,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                              order.results[index].responses
                                                      .isNotEmpty
                                                  ? order
                                                      .results[index]
                                                      .responses[i]
                                                      .user
                                                      .username
                                                  : '',
                                              // order.results[index].responses.first.user.username.,
                                              style: TextStyle(fontSize: 16)),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: InkWell(
                                              onTap: () async {
                                                if (order.results[index]
                                                        .responses.isNotEmpty &&
                                                    order
                                                            .results[index]
                                                            .responses
                                                            .first
                                                            .user
                                                            .phone !=
                                                        null) {
                                                  await FlutterPhoneDirectCaller
                                                      .callNumber(
                                                    order
                                                        .results[index]
                                                        .responses[i]
                                                        .user
                                                        .phone!,
                                                  );
                                                }
                                              },
                                              child: Icon(
                                                Icons.phone,
                                                color: Colors.green,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8, left: 8),
                                        child: Text(
                                          order
                                              .results[index].responses[i].text,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
