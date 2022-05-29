import 'package:zakazpro/model/candidature.dart';

abstract class CandidatureRepository {
  Future<Candidature> candidature(String text);
}
