import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/my_orders/my_orders_provider.dart';
import 'package:zakazpro/model/order.dart';

part 'my_orders_cubit.freezed.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final provider = MyOrdersProvider();
  MyOrdersCubit() : super(MyOrdersState.initial()) {
    getOrders();
  }
  getOrders() async {
    emit(MyOrdersState.loading());
    try {
      final response = await provider.myOrders();
      emit(MyOrdersState.loaded(response));
    } catch (e) {
      emit(
        MyOrdersState.failed(
            CatchException.convertException(e).message.toString()),
      );
    }
  }
}

@freezed
class MyOrdersState with _$MyOrdersState {
  const factory MyOrdersState.initial() = _Initial;
  const factory MyOrdersState.loading() = _Loading;
  const factory MyOrdersState.loaded(Order orders) = _Loaded;
  const factory MyOrdersState.failed(String error) = _Failed;
}
