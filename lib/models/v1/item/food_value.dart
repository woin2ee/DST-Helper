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

class FoodValue {
  const FoodValue(this.category, this.quantifiedValue);

  final FoodValueCategory category;
  final double quantifiedValue;
}

class FoodValues with Iterable {
  const FoodValues(this.rawValues);

  final Set<FoodValue> rawValues;

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
