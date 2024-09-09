import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

class BooleanValueNotifierConverter implements JsonConverter<ValueNotifier<bool>, bool> {
  const BooleanValueNotifierConverter();

  @override
  ValueNotifier<bool> fromJson(bool json) => ValueNotifier(json);

  @override
  bool toJson(ValueNotifier<bool> object) => object.value;
}
