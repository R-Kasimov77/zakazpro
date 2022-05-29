import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/main/main_provider.dart';
import 'package:zakazpro/model/order.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  final provider = MainProvider();
  MainCubit() : super(MainState.initial()) {
    getOrders();
  }
  getOrders() async {
    emit(MainState.loading());
    try {
      final response = await provider.main();
      emit(MainState.loaded(response));
    } catch (e) {
      emit(
        MainState.failed(CatchException.convertException(e).message.toString()),
      );
    }
  }
}

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = _Loading;
  const factory MainState.loaded(Order orders) = _Loaded;
  const factory MainState.failed(String error) = _Failed;
}
