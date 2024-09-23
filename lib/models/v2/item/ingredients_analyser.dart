import 'package:dst_helper/models/v2/item/category_mixins.dart';
import 'package:dst_helper/models/v2/item/food_value.dart';

typedef Ingredients = Iterable<UsingInCrockPot>;

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
    return ingredients.any((ingredient) => ingredient is! Edible);
  }

  bool get containMandrake {
    return ingredients.any((ingredient) => ingredient.code == 'mandrake');
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
    return ingredients.any((ingredient) => ingredient.code == 'tallbirdegg');
  }

  bool get containTwigs {
    return ingredients.any((ingredient) => ingredient.code == 'twigs');
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

  bool contains(UsingInCrockPot ingredient, {int count = 1}) {
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
