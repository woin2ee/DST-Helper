// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Food {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodType get type => throw _privateConstructorUsedError;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call({String code, String assetName, FoodType type});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodImplCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$FoodImplCopyWith(
          _$FoodImpl value, $Res Function(_$FoodImpl) then) =
      __$$FoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String assetName, FoodType type});
}

/// @nodoc
class __$$FoodImplCopyWithImpl<$Res>
    extends _$FoodCopyWithImpl<$Res, _$FoodImpl>
    implements _$$FoodImplCopyWith<$Res> {
  __$$FoodImplCopyWithImpl(_$FoodImpl _value, $Res Function(_$FoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
  }) {
    return _then(_$FoodImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
    ));
  }
}

/// @nodoc

class _$FoodImpl implements _Food {
  const _$FoodImpl(
      {required this.code, required this.assetName, required this.type});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodType type;

  @override
  String toString() {
    return 'Food(code: $code, assetName: $assetName, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName, type);

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      __$$FoodImplCopyWithImpl<_$FoodImpl>(this, _$identity);
}

abstract class _Food implements Food {
  const factory _Food(
      {required final String code,
      required final String assetName,
      required final FoodType type}) = _$FoodImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodType get type;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CookableFood {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodType get type => throw _privateConstructorUsedError;
  String get cookedAssetName => throw _privateConstructorUsedError;
  String? get compositeAssetName => throw _privateConstructorUsedError;

  /// Create a copy of CookableFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CookableFoodCopyWith<CookableFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookableFoodCopyWith<$Res> {
  factory $CookableFoodCopyWith(
          CookableFood value, $Res Function(CookableFood) then) =
      _$CookableFoodCopyWithImpl<$Res, CookableFood>;
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodType type,
      String cookedAssetName,
      String? compositeAssetName});
}

/// @nodoc
class _$CookableFoodCopyWithImpl<$Res, $Val extends CookableFood>
    implements $CookableFoodCopyWith<$Res> {
  _$CookableFoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CookableFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? cookedAssetName = null,
    Object? compositeAssetName = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      cookedAssetName: null == cookedAssetName
          ? _value.cookedAssetName
          : cookedAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      compositeAssetName: freezed == compositeAssetName
          ? _value.compositeAssetName
          : compositeAssetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CookableFoodImplCopyWith<$Res>
    implements $CookableFoodCopyWith<$Res> {
  factory _$$CookableFoodImplCopyWith(
          _$CookableFoodImpl value, $Res Function(_$CookableFoodImpl) then) =
      __$$CookableFoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodType type,
      String cookedAssetName,
      String? compositeAssetName});
}

