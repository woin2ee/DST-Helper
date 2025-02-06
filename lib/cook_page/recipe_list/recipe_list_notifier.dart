import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/foundation.dart';

class RecipeListNotifier extends ChangeNotifier {
  List<Recipe> _value = [];
  List<Recipe> get value => _value.toList();

  RecipeListNotifier();

  /// It's useful for developing.
  factory RecipeListNotifier.withSample() {
    assert(!kReleaseMode);
    final List<Recipe> sample = [
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
    final instance = RecipeListNotifier();
    instance._value = sample;
    return instance;
  }

  void addRecipe(Recipe recipe) {
    _value.add(recipe);
    notifyListeners();
  }

  void insert(int index, Recipe recipe) {
    _value.insert(index, recipe);
    notifyListeners();
  }

  void removeRecipe(Recipe recipe) {
    _value.remove(recipe);
    notifyListeners();
  }

  Recipe removeAt(int index) {
    final removed = _value.removeAt(index);
    notifyListeners();
    return removed;
  }
}
