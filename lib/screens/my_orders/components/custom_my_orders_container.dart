import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zakazpro/model/order.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomMyOrdersContainer extends StatelessWidget {
  final bool isCLosed;
  final int index;
  final List<Results> orders;
  const CustomMyOrdersContainer(
      {Key? key,
      this.isCLosed = false,
      required this.index,
      required this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _date = DateTime.tryParse(orders[index].created);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                        child: Text(
                          DateFormat("${'dd.MM.yyyy'} в ${'HH:mm'}")
                              .format(_date ?? DateTime.now()),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: orders[index].workCategories
                        .map((workCategory) => Container(
                            margin: EdgeInsets.only(left: 4),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(workCategory.name ?? '')))
                        .toList(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomTagContainer(
                    text: isCLosed ? 'Закрытo' : '',
                    backgroundcolor: isCLosed ? Colors.red : Colors.transparent,
                    textcolor: AppColors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                orders[index].description,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isCLosed
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              '${orders[index].city}, ${orders[index].address}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12, left: 12, top: 2, bottom: 4),
                        child: Text(
                          "детали",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
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
