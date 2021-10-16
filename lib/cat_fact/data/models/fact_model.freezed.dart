// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'fact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FactModel _$FactModelFromJson(Map<String, dynamic> json) {
  return _FactModel.fromJson(json);
}

/// @nodoc
class _$FactModelTearOff {
  const _$FactModelTearOff();

  _FactModel call(String fact) {
    return _FactModel(
      fact,
    );
  }

  FactModel fromJson(Map<String, Object> json) {
    return FactModel.fromJson(json);
  }
}

/// @nodoc
const $FactModel = _$FactModelTearOff();

/// @nodoc
mixin _$FactModel {
  String get fact => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FactModelCopyWith<FactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FactModelCopyWith<$Res> {
  factory $FactModelCopyWith(FactModel value, $Res Function(FactModel) then) =
      _$FactModelCopyWithImpl<$Res>;
  $Res call({String fact});
}

/// @nodoc
class _$FactModelCopyWithImpl<$Res> implements $FactModelCopyWith<$Res> {
  _$FactModelCopyWithImpl(this._value, this._then);

  final FactModel _value;
  // ignore: unused_field
  final $Res Function(FactModel) _then;

  @override
  $Res call({
    Object? fact = freezed,
  }) {
    return _then(_value.copyWith(
      fact: fact == freezed
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FactModelCopyWith<$Res> implements $FactModelCopyWith<$Res> {
  factory _$FactModelCopyWith(
          _FactModel value, $Res Function(_FactModel) then) =
      __$FactModelCopyWithImpl<$Res>;
  @override
  $Res call({String fact});
}

/// @nodoc
class __$FactModelCopyWithImpl<$Res> extends _$FactModelCopyWithImpl<$Res>
    implements _$FactModelCopyWith<$Res> {
  __$FactModelCopyWithImpl(_FactModel _value, $Res Function(_FactModel) _then)
      : super(_value, (v) => _then(v as _FactModel));

  @override
  _FactModel get _value => super._value as _FactModel;

  @override
  $Res call({
    Object? fact = freezed,
  }) {
    return _then(_FactModel(
      fact == freezed
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FactModel extends _FactModel {
  const _$_FactModel(this.fact) : super._();

  factory _$_FactModel.fromJson(Map<String, dynamic> json) =>
      _$_$_FactModelFromJson(json);

  @override
  final String fact;

  @override
  String toString() {
    return 'FactModel(fact: $fact)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FactModel &&
            (identical(other.fact, fact) ||
                const DeepCollectionEquality().equals(other.fact, fact)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fact);

  @JsonKey(ignore: true)
  @override
  _$FactModelCopyWith<_FactModel> get copyWith =>
      __$FactModelCopyWithImpl<_FactModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FactModelToJson(this);
  }
}

abstract class _FactModel extends FactModel {
  const factory _FactModel(String fact) = _$_FactModel;
  const _FactModel._() : super._();

  factory _FactModel.fromJson(Map<String, dynamic> json) =
      _$_FactModel.fromJson;

  @override
  String get fact => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FactModelCopyWith<_FactModel> get copyWith =>
      throw _privateConstructorUsedError;
}
