import 'package:shared_preferences/shared_preferences.dart';

import '../../../cook_page/recipe_list.dart';
import '../../../models/v2/item/categories.dart';
import '../../sample_data.dart';
import '../boot_app.dart';

void main() async {
  bootApp(
    recipeListRepository: (context) => InMemoryRecipeListRepository(),
  );
}

class InMemoryRecipeListRepository implements RecipeListRepository {
  final List<Recipe> _recipes = SampleData.recipeList.toList();

  @override
  Future<List<Recipe>> fetch() {
    return Future.value(_recipes);
  }

  @override
  Future<SharedPreferencesWithCache> get prefs => throw UnimplementedError();

  @override
  Future<void> save(List<Recipe> data) {
    _recipes.clear();
    _recipes.addAll(data);
    return Future.value();
  }

  // @override
  // Future<List<Recipe>> getRecipes() {
  //   return Future.value(_recipes);
  // }

  // @override
  // Future<void> saveRecipes(List<Recipe> recipes) {
  //   _recipes.clear();
  //   _recipes.addAll(recipes);
  //   return Future.value();
  // }
}
