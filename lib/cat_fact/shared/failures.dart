import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class CatFactFailure with _$CatFactFailure {
  const factory CatFactFailure.server(String? message) = _Server;
}
