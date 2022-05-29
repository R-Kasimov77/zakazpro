import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zakazpro/helpers/catch_exception.dart';
import 'package:zakazpro/logic/candidature/candidature_provider.dart';
import 'package:zakazpro/model/candidature.dart';

part 'candidature_cubit.freezed.dart';

class CandidatureCubit extends Cubit<CandidatureState> {
  final provider = CandidatureProvider();
  CandidatureCubit() : super(CandidatureState.initial());

  condidature(String text) async {
    emit(CandidatureState.loading());
    try {
      final response = await provider.candidature(text);
      emit(CandidatureState.loaded(response));
    } catch (e) {
      emit(
        CandidatureState.failed(
          CatchException.convertException(e).message.toString(),
        ),
      );
    }
  }
}

@freezed
class CandidatureState with _$CandidatureState {
  const factory CandidatureState.initial() = _Initial;
  const factory CandidatureState.loading() = _Loading;
  const factory CandidatureState.loaded(Candidature response) = _Loaded;
  const factory CandidatureState.failed(String error) = _Failed;
}
