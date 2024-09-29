import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeListProvider extends ValueNotifier<List<Recipe>> {
  RecipeListProvider() : super([]);

  void initialize() {
    value = [
      Recipes.meatballs,
      Recipes.creamyPotatoPuree,
      Recipes.fancySpiralledTubers,
      Recipes.veggieBurger,
      Recipes.honeyHam,
      Recipes.iceCream,
      Recipes.jellySalad,
      Recipes.kabobs,
      Recipes.pierogi,
      Recipes.salsaFresca,
      Recipes.vegetableStinger,
      Recipes.taffy,
      Recipes.baconAndEggs,
      Recipes.figatoni,
      Recipes.figkabab,
      Recipes.soothingTea,
      Recipes.trailMix,
    ];
  }

  void addRecipe(Recipe recipe) {
    if (value.contains(recipe)) return;
    value.add(recipe);
    notifyListeners();
  }

  void removeRecipe(Recipe recipe) {
    value.remove(recipe);
    notifyListeners();
  }
}
