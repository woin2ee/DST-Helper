import 'dart:math';

import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/category_mixins.dart';
import 'package:dst_helper/models/v2/item/ingredients_analyser.dart';
import 'package:dst_helper/models/v2/item/items.dart';
import 'package:dst_helper/models/v2/item/requirement.dart';

extension RecipeExtension on Recipe {
  /// A value indicating whether the recipe can be cooked with given ingredients.
  ///
  /// If the recipe can't be able to cook with given ingredients any way, it returns `false`, while able to, returns `true`.
  ///
  /// Note: The moment a certain recipe becomes cookable, the recipes having low priority than the recipe becomes uncookable.
  bool canBeCookedWith(UsingInCrockPot i1, UsingInCrockPot i2, UsingInCrockPot i3, UsingInCrockPot i4) {
    final ingredientsAnalyser = IngredientsAnalyser([i1, i2, i3, i4]);
    if (!requirements.isMetFor(ingredientsAnalyser)) return false;
    // The length of recipes is always greater than 0 because the checking above.
    final satisfiedRecipes = Recipes.recipes.where((recipe) => recipe.requirements.isMetFor(ingredientsAnalyser));
    if (satisfiedRecipes.length == 1) return true;
    final maxPriority = satisfiedRecipes.map((recipe) => recipe.priority).reduce(max);
    if (priority < maxPriority) return false;
    return true;
  }

  /// 4개의 asset name 을 가진 List 를 반화합니다.
  List<String> get ingredientListAssetNames {
    final requirements = this.requirements.rawRequirements.toList();
    requirements.sort((a, b) => a.runtimeType is ContainingRequirement ? 1 : 0);

    List<String> assets = [];
    List<UsingInCrockPot> containedIngredient = [];
    for (final requirement in requirements) {
      switch (requirement) {
        case AtLeastRequirement(:final categories):
          for (final category in categories) {
            assets.add(category.assetName);
          }
        case ContainingRequirement(:final ingredient, :final count):
          containedIngredient.add(ingredient);
          for (var i = 0; i < count; i++) {
            if (ingredient is CookableFood) {
              final cookableFood = ingredient as CookableFood;
              assets.add(cookableFood.compositeAssetName ?? ingredient.assetName);
            } else {
              assets.add(ingredient.assetName);
            }
          }
        case MeetRequirement(minimumValues: final foodValues):
        case ExcessRequirement(thresholdValues: final foodValues):
          final ingredientsAnalyser = IngredientsAnalyser(containedIngredient);
          for (final foodValue in foodValues.rawValues) {
            final remainingValue = foodValue.quantifiedValue - ingredientsAnalyser.foodValueFor(foodValue.category);
            for (var i = 0; i < remainingValue.ceil(); i++) {
              assets.add(foodValue.category.assetName);
            }
          }
        case NoRequirement():
        case AndRequirements():
        case OrRequirement():
        case MaxRequirement():
          break;
      }
    }
    assert(assets.length <= 4);
    while (assets.length < 4) {
      assets.add('none');
    }
    return assets;
  }
}
