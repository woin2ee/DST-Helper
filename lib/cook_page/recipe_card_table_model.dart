import 'package:dst_helper/cook_page/recipe_card/recipe_card.dart';
import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

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
    var entireRecipes = Items.recipes;

    if (_searchKeyword.isEmpty) {
      return entireRecipes;
    }

    var searchedRecipes = entireRecipes.where((recipe) {
      var recipeName = L10ns.of(context).localized('${recipe.code}_name');
      var adjustedName = recipeName.replaceAll(' ', '').toLowerCase();
      var searchKeyword = _searchKeyword.toLowerCase();
      return adjustedName.contains(searchKeyword);
    });

    return searchedRecipes.toList();
  }
}
