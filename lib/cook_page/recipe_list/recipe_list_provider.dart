import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeListProvider extends ValueNotifier<List<Recipe>> {
  RecipeListProvider() : super([]);

  void initialize() {
    value = [
      Items.meatballs,
      Items.creamyPotatoPuree,
      Items.fancySpiralledTubers,
      Items.veggieBurger,
      Items.honeyHam,
      Items.iceCream,
      Items.jellySalad,
      Items.kabobs,
      Items.pierogi,
      Items.salsaFresca,
      Items.vegetableStinger,
      Items.taffy,
      Items.baconAndEggs,
      Items.figatoni,
      Items.figkabab,
      Items.soothingTea,
      Items.trailMix,
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
