import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/profile/profile_provider.dart';
import 'package:zakazpro/model/profile.dart';
import 'package:zakazpro/model/profile_get.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final provider = ProfileProvider();
  ProfileCubit() : super(ProfileState.initial());

  profile(ProfileGet profileGet) async {
    emit(ProfileState.loading());
    try {
      final response = await provider.profile(profileGet);
      emit(ProfileState.loaded(response));
    } catch (e) {
      emit(ProfileState.failed(
        CatchException.convertException(e).message.toString(),
      ));
    }
  }
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(Profile response) = _Loaded;
  const factory ProfileState.failed(String error) = _Failed;
}
