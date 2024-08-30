// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodValue _$FoodValueFromJson(Map<String, dynamic> json) {
  return _FoodValue.fromJson(json);
}

/// @nodoc
mixin _$FoodValue {
  FoodValueCategory get category => throw _privateConstructorUsedError;
  double get quantifiedValue => throw _privateConstructorUsedError;

  /// Serializes this FoodValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodValueCopyWith<FoodValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodValueCopyWith<$Res> {
  factory $FoodValueCopyWith(FoodValue value, $Res Function(FoodValue) then) =
      _$FoodValueCopyWithImpl<$Res, FoodValue>;
  @useResult
  $Res call({FoodValueCategory category, double quantifiedValue});
}

/// @nodoc
class _$FoodValueCopyWithImpl<$Res, $Val extends FoodValue>
    implements $FoodValueCopyWith<$Res> {
  _$FoodValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? quantifiedValue = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodValueCategory,
      quantifiedValue: null == quantifiedValue
          ? _value.quantifiedValue
          : quantifiedValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodValueImplCopyWith<$Res>
    implements $FoodValueCopyWith<$Res> {
  factory _$$FoodValueImplCopyWith(
          _$FoodValueImpl value, $Res Function(_$FoodValueImpl) then) =
      __$$FoodValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodValueCategory category, double quantifiedValue});
}

/// @nodoc
class __$$FoodValueImplCopyWithImpl<$Res>
    extends _$FoodValueCopyWithImpl<$Res, _$FoodValueImpl>
    implements _$$FoodValueImplCopyWith<$Res> {
  __$$FoodValueImplCopyWithImpl(
      _$FoodValueImpl _value, $Res Function(_$FoodValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? quantifiedValue = null,
  }) {
    return _then(_$FoodValueImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FoodValueCategory,
      quantifiedValue: null == quantifiedValue
          ? _value.quantifiedValue
          : quantifiedValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodValueImpl implements _FoodValue {
  const _$FoodValueImpl(
      {required this.category, required this.quantifiedValue});

  factory _$FoodValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodValueImplFromJson(json);

  @override
  final FoodValueCategory category;
  @override
  final double quantifiedValue;

  @override
  String toString() {
    return 'FoodValue(category: $category, quantifiedValue: $quantifiedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodValueImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantifiedValue, quantifiedValue) ||
                other.quantifiedValue == quantifiedValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, quantifiedValue);

  /// Create a copy of FoodValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodValueImplCopyWith<_$FoodValueImpl> get copyWith =>
      __$$FoodValueImplCopyWithImpl<_$FoodValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodValueImplToJson(
      this,
    );
  }
}

abstract class _FoodValue implements FoodValue {
  const factory _FoodValue(
      {required final FoodValueCategory category,
      required final double quantifiedValue}) = _$FoodValueImpl;

  factory _FoodValue.fromJson(Map<String, dynamic> json) =
      _$FoodValueImpl.fromJson;

  @override
  FoodValueCategory get category;
  @override
  double get quantifiedValue;

  /// Create a copy of FoodValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodValueImplCopyWith<_$FoodValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FoodValues _$FoodValuesFromJson(Map<String, dynamic> json) {
  return _FoodValues.fromJson(json);
}

/// @nodoc
mixin _$FoodValues {
  Set<FoodValue> get rawValues => throw _privateConstructorUsedError;

  /// Serializes this FoodValues to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodValuesCopyWith<FoodValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodValuesCopyWith<$Res> {
  factory $FoodValuesCopyWith(
          FoodValues value, $Res Function(FoodValues) then) =
      _$FoodValuesCopyWithImpl<$Res, FoodValues>;
  @useResult
  $Res call({Set<FoodValue> rawValues});
}

/// @nodoc
class _$FoodValuesCopyWithImpl<$Res, $Val extends FoodValues>
    implements $FoodValuesCopyWith<$Res> {
  _$FoodValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawValues = null,
  }) {
    return _then(_value.copyWith(
      rawValues: null == rawValues
          ? _value.rawValues
          : rawValues // ignore: cast_nullable_to_non_nullable
              as Set<FoodValue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodValuesImplCopyWith<$Res>
    implements $FoodValuesCopyWith<$Res> {
  factory _$$FoodValuesImplCopyWith(
          _$FoodValuesImpl value, $Res Function(_$FoodValuesImpl) then) =
      __$$FoodValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<FoodValue> rawValues});
}

/// @nodoc
class __$$FoodValuesImplCopyWithImpl<$Res>
    extends _$FoodValuesCopyWithImpl<$Res, _$FoodValuesImpl>
    implements _$$FoodValuesImplCopyWith<$Res> {
  __$$FoodValuesImplCopyWithImpl(
      _$FoodValuesImpl _value, $Res Function(_$FoodValuesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodValues
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawValues = null,
  }) {
    return _then(_$FoodValuesImpl(
      null == rawValues
          ? _value._rawValues
          : rawValues // ignore: cast_nullable_to_non_nullable
              as Set<FoodValue>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodValuesImpl extends _FoodValues {
  const _$FoodValuesImpl(final Set<FoodValue> rawValues)
      : _rawValues = rawValues,
        super._();

  factory _$FoodValuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodValuesImplFromJson(json);

  final Set<FoodValue> _rawValues;
  @override
  Set<FoodValue> get rawValues {
    if (_rawValues is EqualUnmodifiableSetView) return _rawValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_rawValues);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodValuesImpl &&
            const DeepCollectionEquality()
                .equals(other._rawValues, _rawValues));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rawValues));

  /// Create a copy of FoodValues
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodValuesImplCopyWith<_$FoodValuesImpl> get copyWith =>
      __$$FoodValuesImplCopyWithImpl<_$FoodValuesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodValuesImplToJson(
      this,
    );
  }
}

abstract class _FoodValues extends FoodValues {
  const factory _FoodValues(final Set<FoodValue> rawValues) = _$FoodValuesImpl;
  const _FoodValues._() : super._();

  factory _FoodValues.fromJson(Map<String, dynamic> json) =
      _$FoodValuesImpl.fromJson;

  @override
  Set<FoodValue> get rawValues;

  /// Create a copy of FoodValues
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodValuesImplCopyWith<_$FoodValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
