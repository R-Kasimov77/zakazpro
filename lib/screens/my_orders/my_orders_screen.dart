import 'package:flutter/material.dart';
import 'package:zakazpro/screens/my_orders/components/custom_my_orders_container.dart';
import 'package:zakazpro/utils/app_colors.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);

  final ValueNotifier<bool> isClosedOrders = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(),
                      Text(
                        "Мои заказы",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        Icons.add_box_outlined,
                        size: 50,
                        color: Colors.yellow.shade700,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: isClosedOrders,
                builder: (context,str,_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: !isClosedOrders.value
                                ? Colors.blueGrey.shade200
                                : Colors.transparent,
                            minimumSize: Size(180, 50),
                            primary: Colors.black,
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {
                          isClosedOrders.value = false;
                        },
                        child: Text("Актуальные"),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: isClosedOrders.value
                                ? Colors.blueGrey.shade200
                                : Colors.transparent,
                            minimumSize: Size(180, 50),
                            primary: Colors.black,
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {
                          isClosedOrders.value = true;
                        },
                        child: Text("Закрытые"),
                      )
                    ],
                  );
                }
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isClosedOrders,
              builder: (context, str, _) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return isClosedOrders.value
                        ? CustomMyOrdersContainer(isCLosed: true)
                        : CustomMyOrdersContainer();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