/// @nodoc
class __$$CookableFoodImplCopyWithImpl<$Res>
    extends _$CookableFoodCopyWithImpl<$Res, _$CookableFoodImpl>
    implements _$$CookableFoodImplCopyWith<$Res> {
  __$$CookableFoodImplCopyWithImpl(
      _$CookableFoodImpl _value, $Res Function(_$CookableFoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of CookableFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? cookedAssetName = null,
    Object? compositeAssetName = freezed,
  }) {
    return _then(_$CookableFoodImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      cookedAssetName: null == cookedAssetName
          ? _value.cookedAssetName
          : cookedAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      compositeAssetName: freezed == compositeAssetName
          ? _value.compositeAssetName
          : compositeAssetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CookableFoodImpl implements _CookableFood {
  const _$CookableFoodImpl(
      {required this.code,
      required this.assetName,
      required this.type,
      required this.cookedAssetName,
      required this.compositeAssetName});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodType type;
  @override
  final String cookedAssetName;
  @override
  final String? compositeAssetName;

  @override
  String toString() {
    return 'CookableFood(code: $code, assetName: $assetName, type: $type, cookedAssetName: $cookedAssetName, compositeAssetName: $compositeAssetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookableFoodImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cookedAssetName, cookedAssetName) ||
                other.cookedAssetName == cookedAssetName) &&
            (identical(other.compositeAssetName, compositeAssetName) ||
                other.compositeAssetName == compositeAssetName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, assetName, type, cookedAssetName, compositeAssetName);

  /// Create a copy of CookableFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CookableFoodImplCopyWith<_$CookableFoodImpl> get copyWith =>
      __$$CookableFoodImplCopyWithImpl<_$CookableFoodImpl>(this, _$identity);
}

abstract class _CookableFood implements CookableFood {
  const factory _CookableFood(
      {required final String code,
      required final String assetName,
      required final FoodType type,
      required final String cookedAssetName,
      required final String? compositeAssetName}) = _$CookableFoodImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodType get type;
  @override
  String get cookedAssetName;
  @override
  String? get compositeAssetName;

  /// Create a copy of CookableFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CookableFoodImplCopyWith<_$CookableFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Ingredient {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodValues? get foodValues => throw _privateConstructorUsedError;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call({String code, String assetName, FoodValues? foodValues});

  $FoodValuesCopyWith<$Res>? get foodValues;
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? foodValues = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
    ) as $Val);
  }

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodValuesCopyWith<$Res>? get foodValues {
    if (_value.foodValues == null) {
      return null;
    }

    return $FoodValuesCopyWith<$Res>(_value.foodValues!, (value) {
      return _then(_value.copyWith(foodValues: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IngredientImplCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$IngredientImplCopyWith(
          _$IngredientImpl value, $Res Function(_$IngredientImpl) then) =
      __$$IngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String assetName, FoodValues? foodValues});

  @override
  $FoodValuesCopyWith<$Res>? get foodValues;
}

/// @nodoc
class __$$IngredientImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientImpl>
    implements _$$IngredientImplCopyWith<$Res> {
  __$$IngredientImplCopyWithImpl(
      _$IngredientImpl _value, $Res Function(_$IngredientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? foodValues = freezed,
  }) {
    return _then(_$IngredientImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
    ));
  }
}

/// @nodoc

class _$IngredientImpl implements _Ingredient {
  const _$IngredientImpl(
      {required this.code, required this.assetName, required this.foodValues});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodValues? foodValues;

  @override
  String toString() {
    return 'Ingredient(code: $code, assetName: $assetName, foodValues: $foodValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            const DeepCollectionEquality()
                .equals(other.foodValues, foodValues));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName,
      const DeepCollectionEquality().hash(foodValues));

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      __$$IngredientImplCopyWithImpl<_$IngredientImpl>(this, _$identity);
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient(
      {required final String code,
      required final String assetName,
      required final FoodValues? foodValues}) = _$IngredientImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodValues? get foodValues;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EdibleIngredient {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodType get type => throw _privateConstructorUsedError;
  FoodValues? get foodValues => throw _privateConstructorUsedError;

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EdibleIngredientCopyWith<EdibleIngredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EdibleIngredientCopyWith<$Res> {
  factory $EdibleIngredientCopyWith(
          EdibleIngredient value, $Res Function(EdibleIngredient) then) =
      _$EdibleIngredientCopyWithImpl<$Res, EdibleIngredient>;
  @useResult
  $Res call(
      {String code, String assetName, FoodType type, FoodValues? foodValues});

  $FoodValuesCopyWith<$Res>? get foodValues;
}

/// @nodoc
class _$EdibleIngredientCopyWithImpl<$Res, $Val extends EdibleIngredient>
    implements $EdibleIngredientCopyWith<$Res> {
  _$EdibleIngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? foodValues = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
    ) as $Val);
  }

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodValuesCopyWith<$Res>? get foodValues {
    if (_value.foodValues == null) {
      return null;
    }

    return $FoodValuesCopyWith<$Res>(_value.foodValues!, (value) {
      return _then(_value.copyWith(foodValues: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EdibleIngredientImplCopyWith<$Res>
    implements $EdibleIngredientCopyWith<$Res> {
  factory _$$EdibleIngredientImplCopyWith(_$EdibleIngredientImpl value,
          $Res Function(_$EdibleIngredientImpl) then) =
      __$$EdibleIngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String assetName, FoodType type, FoodValues? foodValues});

  @override
  $FoodValuesCopyWith<$Res>? get foodValues;
}

/// @nodoc
class __$$EdibleIngredientImplCopyWithImpl<$Res>
    extends _$EdibleIngredientCopyWithImpl<$Res, _$EdibleIngredientImpl>
    implements _$$EdibleIngredientImplCopyWith<$Res> {
  __$$EdibleIngredientImplCopyWithImpl(_$EdibleIngredientImpl _value,
      $Res Function(_$EdibleIngredientImpl) _then)
      : super(_value, _then);

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? foodValues = freezed,
  }) {
    return _then(_$EdibleIngredientImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
    ));
  }
}

/// @nodoc

class _$EdibleIngredientImpl implements _EdibleIngredient {
  const _$EdibleIngredientImpl(
      {required this.code,
      required this.assetName,
      required this.type,
      required this.foodValues});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodType type;
  @override
  final FoodValues? foodValues;

  @override
  String toString() {
    return 'EdibleIngredient(code: $code, assetName: $assetName, type: $type, foodValues: $foodValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdibleIngredientImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.foodValues, foodValues));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName, type,
      const DeepCollectionEquality().hash(foodValues));

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdibleIngredientImplCopyWith<_$EdibleIngredientImpl> get copyWith =>
      __$$EdibleIngredientImplCopyWithImpl<_$EdibleIngredientImpl>(
          this, _$identity);
}

abstract class _EdibleIngredient implements EdibleIngredient {
  const factory _EdibleIngredient(
      {required final String code,
      required final String assetName,
      required final FoodType type,
      required final FoodValues? foodValues}) = _$EdibleIngredientImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodType get type;
  @override
  FoodValues? get foodValues;

  /// Create a copy of EdibleIngredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdibleIngredientImplCopyWith<_$EdibleIngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Plant {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  Set<Season> get seasons => throw _privateConstructorUsedError;
  Nutrient get nutrient => throw _privateConstructorUsedError;

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantCopyWith<Plant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCopyWith<$Res> {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) then) =
      _$PlantCopyWithImpl<$Res, Plant>;
  @useResult
  $Res call(
      {String code, String assetName, Set<Season> seasons, Nutrient nutrient});

  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class _$PlantCopyWithImpl<$Res, $Val extends Plant>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? seasons = null,
    Object? nutrient = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
    ) as $Val);
  }

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientCopyWith<$Res> get nutrient {
    return $NutrientCopyWith<$Res>(_value.nutrient, (value) {
      return _then(_value.copyWith(nutrient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlantImplCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$$PlantImplCopyWith(
          _$PlantImpl value, $Res Function(_$PlantImpl) then) =
      __$$PlantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String assetName, Set<Season> seasons, Nutrient nutrient});

  @override
  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class __$$PlantImplCopyWithImpl<$Res>
    extends _$PlantCopyWithImpl<$Res, _$PlantImpl>
    implements _$$PlantImplCopyWith<$Res> {
  __$$PlantImplCopyWithImpl(
      _$PlantImpl _value, $Res Function(_$PlantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? seasons = null,
    Object? nutrient = null,
  }) {
    return _then(_$PlantImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
    ));
  }
}

/// @nodoc

class _$PlantImpl implements _Plant {
  const _$PlantImpl(
      {required this.code,
      required this.assetName,
      required final Set<Season> seasons,
      required this.nutrient})
      : _seasons = seasons;

  @override
  final String code;
  @override
  final String assetName;
  final Set<Season> _seasons;
  @override
  Set<Season> get seasons {
    if (_seasons is EqualUnmodifiableSetView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_seasons);
  }

  @override
  final Nutrient nutrient;

  @override
  String toString() {
    return 'Plant(code: $code, assetName: $assetName, seasons: $seasons, nutrient: $nutrient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName,
      const DeepCollectionEquality().hash(_seasons), nutrient);

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantImplCopyWith<_$PlantImpl> get copyWith =>
      __$$PlantImplCopyWithImpl<_$PlantImpl>(this, _$identity);
}

abstract class _Plant implements Plant {
  const factory _Plant(
      {required final String code,
      required final String assetName,
      required final Set<Season> seasons,
      required final Nutrient nutrient}) = _$PlantImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  Set<Season> get seasons;
  @override
  Nutrient get nutrient;

  /// Create a copy of Plant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantImplCopyWith<_$PlantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Seed _$SeedFromJson(Map<String, dynamic> json) {
  return _Seed.fromJson(json);
}

/// @nodoc
mixin _$Seed {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodType get type => throw _privateConstructorUsedError;
  String get cookedAssetName => throw _privateConstructorUsedError;
  String? get compositeAssetName => throw _privateConstructorUsedError;

  /// Serializes this Seed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Seed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeedCopyWith<Seed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeedCopyWith<$Res> {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) then) =
      _$SeedCopyWithImpl<$Res, Seed>;
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodType type,
      String cookedAssetName,
      String? compositeAssetName});
}

