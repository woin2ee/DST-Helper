import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeListNotifier extends ChangeNotifier {
  final List<Recipe> _value = [
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

  List<Recipe> get value => _value.toList();

  void addRecipe(Recipe recipe) {
    if (_value.contains(recipe)) return;
    _value.add(recipe);
    notifyListeners();
  }

  void removeRecipe(Recipe recipe) {
    _value.remove(recipe);
    notifyListeners();
  }
}
