import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_basics/cat_fact/domain/entity/fact.dart';
import 'package:riverpod_basics/cat_fact/shared/shared.dart';

part 'fact_state.freezed.dart';

@freezed
class FactState with _$FactState {
  const factory FactState.initial() = _Initial;
  const factory FactState.loaded(Fact fact) = _Loaded;
  const factory FactState.loading() = _Loading;
  const factory FactState.failure(CatFactFailure failure) = _Failure;
}