/// @nodoc
class _$SeedCopyWithImpl<$Res, $Val extends Seed>
    implements $SeedCopyWith<$Res> {
  _$SeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Seed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? cookedAssetName = null,
    Object? compositeAssetName = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      cookedAssetName: null == cookedAssetName
          ? _value.cookedAssetName
          : cookedAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      compositeAssetName: freezed == compositeAssetName
          ? _value.compositeAssetName
          : compositeAssetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeedImplCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$$SeedImplCopyWith(
          _$SeedImpl value, $Res Function(_$SeedImpl) then) =
      __$$SeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodType type,
      String cookedAssetName,
      String? compositeAssetName});
}

/// @nodoc
class __$$SeedImplCopyWithImpl<$Res>
    extends _$SeedCopyWithImpl<$Res, _$SeedImpl>
    implements _$$SeedImplCopyWith<$Res> {
  __$$SeedImplCopyWithImpl(_$SeedImpl _value, $Res Function(_$SeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Seed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? type = null,
    Object? cookedAssetName = null,
    Object? compositeAssetName = freezed,
  }) {
    return _then(_$SeedImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      cookedAssetName: null == cookedAssetName
          ? _value.cookedAssetName
          : cookedAssetName // ignore: cast_nullable_to_non_nullable
              as String,
      compositeAssetName: freezed == compositeAssetName
          ? _value.compositeAssetName
          : compositeAssetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeedImpl implements _Seed {
  const _$SeedImpl(
      {required this.code,
      required this.assetName,
      required this.type,
      required this.cookedAssetName,
      required this.compositeAssetName});

  factory _$SeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeedImplFromJson(json);

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodType type;
  @override
  final String cookedAssetName;
  @override
  final String? compositeAssetName;

  @override
  String toString() {
    return 'Seed(code: $code, assetName: $assetName, type: $type, cookedAssetName: $cookedAssetName, compositeAssetName: $compositeAssetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeedImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.cookedAssetName, cookedAssetName) ||
                other.cookedAssetName == cookedAssetName) &&
            (identical(other.compositeAssetName, compositeAssetName) ||
                other.compositeAssetName == compositeAssetName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, assetName, type, cookedAssetName, compositeAssetName);

  /// Create a copy of Seed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeedImplCopyWith<_$SeedImpl> get copyWith =>
      __$$SeedImplCopyWithImpl<_$SeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeedImplToJson(
      this,
    );
  }
}

abstract class _Seed implements Seed {
  const factory _Seed(
      {required final String code,
      required final String assetName,
      required final FoodType type,
      required final String cookedAssetName,
      required final String? compositeAssetName}) = _$SeedImpl;

  factory _Seed.fromJson(Map<String, dynamic> json) = _$SeedImpl.fromJson;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodType get type;
  @override
  String get cookedAssetName;
  @override
  String? get compositeAssetName;

  /// Create a copy of Seed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeedImplCopyWith<_$SeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Crop _$CropFromJson(Map<String, dynamic> json) {
  return _Crop.fromJson(json);
}

/// @nodoc
mixin _$Crop {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  FoodValues? get foodValues => throw _privateConstructorUsedError;
  Nutrient get nutrient => throw _privateConstructorUsedError;
  Set<Season> get seasons => throw _privateConstructorUsedError;
  FoodType get type => throw _privateConstructorUsedError;
  Seed get seed => throw _privateConstructorUsedError;

  /// Serializes this Crop to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CropCopyWith<Crop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CropCopyWith<$Res> {
  factory $CropCopyWith(Crop value, $Res Function(Crop) then) =
      _$CropCopyWithImpl<$Res, Crop>;
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodValues? foodValues,
      Nutrient nutrient,
      Set<Season> seasons,
      FoodType type,
      Seed seed});

  $FoodValuesCopyWith<$Res>? get foodValues;
  $NutrientCopyWith<$Res> get nutrient;
  $SeedCopyWith<$Res> get seed;
}

