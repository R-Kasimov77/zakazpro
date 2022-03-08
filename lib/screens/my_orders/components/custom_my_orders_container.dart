import 'package:flutter/material.dart';
import 'package:zakazpro/screens/home/components/custom_tag_container.dart';
import 'package:zakazpro/utils/app_colors.dart';

class CustomMyOrdersContainer extends StatelessWidget {
  final bool isCLosed;
  const CustomMyOrdersContainer({Key? key, this.isCLosed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        "Сегодня в 18:19",
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
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        "Сварщик",
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                CustomTagContainer(
                  text: isCLosed ? 'Закрытo' : '7/2 ответов',
                  backgroundcolor: isCLosed ? Colors.red : Colors.blue,
                  textcolor: AppColors.white,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis eleifend ex. Nulla et metus ac ante porttitor sollicitudin.",
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
                              "Москва, Тверской пролет, дом 9",
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
                            right: 12, left: 12, top: 2, bottom: 2),
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
