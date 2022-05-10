import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/sign_up/sign_up_repository.dart';

class SignUpProvider extends SignUpRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// И мап для запроса
  late Map<String, dynamic> request;
  static final SignUpProvider _instance = SignUpProvider.internal();
  factory SignUpProvider() => _instance;
  SignUpProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }
  @override
  Future<String> signUp(String username, String password, String phone) async {
    try {
      final response = await _dio.post(
        'register/',
        data: {
          'username': username,
          'password': password,
          'phone': phone,
        },
      );

      return response.data['username'];
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
