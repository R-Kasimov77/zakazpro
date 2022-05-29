import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zakazpro/model/order.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomOrderContainer extends StatelessWidget {
  final String date;
  final String address;
  final String description;
  final List<WorkCategory> workCategories;
  final Function() onDetailTap;
  CustomOrderContainer({
    Key? key,
    required this.date,
    required this.address,
    required this.description,
    required this.onDetailTap,
    required this.workCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _date = DateTime.tryParse(date);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        DateFormat("${'dd.MM.yyyy'} в ${'HH:mm'}")
                            .format(_date ?? DateTime.now()),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  children: workCategories
                      .map(
                        (workCategory) => CustomTagContainer(
                          text: workCategory.name ?? '',
                          backgroundcolor: Colors.grey.shade300,
                          textcolor: AppColors.black,
                        ),
                      )
                      .toList(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.grey.shade300,
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(6),
                //       child: workCategories
                //           .map((e) => Text(
                //                 e.,
                //                 style: TextStyle(color: AppColors.black),
                //               ))
                //           .toList(),
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        address,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2, right: 4, left: 4, bottom: 4),
                    child: InkWell(
                      onTap: onDetailTap,
                      child: Text(
                        "детали",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
