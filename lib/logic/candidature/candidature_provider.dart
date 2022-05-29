import 'package:dio/dio.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/helpers/dio_settings.dart';
import 'package:zakazpro/logic/candidature/candidature_repository.dart';
import 'package:zakazpro/model/candidature.dart';

class CandidatureProvider extends CandidatureRepository {
  late DioSettings _dioSettings;
  late Dio _dio;

  /// И мап для запроса
  late Map<String, dynamic> request;
  static final CandidatureProvider _instance = CandidatureProvider.internal();
  factory CandidatureProvider() => _instance;
  CandidatureProvider.internal() {
    _dioSettings = DioSettings();
    _dio = _dioSettings.dio;
  }

  @override
  Future<Candidature> candidature(String text) async {
    try {
      final response = await _dio.post("repair_response/", data: {
        "text": text,
        "repair": 1,
      });
      return Candidature.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