/// @nodoc
class _$CropCopyWithImpl<$Res, $Val extends Crop>
    implements $CropCopyWith<$Res> {
  _$CropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? foodValues = freezed,
    Object? nutrient = null,
    Object? seasons = null,
    Object? type = null,
    Object? seed = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Seed,
    ) as $Val);
  }

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodValuesCopyWith<$Res>? get foodValues {
    if (_value.foodValues == null) {
      return null;
    }

    return $FoodValuesCopyWith<$Res>(_value.foodValues!, (value) {
      return _then(_value.copyWith(foodValues: value) as $Val);
    });
  }

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientCopyWith<$Res> get nutrient {
    return $NutrientCopyWith<$Res>(_value.nutrient, (value) {
      return _then(_value.copyWith(nutrient: value) as $Val);
    });
  }

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeedCopyWith<$Res> get seed {
    return $SeedCopyWith<$Res>(_value.seed, (value) {
      return _then(_value.copyWith(seed: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CropImplCopyWith<$Res> implements $CropCopyWith<$Res> {
  factory _$$CropImplCopyWith(
          _$CropImpl value, $Res Function(_$CropImpl) then) =
      __$$CropImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      FoodValues? foodValues,
      Nutrient nutrient,
      Set<Season> seasons,
      FoodType type,
      Seed seed});

  @override
  $FoodValuesCopyWith<$Res>? get foodValues;
  @override
  $NutrientCopyWith<$Res> get nutrient;
  @override
  $SeedCopyWith<$Res> get seed;
}

/// @nodoc
class __$$CropImplCopyWithImpl<$Res>
    extends _$CropCopyWithImpl<$Res, _$CropImpl>
    implements _$$CropImplCopyWith<$Res> {
  __$$CropImplCopyWithImpl(_$CropImpl _value, $Res Function(_$CropImpl) _then)
      : super(_value, _then);

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? foodValues = freezed,
    Object? nutrient = null,
    Object? seasons = null,
    Object? type = null,
    Object? seed = null,
  }) {
    return _then(_$CropImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
      seed: null == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Seed,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CropImpl implements _Crop {
  const _$CropImpl(
      {required this.code,
      required this.assetName,
      required this.foodValues,
      required this.nutrient,
      required final Set<Season> seasons,
      required this.type,
      required this.seed})
      : _seasons = seasons;

  factory _$CropImpl.fromJson(Map<String, dynamic> json) =>
      _$$CropImplFromJson(json);

  @override
  final String code;
  @override
  final String assetName;
  @override
  final FoodValues? foodValues;
  @override
  final Nutrient nutrient;
  final Set<Season> _seasons;
  @override
  Set<Season> get seasons {
    if (_seasons is EqualUnmodifiableSetView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_seasons);
  }

  @override
  final FoodType type;
  @override
  final Seed seed;

  @override
  String toString() {
    return 'Crop(code: $code, assetName: $assetName, foodValues: $foodValues, nutrient: $nutrient, seasons: $seasons, type: $type, seed: $seed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CropImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            const DeepCollectionEquality()
                .equals(other.foodValues, foodValues) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.seed, seed) || other.seed == seed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      assetName,
      const DeepCollectionEquality().hash(foodValues),
      nutrient,
      const DeepCollectionEquality().hash(_seasons),
      type,
      seed);

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CropImplCopyWith<_$CropImpl> get copyWith =>
      __$$CropImplCopyWithImpl<_$CropImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CropImplToJson(
      this,
    );
  }
}

abstract class _Crop implements Crop {
  const factory _Crop(
      {required final String code,
      required final String assetName,
      required final FoodValues? foodValues,
      required final Nutrient nutrient,
      required final Set<Season> seasons,
      required final FoodType type,
      required final Seed seed}) = _$CropImpl;

  factory _Crop.fromJson(Map<String, dynamic> json) = _$CropImpl.fromJson;

  @override
  String get code;
  @override
  String get assetName;
  @override
  FoodValues? get foodValues;
  @override
  Nutrient get nutrient;
  @override
  Set<Season> get seasons;
  @override
  FoodType get type;
  @override
  Seed get seed;

  /// Create a copy of Crop
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CropImplCopyWith<_$CropImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Weed {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  Nutrient get nutrient => throw _privateConstructorUsedError;
  Set<Season> get seasons => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        $default, {
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)
        forgetMeLots,
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        fireNettleFronds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Weed value) $default, {
    required TResult Function(ForgetMeLots value) forgetMeLots,
    required TResult Function(FireNettleFronds value) fireNettleFronds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Weed value)? $default, {
    TResult? Function(ForgetMeLots value)? forgetMeLots,
    TResult? Function(FireNettleFronds value)? fireNettleFronds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Weed value)? $default, {
    TResult Function(ForgetMeLots value)? forgetMeLots,
    TResult Function(FireNettleFronds value)? fireNettleFronds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeedCopyWith<Weed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeedCopyWith<$Res> {
  factory $WeedCopyWith(Weed value, $Res Function(Weed) then) =
      _$WeedCopyWithImpl<$Res, Weed>;
  @useResult
  $Res call(
      {String code, String assetName, Nutrient nutrient, Set<Season> seasons});

  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class _$WeedCopyWithImpl<$Res, $Val extends Weed>
    implements $WeedCopyWith<$Res> {
  _$WeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
    Object? seasons = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
    ) as $Val);
  }

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientCopyWith<$Res> get nutrient {
    return $NutrientCopyWith<$Res>(_value.nutrient, (value) {
      return _then(_value.copyWith(nutrient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeedImplCopyWith<$Res> implements $WeedCopyWith<$Res> {
  factory _$$WeedImplCopyWith(
          _$WeedImpl value, $Res Function(_$WeedImpl) then) =
      __$$WeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String assetName, Nutrient nutrient, Set<Season> seasons});

  @override
  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class __$$WeedImplCopyWithImpl<$Res>
    extends _$WeedCopyWithImpl<$Res, _$WeedImpl>
    implements _$$WeedImplCopyWith<$Res> {
  __$$WeedImplCopyWithImpl(_$WeedImpl _value, $Res Function(_$WeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
    Object? seasons = null,
  }) {
    return _then(_$WeedImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
    ));
  }
}

/// @nodoc

class _$WeedImpl implements _Weed {
  const _$WeedImpl(
      {required this.code,
      required this.assetName,
      required this.nutrient,
      required final Set<Season> seasons})
      : _seasons = seasons;

  @override
  final String code;
  @override
  final String assetName;
  @override
  final Nutrient nutrient;
  final Set<Season> _seasons;
  @override
  Set<Season> get seasons {
    if (_seasons is EqualUnmodifiableSetView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_seasons);
  }

  @override
  String toString() {
    return 'Weed(code: $code, assetName: $assetName, nutrient: $nutrient, seasons: $seasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeedImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName, nutrient,
      const DeepCollectionEquality().hash(_seasons));

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeedImplCopyWith<_$WeedImpl> get copyWith =>
      __$$WeedImplCopyWithImpl<_$WeedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        $default, {
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)
        forgetMeLots,
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        fireNettleFronds,
  }) {
    return $default(code, assetName, nutrient, seasons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
  }) {
    return $default?.call(code, assetName, nutrient, seasons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(code, assetName, nutrient, seasons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Weed value) $default, {
    required TResult Function(ForgetMeLots value) forgetMeLots,
    required TResult Function(FireNettleFronds value) fireNettleFronds,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Weed value)? $default, {
    TResult? Function(ForgetMeLots value)? forgetMeLots,
    TResult? Function(FireNettleFronds value)? fireNettleFronds,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Weed value)? $default, {
    TResult Function(ForgetMeLots value)? forgetMeLots,
    TResult Function(FireNettleFronds value)? fireNettleFronds,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Weed implements Weed {
  const factory _Weed(
      {required final String code,
      required final String assetName,
      required final Nutrient nutrient,
      required final Set<Season> seasons}) = _$WeedImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  Nutrient get nutrient;
  @override
  Set<Season> get seasons;

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeedImplCopyWith<_$WeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgetMeLotsImplCopyWith<$Res>
    implements $WeedCopyWith<$Res> {
  factory _$$ForgetMeLotsImplCopyWith(
          _$ForgetMeLotsImpl value, $Res Function(_$ForgetMeLotsImpl) then) =
      __$$ForgetMeLotsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      Nutrient nutrient,
      Set<Season> seasons,
      FoodValues? foodValues});

  @override
  $NutrientCopyWith<$Res> get nutrient;
  $FoodValuesCopyWith<$Res>? get foodValues;
}

/// @nodoc
class __$$ForgetMeLotsImplCopyWithImpl<$Res>
    extends _$WeedCopyWithImpl<$Res, _$ForgetMeLotsImpl>
    implements _$$ForgetMeLotsImplCopyWith<$Res> {
  __$$ForgetMeLotsImplCopyWithImpl(
      _$ForgetMeLotsImpl _value, $Res Function(_$ForgetMeLotsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
    Object? seasons = null,
    Object? foodValues = freezed,
  }) {
    return _then(_$ForgetMeLotsImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
      foodValues: freezed == foodValues
          ? _value.foodValues
          : foodValues // ignore: cast_nullable_to_non_nullable
              as FoodValues?,
    ));
  }

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodValuesCopyWith<$Res>? get foodValues {
    if (_value.foodValues == null) {
      return null;
    }

    return $FoodValuesCopyWith<$Res>(_value.foodValues!, (value) {
      return _then(_value.copyWith(foodValues: value));
    });
  }
}

/// @nodoc

class _$ForgetMeLotsImpl with UsingInCrockPot implements ForgetMeLots {
  const _$ForgetMeLotsImpl(
      {required this.code,
      required this.assetName,
      required this.nutrient,
      required final Set<Season> seasons,
      required this.foodValues})
      : _seasons = seasons;

  @override
  final String code;
  @override
  final String assetName;
  @override
  final Nutrient nutrient;
  final Set<Season> _seasons;
  @override
  Set<Season> get seasons {
    if (_seasons is EqualUnmodifiableSetView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_seasons);
  }

  @override
  final FoodValues? foodValues;

  @override
  String toString() {
    return 'Weed.forgetMeLots(code: $code, assetName: $assetName, nutrient: $nutrient, seasons: $seasons, foodValues: $foodValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetMeLotsImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            const DeepCollectionEquality()
                .equals(other.foodValues, foodValues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      assetName,
      nutrient,
      const DeepCollectionEquality().hash(_seasons),
      const DeepCollectionEquality().hash(foodValues));

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetMeLotsImplCopyWith<_$ForgetMeLotsImpl> get copyWith =>
      __$$ForgetMeLotsImplCopyWithImpl<_$ForgetMeLotsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        $default, {
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)
        forgetMeLots,
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        fireNettleFronds,
  }) {
    return forgetMeLots(code, assetName, nutrient, seasons, foodValues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
  }) {
    return forgetMeLots?.call(code, assetName, nutrient, seasons, foodValues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
    required TResult orElse(),
  }) {
    if (forgetMeLots != null) {
      return forgetMeLots(code, assetName, nutrient, seasons, foodValues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Weed value) $default, {
    required TResult Function(ForgetMeLots value) forgetMeLots,
    required TResult Function(FireNettleFronds value) fireNettleFronds,
  }) {
    return forgetMeLots(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Weed value)? $default, {
    TResult? Function(ForgetMeLots value)? forgetMeLots,
    TResult? Function(FireNettleFronds value)? fireNettleFronds,
  }) {
    return forgetMeLots?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Weed value)? $default, {
    TResult Function(ForgetMeLots value)? forgetMeLots,
    TResult Function(FireNettleFronds value)? fireNettleFronds,
    required TResult orElse(),
  }) {
    if (forgetMeLots != null) {
      return forgetMeLots(this);
    }
    return orElse();
  }
}

abstract class ForgetMeLots implements Weed, UsingInCrockPot {
  const factory ForgetMeLots(
      {required final String code,
      required final String assetName,
      required final Nutrient nutrient,
      required final Set<Season> seasons,
      required final FoodValues? foodValues}) = _$ForgetMeLotsImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  Nutrient get nutrient;
  @override
  Set<Season> get seasons;
  FoodValues? get foodValues;

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgetMeLotsImplCopyWith<_$ForgetMeLotsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FireNettleFrondsImplCopyWith<$Res>
    implements $WeedCopyWith<$Res> {
  factory _$$FireNettleFrondsImplCopyWith(_$FireNettleFrondsImpl value,
          $Res Function(_$FireNettleFrondsImpl) then) =
      __$$FireNettleFrondsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code, String assetName, Nutrient nutrient, Set<Season> seasons});

  @override
  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class __$$FireNettleFrondsImplCopyWithImpl<$Res>
    extends _$WeedCopyWithImpl<$Res, _$FireNettleFrondsImpl>
    implements _$$FireNettleFrondsImplCopyWith<$Res> {
  __$$FireNettleFrondsImplCopyWithImpl(_$FireNettleFrondsImpl _value,
      $Res Function(_$FireNettleFrondsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
    Object? seasons = null,
  }) {
    return _then(_$FireNettleFrondsImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      seasons: null == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as Set<Season>,
    ));
  }
}

/// @nodoc

class _$FireNettleFrondsImpl implements FireNettleFronds {
  const _$FireNettleFrondsImpl(
      {required this.code,
      required this.assetName,
      required this.nutrient,
      required final Set<Season> seasons})
      : _seasons = seasons;

  @override
  final String code;
  @override
  final String assetName;
  @override
  final Nutrient nutrient;
  final Set<Season> _seasons;
  @override
  Set<Season> get seasons {
    if (_seasons is EqualUnmodifiableSetView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_seasons);
  }

  @override
  String toString() {
    return 'Weed.fireNettleFronds(code: $code, assetName: $assetName, nutrient: $nutrient, seasons: $seasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FireNettleFrondsImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName, nutrient,
      const DeepCollectionEquality().hash(_seasons));

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FireNettleFrondsImplCopyWith<_$FireNettleFrondsImpl> get copyWith =>
      __$$FireNettleFrondsImplCopyWithImpl<_$FireNettleFrondsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        $default, {
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)
        forgetMeLots,
    required TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)
        fireNettleFronds,
  }) {
    return fireNettleFronds(code, assetName, nutrient, seasons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult? Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
  }) {
    return fireNettleFronds?.call(code, assetName, nutrient, seasons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        $default, {
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons, FoodValues? foodValues)?
        forgetMeLots,
    TResult Function(String code, String assetName, Nutrient nutrient,
            Set<Season> seasons)?
        fireNettleFronds,
    required TResult orElse(),
  }) {
    if (fireNettleFronds != null) {
      return fireNettleFronds(code, assetName, nutrient, seasons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Weed value) $default, {
    required TResult Function(ForgetMeLots value) forgetMeLots,
    required TResult Function(FireNettleFronds value) fireNettleFronds,
  }) {
    return fireNettleFronds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Weed value)? $default, {
    TResult? Function(ForgetMeLots value)? forgetMeLots,
    TResult? Function(FireNettleFronds value)? fireNettleFronds,
  }) {
    return fireNettleFronds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Weed value)? $default, {
    TResult Function(ForgetMeLots value)? forgetMeLots,
    TResult Function(FireNettleFronds value)? fireNettleFronds,
    required TResult orElse(),
  }) {
    if (fireNettleFronds != null) {
      return fireNettleFronds(this);
    }
    return orElse();
  }
}

