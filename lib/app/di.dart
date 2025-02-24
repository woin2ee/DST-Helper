import 'package:shared_preferences/shared_preferences.dart';

import '../cook_page/recipe_list.dart' as recipe_list;
import '../farm_page/farm_page.dart' as farm_page;

class DI {
  static final DI _singleton = DI._init();

  factory DI() {
    return _singleton;
  }

  DI._();

  factory DI._init() {
    final self = DI._();

    self.map[Future<SharedPreferencesWithCache>] = SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {
          recipe_list.RecipeListRepository.key,
          farm_page.FarmPageRepository.key,
        },
      ),
    );

    self.map[recipe_list.RecipeListRepository] = recipe_list.RecipeListRepository(
      prefs: self.resolve(),
    );

    self.map[farm_page.FarmPageRepository] = farm_page.FarmPageRepository(
      prefs: self.resolve(),
    );

    self.map[recipe_list.ViewModel] = recipe_list.ViewModel(
      repository: self.resolve(),
    );

    self.map[farm_page.ViewModel] = farm_page.ViewModel(
      repository: self.resolve(),
    );

    return self;
  }

  final map = <Type, dynamic>{};

  T resolve<T extends Object>() {
    return map[T] as T;
  }
}
