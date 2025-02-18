import 'dart:math';

import 'categories.dart';
import 'category_mixins.dart';
import 'ingredients_analyser.dart';
import 'items.dart';
import 'requirement.dart';

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
    final satisfiedRecipes = Items.recipes.where((recipe) => recipe.requirements.isMetFor(ingredientsAnalyser));
    if (satisfiedRecipes.length == 1) return true;
    final maxPriority = satisfiedRecipes.map((recipe) => recipe.priority).reduce(max);
    if (priority < maxPriority) return false;
    return true;
  }

  /// A list containing exactly 4 asset names.
  List<String> get ingredientListAssetNames {
    final List<String> assets = [];
    final List<UsingInCrockPot> containedIngredient = [];

    /// Extract assets that appropriately represent a given requirement.
    List<String> assetsRepresenting(Requirement requirement) {
      switch (requirement) {
        case AtLeastRequirement(:final categories):
          return categories.map((e) => e.assetName).toList();
        case ContainingRequirement(:final ingredient, :final count):
          containedIngredient.add(ingredient);
          return List<String>.generate(count, (index) {
            if (ingredient is CookableFood) {
              final cookableFood = ingredient as CookableFood;
              return cookableFood.compositeAssetName ?? ingredient.assetName;
            } else {
              return ingredient.assetName;
            }
          });
        case MeetRequirement(minimumValues: final foodValues):
          final ingredientsAnalyser = IngredientsAnalyser(containedIngredient);
          final assetNamesByCategory = foodValues.rawValues.map((foodValue) {
            final remainingValue = foodValue.quantifiedValue - ingredientsAnalyser.foodValueFor(foodValue.category);
            return List<String>.generate(remainingValue.ceil(), (_) => foodValue.category.assetName);
          });
          return assetNamesByCategory.fold([], (a, b) => a + b);
        case ExcessRequirement(thresholdValues: final foodValues):
          final ingredientsAnalyser = IngredientsAnalyser(containedIngredient);
          final assetNamesByCategory = foodValues.rawValues.map((foodValue) {
            final remainingValue = foodValue.quantifiedValue - ingredientsAnalyser.foodValueFor(foodValue.category);
            var countOfNeeded = remainingValue.ceil();
            if (remainingValue == countOfNeeded) countOfNeeded += 1;
            return List<String>.generate(countOfNeeded, (_) => foodValue.category.assetName);
          });
          return assetNamesByCategory.fold([], (a, b) => a + b);
        case OrRequirement(:final requirements):
          // TODO: For now, it doesn't consider the other side requirement.
          return assetsRepresenting(requirements.first);
        case NoRequirement():
        case AndRequirement():
        case MaxRequirement():
          return [];
      }
    }

    final orderableRequirements = requirements.rawRequirements.map((e) => OrderableRequirement(e)).toList();
    orderableRequirements.sort();

    for (final requirement in orderableRequirements.reversed) {
      final assetsForRequirement = assetsRepresenting(requirement.base);
      assets.addAll(assetsForRequirement);
    }

    assert(assets.length <= 4);

    while (assets.length < 4) {
      assets.add('none');
    }
    return assets.getRange(0, 4).toList();
  }
}

class OrderableRequirement implements Comparable<Requirement> {
  const OrderableRequirement(this.base);

  final Requirement base;

  int get order => switch (base) {
        AndRequirement() => 0,
        OrRequirement() => 20,

        // These 2 values of requirements below must be less than the value of [ContainingRequirement].
        // Because, when it makes up ingredient list for a recipe,
        // these should be get after considering [ContainingRequirement].
        MeetRequirement() => -2,
        ExcessRequirement() => -1,

        //
        AtLeastRequirement() => 2,
        ContainingRequirement() => 10,
        NoRequirement() => 0,
        MaxRequirement() => 0,
      };

  @override
  int compareTo(Requirement other) => order.compareTo(OrderableRequirement(other).order);
}
