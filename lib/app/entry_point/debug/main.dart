import '../../../cook_page/recipe_list.dart' as recipe_list;
import '../../../models/v2/item/categories.dart';
import '../../sample_data.dart';
import '../boot_app.dart';

void main() async {
  bootApp(
    recipeListRepository: (context) => InMemoryRecipeListRepository(),
  );
}

class InMemoryRecipeListRepository implements recipe_list.AsyncRepository {
  final List<Recipe> _recipes = SampleData.recipeList.toList();

  @override
  Future<List<Recipe>> getRecipes() {
    return Future.value(_recipes);
  }

  @override
  Future<void> saveRecipes(List<Recipe> recipes) {
    _recipes.clear();
    _recipes.addAll(recipes);
    return Future.value();
  }
}
