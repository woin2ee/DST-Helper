// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataClass {
  List<Element> get elements => throw _privateConstructorUsedError;

  /// Create a copy of DataClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataClassCopyWith<DataClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataClassCopyWith<$Res> {
  factory $DataClassCopyWith(DataClass value, $Res Function(DataClass) then) =
      _$DataClassCopyWithImpl<$Res, DataClass>;
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class _$DataClassCopyWithImpl<$Res, $Val extends DataClass>
    implements $DataClassCopyWith<$Res> {
  _$DataClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_value.copyWith(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataClassImplCopyWith<$Res>
    implements $DataClassCopyWith<$Res> {
  factory _$$DataClassImplCopyWith(
          _$DataClassImpl value, $Res Function(_$DataClassImpl) then) =
      __$$DataClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class __$$DataClassImplCopyWithImpl<$Res>
    extends _$DataClassCopyWithImpl<$Res, _$DataClassImpl>
    implements _$$DataClassImplCopyWith<$Res> {
  __$$DataClassImplCopyWithImpl(
      _$DataClassImpl _value, $Res Function(_$DataClassImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataClass
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_$DataClassImpl(
      elements: null == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ));
  }
}

/// @nodoc

class _$DataClassImpl implements _DataClass {
  const _$DataClassImpl({required final List<Element> elements})
      : _elements = elements;

  final List<Element> _elements;
  @override
  List<Element> get elements {
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elements);
  }

  @override
  String toString() {
    return 'DataClass(elements: $elements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataClassImpl &&
            const DeepCollectionEquality().equals(other._elements, _elements));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_elements));

  /// Create a copy of DataClass
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataClassImplCopyWith<_$DataClassImpl> get copyWith =>
      __$$DataClassImplCopyWithImpl<_$DataClassImpl>(this, _$identity);
}

abstract class _DataClass implements DataClass {
  const factory _DataClass({required final List<Element> elements}) =
      _$DataClassImpl;

  @override
  List<Element> get elements;

  /// Create a copy of DataClass
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataClassImplCopyWith<_$DataClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
