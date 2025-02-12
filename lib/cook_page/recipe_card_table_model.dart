import 'package:flutter/material.dart';

import '../l10n/l10ns.dart';
import '../models/v2/item/item.dart';
import 'recipe_card/recipe_card.dart';

class RecipeCardTableModel extends ChangeNotifier {
  RecipeCardMode _recipeCardMode = RecipeCardMode.basic;
  RecipeCardMode get recipeCardMode => _recipeCardMode;
  set recipeCardMode(RecipeCardMode value) {
    _recipeCardMode = value;
    notifyListeners();
  }

  String _searchKeyword = '';
  set searchKeyword(String value) {
    _searchKeyword = value;
    notifyListeners();
  }

  List<Recipe> getRecipes(BuildContext context) {
    final entireRecipes = Items.recipes;

    if (_searchKeyword.isEmpty) {
      return entireRecipes;
    }

    final searchedRecipes = entireRecipes.where((recipe) {
      final recipeName = L10ns.of(context).localized('${recipe.code}_name');
      final adjustedName = recipeName.replaceAll(' ', '').toLowerCase();
      final searchKeyword = _searchKeyword.toLowerCase();
      return adjustedName.contains(searchKeyword);
    });

    return searchedRecipes.toList();
  }
}
