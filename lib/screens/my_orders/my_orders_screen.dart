import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/my_orders/cubit/my_orders_cubit.dart';
import 'package:zakazpro/model/order.dart';
import 'package:zakazpro/model/screens/detail_screen_arguments.dart';
import 'package:zakazpro/screens/my_orders/components/custom_my_orders_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final ValueNotifier<bool> isClosedOrders = ValueNotifier(false);
  final closedOrders = <Results>[];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MyOrdersCubit()),
      child: Scaffold(
        body: SafeArea(child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            return state.when(
              initial: () => SizedBox(),
              loading: () => SizedBox(),
              loaded: (myOrders) {
                for (var result in myOrders.results) {
                  if (result.status == 'completed') {
                    closedOrders.add(result);
                  }
                }
                return ListView(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // BackButton(),
                              Text(
                                "Мои заказы",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              // Icon(
                              //   Icons.add_box_outlined,
                              //   size: 50,
                              //   color: Colors.yellow.shade700,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValueListenableBuilder(
                          valueListenable: isClosedOrders,
                          builder: (context, str, _) {
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
                          }),
                    ),
                    ValueListenableBuilder(
                      valueListenable: isClosedOrders,
                      builder: (context, str, _) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: isClosedOrders.value
                              ? closedOrders.length
                              : myOrders.results.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ScaleAnimationContainer(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detail_order',
                                  arguments: DetailScreenArguments(
                                    index: index,
                                    order: myOrders,
                                    responses: myOrders.results[index].responses
                                  ),
                                );
                              },
                              child: isClosedOrders.value
                                  ? CustomMyOrdersContainer(
                                      isCLosed: true,
                                      index: index,
                                      orders: closedOrders,
                                    )
                                  : CustomMyOrdersContainer(
                                      orders: myOrders.results,
                                      index: index,
                                    ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
              failed: (error) => Center(
                child: Text(error),
              ),
            );
          },
        )),
      ),
    );
  }
}


// ListView(
//             physics: ClampingScrollPhysics(),
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.blue,
//                     borderRadius: BorderRadius.circular(6)),
//                 height: 60,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // BackButton(),
//                         Text(
//                           "Мои заказы",
//                           style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         // Icon(
//                         //   Icons.add_box_outlined,
//                         //   size: 50,
//                         //   color: Colors.yellow.shade700,
//                         // )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ValueListenableBuilder(
//                     valueListenable: isClosedOrders,
//                     builder: (context, str, _) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                                 backgroundColor: !isClosedOrders.value
//                                     ? Colors.blueGrey.shade200
//                                     : Colors.transparent,
//                                 minimumSize: Size(180, 50),
//                                 primary: Colors.black,
//                                 side: BorderSide(color: Colors.black)),
//                             onPressed: () {
//                               isClosedOrders.value = false;
//                             },
//                             child: Text("Актуальные"),
//                           ),
//                           OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                                 backgroundColor: isClosedOrders.value
//                                     ? Colors.blueGrey.shade200
//                                     : Colors.transparent,
//                                 minimumSize: Size(180, 50),
//                                 primary: Colors.black,
//                                 side: BorderSide(color: Colors.black)),
//                             onPressed: () {
//                               isClosedOrders.value = true;
//                             },
//                             child: Text("Закрытые"),
//                           )
//                         ],
//                       );
//                     }),
//               ),
//               ValueListenableBuilder(
//                 valueListenable: isClosedOrders,
//                 builder: (context, str, _) {
//                   return ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: 8,
//                     shrinkWrap: true,
//                     itemBuilder: (BuildContext context, int index) {
//                       return ScaleAnimationContainer(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/detail_order');
//                           },
//                           child: isClosedOrders.value
//                               ? CustomMyOrdersContainer(isCLosed: true)
//                               : CustomMyOrdersContainer());
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),