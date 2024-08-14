import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';
import 'package:dst_helper/models/plant.dart';
import 'package:dst_helper/models/season.dart';

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
  Seeds get seeds => const PotatoSeeds();
}

class PotatoSeeds extends Seeds {
  const PotatoSeeds()
      : super(
          crop: const Potato(),
          assumedName: 'Fluffy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const CarrotSeeds();
}

class CarrotSeeds extends Seeds {
  const CarrotSeeds()
      : super(
          crop: const Carrot(),
          assumedName: 'Oblong Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const CornSeeds();
}

class CornSeeds extends Seeds {
  const CornSeeds()
      : super(
          crop: const Corn(),
          assumedName: 'Clustered Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const TomaRootSeeds();

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});
}

class TomaRootSeeds extends Seeds {
  const TomaRootSeeds()
      : super(
          crop: const TomaRoot(),
          assumedName: 'Spiky Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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

class AsparagusSeeds extends Seeds {
  const AsparagusSeeds()
      : super(
          assumedName: 'Tubular Seeds',
          crop: const Asparagus(),
        );

  @override
  String get name => 'Asparagus Seeds';
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

class WatermelonSeeds extends Seeds {
  const WatermelonSeeds()
      : super(
          crop: const Watermelon(),
          assumedName: 'Square Seeds',
        );

  @override
  String get name => 'Watermelon Seeds';
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
  Seeds get seeds => const PumpkinSeeds();
}

class PumpkinSeeds extends Seeds {
  const PumpkinSeeds()
      : super(
          crop: const Pumpkin(),
          assumedName: 'Sharp Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const EggplantSeeds();
}

class EggplantSeeds extends Seeds {
  const EggplantSeeds()
      : super(
          crop: const Eggplant(),
          assumedName: 'Swirly Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const GarlicSeeds();
}

class GarlicSeeds extends Seeds {
  const GarlicSeeds()
      : super(
          crop: const Garlic(),
          assumedName: 'Seed Pods',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  Seeds get seeds => const OnionSeeds();
}

class OnionSeeds extends Seeds {
  const OnionSeeds()
      : super(
          crop: const Onion(),
          assumedName: 'Pointy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const PepperSeeds();
}

class PepperSeeds extends Seeds {
  const PepperSeeds()
      : super(
          crop: const Pepper(),
          assumedName: 'Lumpy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const PomegranateSeeds();
}

class PomegranateSeeds extends Seeds {
  const PomegranateSeeds()
      : super(
          crop: const Pomegranate(),
          assumedName: 'Windblown Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const DragonFruitSeeds();
}

class DragonFruitSeeds extends Seeds {
  const DragonFruitSeeds()
      : super(
          crop: const DragonFruit(),
          assumedName: 'Bulbous Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
  Seeds get seeds => const DurianSeeds();
}

class DurianSeeds extends Seeds {
  const DurianSeeds()
      : super(
          crop: const Durian(),
          assumedName: 'Brittle Seed Pods',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
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
