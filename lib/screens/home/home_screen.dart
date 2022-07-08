import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazpro/logic/main/cubit/main_cubit.dart';
import 'package:zakazpro/model/screens/detail_screen_arguments.dart';
import 'package:zakazpro/screens/home/components/custom_order_container.dart';
import 'package:zakazpro/utils/app_colors.dart';
import 'package:zakazpro/widgets/scale_animated_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? time;
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return state.when(
                initial: () => SizedBox(),
                loading: () => SizedBox(),
                loaded: (orders) => ListView(
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
                          child: Center(
                            child: Text(
                              "Заказы: ${orders.count.toString()}",
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: orders.results.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return (
                          // onPressed: () {
                          //   // Navigator.pushNamed(context, '/detail');
                          // },
                          // child: 
                          CustomOrderContainer(
                              date: orders.results[index].created,
                              address:
                                  '${orders.results[index].city}, ${orders.results[index].address}',
                              description: orders.results[index].description,
                              onDetailTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detail',
                                  arguments: DetailScreenArguments(
                                    index: index,
                                    order: orders,
                                    responses: []
                                  ),
                                );
                              },
                              workCategories:
                                  orders.results[index].workCategories)
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
