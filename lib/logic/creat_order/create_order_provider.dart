import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/creat_order/create_order_repository.dart';
import 'package:zakazpro/model/creat_order.dart';
import 'package:zakazpro/model/create_order_model.dart';

class CreatOrderProvider extends CreateOrderRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final CreatOrderProvider _instance = CreatOrderProvider.internal();
  factory CreatOrderProvider() => _instance;
  CreatOrderProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Createorder> createorder(CreateOrderModel createOrderModel) async {
    try {
      final response =
          await _dio.post("repair/", data: createOrderModel.toJson());
      return Createorder.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
