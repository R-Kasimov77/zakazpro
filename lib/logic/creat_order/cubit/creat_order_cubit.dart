import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/creat_order/create_order_provider.dart';
import 'package:zakazpro/model/creat_order.dart';
import 'package:zakazpro/model/create_order_model.dart';

part 'creat_order_cubit.freezed.dart';

class CreatOrderCubit extends Cubit<CreatOrderState> {
  final provider = CreatOrderProvider();
  CreatOrderCubit() : super(CreatOrderState.initial());

  creatorder(CreateOrderModel createOrderModel) async {
    emit(CreatOrderState.loading());
    try {
      final response = await provider.createorder(createOrderModel);
      emit(CreatOrderState.loaded(response));
    } catch (e) {
      emit(
        CreatOrderState.failed(
          CatchException.convertException(e).message.toString(),
        ),
      );
    }
  }
}

@freezed
class CreatOrderState with _$CreatOrderState {
  const factory CreatOrderState.initial() = _Initial;
  const factory CreatOrderState.loading() = _Loading;
  const factory CreatOrderState.loaded(Createorder response) = _Loaded;
  const factory CreatOrderState.failed(String error) = _Failed;
}
