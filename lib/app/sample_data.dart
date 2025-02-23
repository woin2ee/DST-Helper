import '../farm_page/farm_grid/farm_group/farm_group_model.dart';
import '../farm_page/farm_grid/farm_view/farm_view_model.dart';
import '../models/v2/item/categories.dart';
import '../models/v2/item/items.dart';

class SampleData {
  SampleData._();

  static const List<Recipe> recipeList = [
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

  static List<FarmGroupModel> get preDefinedList {
    return List.of([
      preDefined1,
      preDefined2,
      preDefined3,
      preDefined4,
      preDefined5,
      preDefined6,
      preDefined7,
      preDefined8,
      preDefined10,
      preDefined11,
      // preDefined12,
      // preDefined13,
      // preDefined14,
      // preDefined15,
      // preDefined16,
    ]);
  }

  static FarmGroupModel get preDefined1 {
    return FarmGroupModel.single(
      farmViewModel: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
        null,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
    );
  }

  static FarmGroupModel get preDefined2 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
      right: FarmViewModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined3 {
    return FarmGroupModel.double(
      left: FarmViewModel.dense(
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
      ),
      right: FarmViewModel.reverseDense(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined4 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
      ),
      right: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined5 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
      ),
      right: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined6 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.potato,
        null,
        Items.garlic,
        Items.potato,
        Items.onion,
        Items.onion,
      ),
      right: FarmViewModel.basic(
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.garlic,
        null,
        Items.potato,
        Items.onion,
        Items.onion,
        Items.potato,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined7 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
      ),
      right: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
        darkTheme: true,
      ),
    );
  }

  static FarmGroupModel get preDefined8 {
    return FarmGroupModel.single(
      farmViewModel: FarmViewModel.basic(
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        null,
        Items.carrot,
        Items.carrot,
        Items.carrot,
        Items.carrot,
      ),
    );
  }

  static FarmGroupModel get preDefined10 {
    return FarmGroupModel.square(
      topLeft: FarmViewModel.basic(
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
      ),
      topRight: FarmViewModel.basic(
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        darkTheme: true,
      ),
      bottomLeft: FarmViewModel.basic(
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
        darkTheme: true,
      ),
      bottomRight: FarmViewModel.basic(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
      ),
    );
  }

  static FarmGroupModel get preDefined11 {
    return FarmGroupModel.square(
      topLeft: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
      ),
      topRight: FarmViewModel.basic(
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
        darkTheme: true,
      ),
      bottomLeft: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        darkTheme: true,
      ),
      bottomRight: FarmViewModel.basic(
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
      ),
    );
  }
}
