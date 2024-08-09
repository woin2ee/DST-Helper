import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/item.dart';
import 'package:dst_helper/models/items.dart';

/// 요리 가능한 아이템(Crock Pot에 넣을 수 있는 아이템)
abstract class Ingredient extends Item {
  const Ingredient(super.name, super.assetName, this.foodValues);

  final FoodValues? foodValues;
}

class FoodValues with Iterable {
  const FoodValues(this._values);

  final Set<FoodValue> _values;

  Set<FoodValue> get values {
    for (var category in FoodValueCategory.values) {
      var countPerCategory = _values.where((foodValue) => foodValue.category == category).length;
      if (countPerCategory > 1) assert(false);
    }
    return _values;
  }

  @override
  Iterator get iterator => values.iterator;
}

enum FoodValueCategory {
  meat,
  fish,
  vegetable,
  fruit,
  sweetener,
  egg,
  ice,
  dairy,
  monster,
  inedible,
}

class FoodValue {
  const FoodValue(this.category, this.quantifiedValue);

  final FoodValueCategory category;
  final double quantifiedValue;
}

typedef Ingredients = Iterable<Ingredient>;

class IngredientsAnalyser {
  const IngredientsAnalyser(this.ingredients);

  final Ingredients ingredients;

  bool get containEgg {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == FoodValueCategory.egg) ?? false;
    });
  }

  bool get containFruit {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == FoodValueCategory.fruit) ?? false;
    });
  }

  bool get containInedible {
    return ingredients.any((ingredient) => ingredient is! Food);
  }

  bool get containMandrake {
    return ingredients.any((ingredient) => ingredient is Mandrake);
  }

  bool get containMeet {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == FoodValueCategory.meat) ?? false;
    });
  }

  bool get containSweetener {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == FoodValueCategory.sweetener) ?? false;
    });
  }

  bool get containTallbirdEgg {
    return ingredients.any((ingredient) => ingredient is TallbirdEgg);
  }

  bool get containTwigs {
    return ingredients.any((ingredient) => ingredient is Twigs);
  }

  bool get containVeggie {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == FoodValueCategory.vegetable) ?? false;
    });
  }

  bool containsCategory(FoodValueCategory category) {
    return ingredients.any((ingredient) {
      return ingredient.foodValues?.any((foodValue) => foodValue.category == category) ?? false;
    });
  }

  bool contains(Ingredient ingredient, {int count = 1}) {
    int hitCount = 0;
    for (final i in ingredients) {
      if (i == ingredient) hitCount += 1;
      if (hitCount == count) return true;
    }
    return false;
  }

  double get meatValue => foodValueFor(FoodValueCategory.meat);
  double get monsterValue => foodValueFor(FoodValueCategory.monster);

  double foodValueFor(FoodValueCategory category) {
    double foodValue = 0;
    for (var ingredient in ingredients) {
      var foodValues = ingredient.foodValues;
      if (foodValues != null) {
        try {
          foodValue += foodValues.firstWhere((foodValue) => foodValue.category == category).quantifiedValue;
        } catch (e) {
          continue;
        }
      }
    }
    return foodValue;
  }
}

class ElementNotFoundException implements Exception {}

// class FoodValues {
//   const FoodValues({
//     this.meat,
//     this.fish,
//     this.vegetable,
//     this.fruit,
//     this.sweetener,
//     this.egg,
//     this.ice,
//     this.dairy,
//     this.monster,
//     this.inedible,
//   });

//   final MeatValue? meat;
//   final FishValue? fish;
//   final VegetableValue? vegetable;
//   final FruitValue? fruit;
//   final EggValue? egg;
//   final SweetenerValue? sweetener;
//   final IceValue? ice;
//   final DairyValue? dairy;
//   final MonsterValue? monster;
//   final InedibleValue? inedible;
//   // final Float? butterflyWings;
//   // final Float? moonMothWings
//   // final Float? roastedBirchnut;
// }

// enum MeatValue with FoodValue {
//   quarter,
//   half,
//   full;

//   @override
//   double get value {
//     switch (this) {
//       case MeatValue.quarter:
//         return 0.25;
//       case MeatValue.half:
//         return 0.5;
//       case MeatValue.full:
//         return 1;
//     }
//   }
// }

// enum FishValue with FoodValue {
//   quarter,
//   half,
//   full,
//   twice;

//   @override
//   double get value {
//     switch (this) {
//       case FishValue.quarter:
//         return 0.25;
//       case FishValue.half:
//         return 0.5;
//       case FishValue.full:
//         return 1;
//       case FishValue.twice:
//         return 2;
//     }
//   }
// }

// enum VegetableValue with FoodValue {
//   half,
//   full;

//   @override
//   double get value {
//     switch (this) {
//       case VegetableValue.half:
//         return 0.5;
//       case VegetableValue.full:
//         return 1;
//     }
//   }
// }

// enum FruitValue with FoodValue {
//   half,
//   full;

//   @override
//   double get value {
//     switch (this) {
//       case FruitValue.half:
//         return 0.5;
//       case FruitValue.full:
//         return 1;
//     }
//   }
// }

// enum EggValue with FoodValue {
//   small,
//   enormous;

//   @override
//   double get value {
//     switch (this) {
//       case EggValue.small:
//         return 1;
//       case EggValue.enormous:
//         return 4;
//     }
//   }
// }

// enum SweetenerValue with FoodValue {
//   honeys,
//   royalJelly;

//   @override
//   double get value {
//     switch (this) {
//       case SweetenerValue.honeys:
//         return 1;
//       case SweetenerValue.royalJelly:
//         return 3;
//     }
//   }
// }

// enum IceValue with FoodValue {
//   ice;

//   @override
//   double get value {
//     switch (this) {
//       case IceValue.ice:
//         return 1;
//     }
//   }
// }

// enum DairyValue with FoodValue {
//   dairy;

//   @override
//   double get value {
//     switch (this) {
//       case DairyValue.dairy:
//         return 1;
//     }
//   }
// }

// enum MonsterValue with FoodValue {
//   monster;

//   @override
//   double get value {
//     switch (this) {
//       case MonsterValue.monster:
//         return 1;
//     }
//   }
// }

// enum InedibleValue with FoodValue {
//   inedible;

//   @override
//   double get value {
//     switch (this) {
//       case InedibleValue.inedible:
//         return 1;
//     }
//   }
// }