abstract class FireNettleFronds implements Weed {
  const factory FireNettleFronds(
      {required final String code,
      required final String assetName,
      required final Nutrient nutrient,
      required final Set<Season> seasons}) = _$FireNettleFrondsImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  Nutrient get nutrient;
  @override
  Set<Season> get seasons;

  /// Create a copy of Weed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FireNettleFrondsImplCopyWith<_$FireNettleFrondsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Recipe {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  AndRequirements get requirements => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)
        $default, {
    required TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)
        edible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Recipe value) $default, {
    required TResult Function(EdibleRecipe value) edible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Recipe value)? $default, {
    TResult? Function(EdibleRecipe value)? edible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Recipe value)? $default, {
    TResult Function(EdibleRecipe value)? edible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String code,
      String assetName,
      int priority,
      AndRequirements requirements});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? priority = null,
    Object? requirements = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as AndRequirements,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      int priority,
      AndRequirements requirements});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? priority = null,
    Object? requirements = null,
  }) {
    return _then(_$RecipeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as AndRequirements,
    ));
  }
}

/// @nodoc

class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.code,
      required this.assetName,
      required this.priority,
      required this.requirements});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final int priority;
  @override
  final AndRequirements requirements;

  @override
  String toString() {
    return 'Recipe(code: $code, assetName: $assetName, priority: $priority, requirements: $requirements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, assetName, priority, requirements);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)
        $default, {
    required TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)
        edible,
  }) {
    return $default(code, assetName, priority, requirements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
  }) {
    return $default?.call(code, assetName, priority, requirements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(code, assetName, priority, requirements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Recipe value) $default, {
    required TResult Function(EdibleRecipe value) edible,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Recipe value)? $default, {
    TResult? Function(EdibleRecipe value)? edible,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Recipe value)? $default, {
    TResult Function(EdibleRecipe value)? edible,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String code,
      required final String assetName,
      required final int priority,
      required final AndRequirements requirements}) = _$RecipeImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  int get priority;
  @override
  AndRequirements get requirements;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EdibleRecipeImplCopyWith<$Res>
    implements $RecipeCopyWith<$Res> {
  factory _$$EdibleRecipeImplCopyWith(
          _$EdibleRecipeImpl value, $Res Function(_$EdibleRecipeImpl) then) =
      __$$EdibleRecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String assetName,
      int priority,
      AndRequirements requirements,
      FoodType type});
}

