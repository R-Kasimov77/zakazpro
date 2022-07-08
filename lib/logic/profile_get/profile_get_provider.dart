import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/profile_get/profile_get_repository.dart';
import 'package:zakazpro/model/profile_get.dart';

class ProfileGetProvider extends ProfileGetRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final ProfileGetProvider _instance = ProfileGetProvider.internal();
  factory ProfileGetProvider() => _instance;
  ProfileGetProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<ProfileGet> profileGet() async {
    try {
      final response = await _dio.get(
        "users/current/",
      );
      return ProfileGet.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
