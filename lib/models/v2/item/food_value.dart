import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_value.freezed.dart';
part 'food_value.g.dart';

enum FoodValueCategory {
  meat,
  fish,
  vegetable,
  fruit,
  sweetener,
  egg,
  // ice,
  dairy,
  monster,
  inedible;

  String get assetName {
    switch (this) {
      case FoodValueCategory.meat:
        return 'meats';
      case FoodValueCategory.fish:
        return 'fishes';
      case FoodValueCategory.vegetable:
        return 'vegetables';
      case FoodValueCategory.fruit:
        return 'fruits';
      case FoodValueCategory.sweetener:
        return 'sweetener';
      case FoodValueCategory.egg:
        return 'eggs';
      // case FoodValueCategory.ice:
      //   return '';
      case FoodValueCategory.dairy:
        return 'dairy_product';
      case FoodValueCategory.monster:
        return 'monster_meats';
      case FoodValueCategory.inedible:
        return 'inedible';
    }
  }
}

@freezed
class FoodValue with _$FoodValue {
  const factory FoodValue(
    FoodValueCategory category,
    double quantifiedValue,
  ) = _FoodValue;

  factory FoodValue.fromJson(Map<String, Object?> json) => _$FoodValueFromJson(json);
}

@freezed
class FoodValues with _$FoodValues, Iterable {
  const factory FoodValues(
    Set<FoodValue> rawValues,
  ) = _FoodValues;
  const FoodValues._();

  factory FoodValues.fromJson(Map<String, Object?> json) => _$FoodValuesFromJson(json);

  Set<FoodValue> get values {
    for (var category in FoodValueCategory.values) {
      var countPerCategory = rawValues.where((foodValue) => foodValue.category == category).length;
      if (countPerCategory > 1) assert(false);
    }
    return rawValues;
  }

  @override
  Iterator get iterator => values.iterator;
}