/// @nodoc
class __$$EdibleRecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$EdibleRecipeImpl>
    implements _$$EdibleRecipeImplCopyWith<$Res> {
  __$$EdibleRecipeImplCopyWithImpl(
      _$EdibleRecipeImpl _value, $Res Function(_$EdibleRecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? priority = null,
    Object? requirements = null,
    Object? type = null,
  }) {
    return _then(_$EdibleRecipeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      requirements: null == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as AndRequirements,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FoodType,
    ));
  }
}

/// @nodoc

class _$EdibleRecipeImpl with Edible implements EdibleRecipe {
  const _$EdibleRecipeImpl(
      {required this.code,
      required this.assetName,
      required this.priority,
      required this.requirements,
      required this.type});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final int priority;
  @override
  final AndRequirements requirements;
  @override
  final FoodType type;

  @override
  String toString() {
    return 'Recipe.edible(code: $code, assetName: $assetName, priority: $priority, requirements: $requirements, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdibleRecipeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, assetName, priority, requirements, type);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdibleRecipeImplCopyWith<_$EdibleRecipeImpl> get copyWith =>
      __$$EdibleRecipeImplCopyWithImpl<_$EdibleRecipeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)
        $default, {
    required TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)
        edible,
  }) {
    return edible(code, assetName, priority, requirements, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult? Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
  }) {
    return edible?.call(code, assetName, priority, requirements, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements)?
        $default, {
    TResult Function(String code, String assetName, int priority,
            AndRequirements requirements, FoodType type)?
        edible,
    required TResult orElse(),
  }) {
    if (edible != null) {
      return edible(code, assetName, priority, requirements, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Recipe value) $default, {
    required TResult Function(EdibleRecipe value) edible,
  }) {
    return edible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Recipe value)? $default, {
    TResult? Function(EdibleRecipe value)? edible,
  }) {
    return edible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Recipe value)? $default, {
    TResult Function(EdibleRecipe value)? edible,
    required TResult orElse(),
  }) {
    if (edible != null) {
      return edible(this);
    }
    return orElse();
  }
}

