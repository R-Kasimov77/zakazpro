import 'dart:math';

import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/main/main_repository.dart';
import 'package:zakazpro/model/order.dart';

class MainProvider extends MainRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final MainProvider _instance = MainProvider.internal();
  factory MainProvider() => _instance;
  MainProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Order> main() async {
    try {
      final response = await _dio.get(
        "repair/",
      );

      return Order.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
