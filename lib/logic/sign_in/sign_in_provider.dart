import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/sign_in/sign_in_repository.dart';

class SignInProvider extends SignInRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// И мап для запроса
  late Map<String, dynamic> request;
  static final SignInProvider _instance = SignInProvider.internal();
  factory SignInProvider() => _instance;
  SignInProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }
  @override
  Future<String> signIn(String username, String password) async {
    try {
      final response = await _dio.post(
        'auth/',
        queryParameters: {
          'username': username,
          'password': password,
        },
      );

      return response.data['token'];
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
