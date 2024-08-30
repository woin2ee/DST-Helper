// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Nutrient _$NutrientFromJson(Map<String, dynamic> json) {
  return _Nutrient.fromJson(json);
}

/// @nodoc
mixin _$Nutrient {
  /// 퇴비
  int get compost => throw _privateConstructorUsedError;

  /// 성장 촉진제
  int get growthFormula => throw _privateConstructorUsedError;

  /// 거름
  int get manure => throw _privateConstructorUsedError;

  /// Serializes this Nutrient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Nutrient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientCopyWith<Nutrient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientCopyWith<$Res> {
  factory $NutrientCopyWith(Nutrient value, $Res Function(Nutrient) then) =
      _$NutrientCopyWithImpl<$Res, Nutrient>;
  @useResult
  $Res call({int compost, int growthFormula, int manure});
}

/// @nodoc
class _$NutrientCopyWithImpl<$Res, $Val extends Nutrient>
    implements $NutrientCopyWith<$Res> {
  _$NutrientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Nutrient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compost = null,
    Object? growthFormula = null,
    Object? manure = null,
  }) {
    return _then(_value.copyWith(
      compost: null == compost
          ? _value.compost
          : compost // ignore: cast_nullable_to_non_nullable
              as int,
      growthFormula: null == growthFormula
          ? _value.growthFormula
          : growthFormula // ignore: cast_nullable_to_non_nullable
              as int,
      manure: null == manure
          ? _value.manure
          : manure // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientImplCopyWith<$Res>
    implements $NutrientCopyWith<$Res> {
  factory _$$NutrientImplCopyWith(
          _$NutrientImpl value, $Res Function(_$NutrientImpl) then) =
      __$$NutrientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int compost, int growthFormula, int manure});
}

/// @nodoc
class __$$NutrientImplCopyWithImpl<$Res>
    extends _$NutrientCopyWithImpl<$Res, _$NutrientImpl>
    implements _$$NutrientImplCopyWith<$Res> {
  __$$NutrientImplCopyWithImpl(
      _$NutrientImpl _value, $Res Function(_$NutrientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Nutrient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compost = null,
    Object? growthFormula = null,
    Object? manure = null,
  }) {
    return _then(_$NutrientImpl(
      compost: null == compost
          ? _value.compost
          : compost // ignore: cast_nullable_to_non_nullable
              as int,
      growthFormula: null == growthFormula
          ? _value.growthFormula
          : growthFormula // ignore: cast_nullable_to_non_nullable
              as int,
      manure: null == manure
          ? _value.manure
          : manure // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientImpl extends _Nutrient {
  const _$NutrientImpl(
      {required this.compost,
      required this.growthFormula,
      required this.manure})
      : super._();

  factory _$NutrientImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientImplFromJson(json);

  /// 퇴비
  @override
  final int compost;

  /// 성장 촉진제
  @override
  final int growthFormula;

  /// 거름
  @override
  final int manure;

  @override
  String toString() {
    return 'Nutrient(compost: $compost, growthFormula: $growthFormula, manure: $manure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientImpl &&
            (identical(other.compost, compost) || other.compost == compost) &&
            (identical(other.growthFormula, growthFormula) ||
                other.growthFormula == growthFormula) &&
            (identical(other.manure, manure) || other.manure == manure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, compost, growthFormula, manure);

  /// Create a copy of Nutrient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientImplCopyWith<_$NutrientImpl> get copyWith =>
      __$$NutrientImplCopyWithImpl<_$NutrientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientImplToJson(
      this,
    );
  }
}

abstract class _Nutrient extends Nutrient {
  const factory _Nutrient(
      {required final int compost,
      required final int growthFormula,
      required final int manure}) = _$NutrientImpl;
  const _Nutrient._() : super._();

  factory _Nutrient.fromJson(Map<String, dynamic> json) =
      _$NutrientImpl.fromJson;

  /// 퇴비
  @override
  int get compost;

  /// 성장 촉진제
  @override
  int get growthFormula;

  /// 거름
  @override
  int get manure;

  /// Create a copy of Nutrient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientImplCopyWith<_$NutrientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
