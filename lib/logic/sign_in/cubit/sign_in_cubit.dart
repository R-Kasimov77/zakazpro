import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/sign_in/sign_in_provider.dart';

part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final provider = SignInProvider();
  SignInCubit() : super(SignInState.initial());

  signIn(String username, String password) async {
    emit(SignInState.loading());
    try {
      final response = await provider.signIn(username, password);
      emit(SignInState.loaded(response));
    } catch (e) {
      emit(
        SignInState.failed(
          CatchException.convertException(e).message.toString(),
        ),
      );
    }
  }
}

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.loaded(String token) = _Loaded;
  const factory SignInState.failed(String error) = _Failed;
}
