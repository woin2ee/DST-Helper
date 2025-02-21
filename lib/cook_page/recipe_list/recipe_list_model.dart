import 'package:flutter/foundation.dart';

import '../../models/v2/item/item.dart';

class RecipeListModel extends ChangeNotifier {
  RecipeListModel._(this.recipeList);

  factory RecipeListModel({
    // It's useful for developing.
    bool usingSample = false,
  }) {
    List<Recipe> initialList = [];

    if (usingSample) {
      assert(kDebugMode);
      initialList = sampleRecipeList.toList();
    }

    return RecipeListModel._(initialList);
  }

  final List<Recipe> recipeList;

  static const List<Recipe> sampleRecipeList = [
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

  void add(Recipe recipe) {
    recipeList.add(recipe);
    notifyListeners();
  }

  void insert(int index, Recipe recipe) {
    recipeList.insert(index, recipe);
    notifyListeners();
  }

  void remove(Recipe recipe) {
    recipeList.remove(recipe);
    notifyListeners();
  }

  Recipe removeAt(int index) {
    final removed = recipeList.removeAt(index);
    notifyListeners();
    return removed;
  }
}
