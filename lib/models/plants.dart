import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';
import 'package:dst_helper/models/plant.dart';
import 'package:dst_helper/models/season.dart';
import 'package:dst_helper/models/seeds.dart';

class Plants {
  static List<Crop> get crops {
    return const [
      Potato(),
      Carrot(),
      Corn(),
      TomaRoot(),
      Asparagus(),
      Watermelon(),
      Pumpkin(),
      Eggplant(),
      Garlic(),
      Onion(),
      Pepper(),
      Pomegranate(),
      DragonFruit(),
      Durian(),
    ];
  }
}

class Potato implements Crop {
  const Potato();

  @override
  String get assetName => 'potato';

  @override
  String get name => 'Potato';

  @override
  Nutrient get nutrient => const Nutrient(compost: 2, growthFormula: 2, manure: -4);

  @override
  Seasons get seasons => {Season.spring, Season.autumn, Season.winter};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seeds
  Seeds get seeds => throw UnimplementedError();
}

class Carrot implements Crop {
  const Carrot();

  @override
  String get assetName => 'carrot';

  @override
  String get name => 'Carrot';

  @override
  Nutrient get nutrient => const Nutrient(compost: 2, growthFormula: -4, manure: 2);

  @override
  Seasons get seasons => {Season.spring, Season.autumn, Season.winter};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class Corn implements Crop {
  const Corn();

  @override
  String get assetName => 'corn';

  @override
  String get name => 'Corn';

  @override
  Nutrient get nutrient => const Nutrient(compost: -4, growthFormula: 2, manure: 2);

  @override
  Seasons get seasons => {Season.spring, Season.summer, Season.autumn};

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class TomaRoot implements Crop {
  const TomaRoot();

  @override
  String get assetName => 'toma_root';

  @override
  String get name => 'Toma Root';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: 4);

  @override
  Seasons get seasons => {Season.spring, Season.summer, Season.autumn};

  @override
  FoodType get type => FoodType.veggie;

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});
}

class Asparagus implements Crop {
  const Asparagus();

  @override
  String get assetName => 'asparagus';

  @override
  String get name => 'Asparagus';

  @override
  Nutrient get nutrient => const Nutrient(compost: -4, growthFormula: 2, manure: 2);

  @override
  Seasons get seasons => {Season.spring, Season.winter};

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  Seeds get seeds => const AsparagusSeeds();
}

class AsparagusSeeds implements Seeds {
  const AsparagusSeeds();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement assumedName
  String? get assumedName => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}

class Watermelon implements Crop {
  const Watermelon();

  @override
  String get assetName => 'watermelon';

  @override
  String get name => 'Watermelon';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: 4, manure: -2);

  @override
  Seasons get seasons => {Season.spring, Season.summer};

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.fruit, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  Seeds get seeds => const WatermelonSeeds();
}

class WatermelonSeeds implements Seeds {
  const WatermelonSeeds();

  @override
  String get assetName => 'watermelon_seeds';

  @override
  String get name => 'Watermelon Seeds';

  @override
  String get assumedName => 'Square Seeds';
}

class Pumpkin implements Crop {
  const Pumpkin();

  @override
  String get assetName => 'pumpkin';

  @override
  String get name => 'Pumpkin';

  @override
  Nutrient get nutrient => const Nutrient(compost: 2, growthFormula: -4, manure: 2);

  @override
  Seasons get seasons => {Season.autumn, Season.winter};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seeds
  Seeds get seeds => throw UnimplementedError();
}

class Eggplant implements Crop {
  const Eggplant();

  @override
  String get assetName => 'eggplant';

  @override
  String get name => 'Eggplant';

  @override
  Nutrient get nutrient => const Nutrient(compost: 2, growthFormula: 2, manure: -4);

  @override
  Seasons get seasons => {Season.spring, Season.autumn};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class Garlic implements Crop {
  const Garlic();

  @override
  String get assetName => 'garlic';

  @override
  String get name => 'Garlic';

  @override
  Nutrient get nutrient => const Nutrient(compost: -8, growthFormula: 4, manure: 4);

  @override
  Seasons get seasons => {Season.spring, Season.summer, Season.autumn, Season.winter};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class Onion implements Crop {
  const Onion();

  @override
  String get assetName => 'onion';

  @override
  String get name => 'Onion';

  @override
  Nutrient get nutrient => const Nutrient(compost: 4, growthFormula: -8, manure: 4);

  @override
  Seasons get seasons => {Season.spring, Season.summer, Season.autumn};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class Pepper implements Crop {
  const Pepper();

  @override
  String get assetName => 'pepper';

  @override
  String get name => 'Pepper';

  @override
  Nutrient get nutrient => const Nutrient(compost: 4, growthFormula: 4, manure: -8);

  @override
  Seasons get seasons => {Season.summer, Season.autumn};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class Pomegranate implements Crop {
  const Pomegranate();

  @override
  String get assetName => 'pomegranate';

  @override
  String get name => 'Pomegranate';

  @override
  Nutrient get nutrient => const Nutrient(compost: 4, growthFormula: -8, manure: 4);

  @override
  Seasons get seasons => {Season.spring, Season.summer};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seeds
  Seeds get seeds => throw UnimplementedError();
}

class DragonFruit implements Crop {
  const DragonFruit();

  @override
  String get assetName => 'dragon_fruit';

  @override
  String get name => 'Dragon Fruit';

  @override
  Nutrient get nutrient => const Nutrient(compost: 4, growthFormula: 4, manure: -8);

  @override
  Seasons get seasons => {Season.spring, Season.summer};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seeds
  Seeds get seeds => throw UnimplementedError();
}

class Durian implements Crop {
  const Durian();

  @override
  String get assetName => 'durian';

  @override
  String get name => 'Durian';

  @override
  Nutrient get nutrient => const Nutrient(compost: -8, growthFormula: 4, manure: 4);

  @override
  Seasons get seasons => {Season.spring};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  // TODO: implement seed
  Seeds get seeds => throw UnimplementedError();
}

class ForgetMeLots implements Weed, Food, Ingredient {
  const ForgetMeLots();

  @override
  String get assetName => 'forget_me_lots';

  @override
  String get name => 'ForgetMeLots';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class FireNettleFronds implements Weed, Food {
  @override
  String get assetName => 'fire_nettle_fronds';

  @override
  String get name => 'Fire Nettle Fronds';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class Tillweeds implements Weed, Food {
  @override
  String get assetName => 'tillweeds';

  @override
  String get name => 'Tillweeds';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class SpinyBindweed implements Weed {
  @override
  String get assetName => 'spiny_bindweed';

  @override
  String get name => 'Spiny Bindweed';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};
}
