import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/profile_get/profile_get_provider.dart';
import 'package:zakazpro/model/profile_get.dart';

part 'profile_get_cubit.freezed.dart';

class ProfileGetCubit extends Cubit<ProfileGetState> {
  final provider = ProfileGetProvider();
  ProfileGetCubit() : super(ProfileGetState.initial()) {
    getProfile();
  }
  getProfile() async {
    emit(ProfileGetState.loading());
    try {
      final response = await provider.profileGet();
      emit(ProfileGetState.loaded(response));
    } catch (e) {
      emit(ProfileGetState.failed(
          CatchException.convertException(e).message.toString()));
    }
  }
}

@freezed
class ProfileGetState with _$ProfileGetState {
  const factory ProfileGetState.initial() = _Initial;
  const factory ProfileGetState.loading() = _Loading;
  const factory ProfileGetState.loaded(ProfileGet profileGet) = _Loaded;
  const factory ProfileGetState.failed(String error) = _Failed;
}
