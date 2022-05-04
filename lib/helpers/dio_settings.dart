import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://45.155.207.86:8015/api/v1/',
      contentType: 'application/json',
      connectTimeout: 20000,
      receiveTimeout: 20000,
    ),
  );

  void setup() async {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptors.addAll([
      if (kDebugMode) logInterceptor,
      headerInterceptors,
    ]);
  }
}
