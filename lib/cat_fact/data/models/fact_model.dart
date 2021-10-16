import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_basics/cat_fact/domain/entity/fact.dart';

part 'fact_model.freezed.dart';
part 'fact_model.g.dart';

@freezed
class FactModel with _$FactModel {
  const FactModel._();

  const factory FactModel(String fact) = _FactModel;

  factory FactModel.fromDomain(Fact fact) => FactModel(fact.fact);

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);

  Fact toDomain() => Fact(fact: fact);
}
