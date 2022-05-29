import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/my_orders/my_orders_repository.dart';
import 'package:zakazpro/model/order.dart';

class MyOrdersProvider extends MyOrdersRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final MyOrdersProvider _instance = MyOrdersProvider.internal();
  factory MyOrdersProvider() => _instance;
  MyOrdersProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Order> myOrders() async {
    try {
      final response = await _dio.get(
        "repair/",
      );

      return Order.fromJson(response.data);
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
