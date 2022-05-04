import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/sign_up/sign_up_provider.dart';

part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final provider = SignUpProvider();
  SignUpCubit() : super(SignUpState.initial());

  signUp(String username, String password) async {
    emit(SignUpState.loading());
    try {
      final response = await provider.signUp(username, password);
      emit(SignUpState.loaded(response));
    } catch (e) {
      emit(
        SignUpState.failed(
            CatchException.convertException(e).message.toString()),
      );
    }
  }
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.loaded(String username) = _Loaded;
  const factory SignUpState.failed(String error) = _Failed;
}
