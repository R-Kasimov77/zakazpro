import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/profile/profile_repository.dart';
import 'package:zakazpro/model/profile.dart';
import 'package:zakazpro/model/profile_get.dart';

class ProfileProvider extends ProfileRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  late Map<String, dynamic> request;
  static final ProfileProvider _instance = ProfileProvider.internal();
  factory ProfileProvider() => _instance;
  ProfileProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Profile> profile(ProfileGet profileGet) async {
    try {
      final response =
          await _dio.patch("users/current/", data: 
             profileGet.toJson()
          );
      return Profile.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
