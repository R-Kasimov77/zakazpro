import 'package:zakazpro/model/profile.dart';
import 'package:zakazpro/model/profile_get.dart';

abstract class ProfileRepository {
  Future<Profile> profile(ProfileGet profileGet);
}