abstract class EdibleRecipe implements Recipe, Edible {
  const factory EdibleRecipe(
      {required final String code,
      required final String assetName,
      required final int priority,
      required final AndRequirements requirements,
      required final FoodType type}) = _$EdibleRecipeImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  int get priority;
  @override
  AndRequirements get requirements;
  FoodType get type;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdibleRecipeImplCopyWith<_$EdibleRecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Fertilizer {
  String get code => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  Nutrient get nutrient => throw _privateConstructorUsedError;

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FertilizerCopyWith<Fertilizer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FertilizerCopyWith<$Res> {
  factory $FertilizerCopyWith(
          Fertilizer value, $Res Function(Fertilizer) then) =
      _$FertilizerCopyWithImpl<$Res, Fertilizer>;
  @useResult
  $Res call({String code, String assetName, Nutrient nutrient});

  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class _$FertilizerCopyWithImpl<$Res, $Val extends Fertilizer>
    implements $FertilizerCopyWith<$Res> {
  _$FertilizerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
    ) as $Val);
  }

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutrientCopyWith<$Res> get nutrient {
    return $NutrientCopyWith<$Res>(_value.nutrient, (value) {
      return _then(_value.copyWith(nutrient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FertilizerImplCopyWith<$Res>
    implements $FertilizerCopyWith<$Res> {
  factory _$$FertilizerImplCopyWith(
          _$FertilizerImpl value, $Res Function(_$FertilizerImpl) then) =
      __$$FertilizerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String assetName, Nutrient nutrient});

  @override
  $NutrientCopyWith<$Res> get nutrient;
}

/// @nodoc
class __$$FertilizerImplCopyWithImpl<$Res>
    extends _$FertilizerCopyWithImpl<$Res, _$FertilizerImpl>
    implements _$$FertilizerImplCopyWith<$Res> {
  __$$FertilizerImplCopyWithImpl(
      _$FertilizerImpl _value, $Res Function(_$FertilizerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? assetName = null,
    Object? nutrient = null,
  }) {
    return _then(_$FertilizerImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
    ));
  }
}

/// @nodoc

class _$FertilizerImpl implements _Fertilizer {
  const _$FertilizerImpl(
      {required this.code, required this.assetName, required this.nutrient});

  @override
  final String code;
  @override
  final String assetName;
  @override
  final Nutrient nutrient;

  @override
  String toString() {
    return 'Fertilizer(code: $code, assetName: $assetName, nutrient: $nutrient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FertilizerImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, assetName, nutrient);

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FertilizerImplCopyWith<_$FertilizerImpl> get copyWith =>
      __$$FertilizerImplCopyWithImpl<_$FertilizerImpl>(this, _$identity);
}

abstract class _Fertilizer implements Fertilizer {
  const factory _Fertilizer(
      {required final String code,
      required final String assetName,
      required final Nutrient nutrient}) = _$FertilizerImpl;

  @override
  String get code;
  @override
  String get assetName;
  @override
  Nutrient get nutrient;

  /// Create a copy of Fertilizer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FertilizerImplCopyWith<_$FertilizerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
