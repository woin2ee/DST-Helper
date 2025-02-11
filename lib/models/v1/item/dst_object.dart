// ignore_for_file: override_on_non_overriding_member

import 'dart:math';

import 'package:flutter/foundation.dart';

import '../season.dart';
import 'food_value.dart';
import 'ingredients_analyser.dart';
import 'requirement.dart';

@immutable
sealed class DSTObject {
  const DSTObject({
    required this.code,
    required this.assetName,
  });

  final String code;
  final String assetName;
}

enum FoodType {
  veggie,
  meat,
  generic,
  seeds,
  goodies,
}

/// 먹을 수 있는 모든 아이템
sealed class FoodObject extends DSTObject {
  const FoodObject({
    required super.code,
    required super.assetName,
    required this.type,
  });

  final FoodType type;
}

/// 불에 구울 수 있는 아이템(다른 아이템으로 변함)
sealed class CookableFood extends FoodObject {
  const CookableFood({
    required super.code,
    required super.assetName,
    required super.type,
    required this.compositeAssetName,
  });

  final String? compositeAssetName;
}

/// 요리 가능한 아이템(Crock Pot에 넣을 수 있는 아이템)
abstract class IngredientObject extends DSTObject {
  const IngredientObject({
    required super.code,
    required super.assetName,
    required this.foodValues,
  });

  final FoodValues? foodValues;
}

// 식물
sealed class PlantObject extends DSTObject {
  const PlantObject({
    required super.code,
    required super.assetName,
    required this.seasons,
    required this.nutrient,
  });

  final Seasons seasons;
  final Nutrient nutrient;
}

/// 작물
sealed class CropObject implements PlantObject, FoodObject, IngredientObject {
  const CropObject(this.seeds);

  final SeedsObject seeds;
}

/// 씨앗
sealed class SeedsObject implements DSTObject {
  const SeedsObject({required this.crop});

  final CropObject crop;

  // final String? assumedName;

  @override
  String get assetName => '${crop.assetName}_seeds';
}

/// 잡초
sealed class WeedObject implements PlantObject {
  const WeedObject();
}

/// 영양분
class Nutrient {
  /// 퇴비
  final int compost;

  /// 성장 촉진제
  final int growthFormula;

  /// 거름
  final int manure;

  const Nutrient({
    required this.compost,
    required this.growthFormula,
    required this.manure,
  });

  Nutrient.zero()
      : compost = 0,
        growthFormula = 0,
        manure = 0;

  Nutrient operator +(Nutrient right) => Nutrient(
        compost: compost + right.compost,
        growthFormula: growthFormula + right.growthFormula,
        manure: manure + right.manure,
      );

  bool equalsOfValue(Nutrient other) {
    return (compost == other.compost) && (growthFormula == other.growthFormula) && (manure == other.manure);
  }
}

/// It represents all of items cookable through the crock pot.
///
/// A recipe has its own priority and requirements for cooking.
sealed class RecipeObject extends DSTObject {
  const RecipeObject({
    required super.code,
    required super.assetName,
    required this.priority,
    required this.requirements,
  });

  final int priority;

  final Requirements requirements;

  /// A value indicating whether the recipe can be cooked with given ingredients.
  ///
  /// If the recipe can't be able to cook with given ingredients any way, it returns `false`, while able to, returns `true`.
  ///
  /// Note: The moment a certain recipe becomes cookable, the recipes having low priority than the recipe becomes uncookable.
  bool canBeCookedWith(IngredientObject i1, IngredientObject i2, IngredientObject i3, IngredientObject i4) {
    final ingredientsAnalyser = IngredientsAnalyser([i1, i2, i3, i4]);
    if (!requirements.isMetFor(ingredientsAnalyser)) return false;
    // The length of recipes is always greater than 0 because the checking above.
    final satisfiedRecipes = Recipes.recipes.where((recipe) => recipe.requirements.isMetFor(ingredientsAnalyser));
    if (satisfiedRecipes.length == 1) return true;
    final maxPriority = satisfiedRecipes.map((recipe) => recipe.priority).reduce(max);
    if (priority < maxPriority) return false;
    return true;
  }

  List<String> get ingredientListAssetNames {
    final requirements = this.requirements.rawRequirements.toList();
    requirements.sort((a, b) => a.runtimeType is ContainingRequirement ? 1 : 0);

    final List<String> assets = [];
    final List<IngredientObject> containedIngredient = [];
    for (final requirement in requirements) {
      switch (requirement) {
        case AtLeastRequirement(:final categories):
          for (final category in categories) {
            assets.add(category.assetName);
          }
        case ContainingRequirement(:final ingredient, :final count):
          containedIngredient.add(ingredient);
          for (var i = 0; i < count; i++) {
            if (ingredient is CookableFood) {
              final cookableFood = ingredient as CookableFood;
              assets.add(cookableFood.compositeAssetName ?? ingredient.assetName);
            } else {
              assets.add(ingredient.assetName);
            }
          }
        case MeetRequirement(minimumValues: final foodValues):
        case ExcessRequirement(thresholdValues: final foodValues):
          final ingredientsAnalyser = IngredientsAnalyser(containedIngredient);
          for (final foodValue in foodValues.rawValues) {
            final remainingValue = foodValue.quantifiedValue - ingredientsAnalyser.foodValueFor(foodValue.category);
            for (var i = 0; i < remainingValue.ceil(); i++) {
              assets.add(foodValue.category.assetName);
            }
          }
        case NoRequirement():
        case AndRequirements():
        case OrRequirement():
        case MaxRequirement():
          break;
      }
    }
    assert(assets.length <= 4);
    while (assets.length < 4) {
      assets.add('none');
    }
    return assets;
  }
}

//
// Plants
//

class Plants {
  static List<CropObject> get crops {
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

class Potato implements CropObject {
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
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const PotatoSeeds();

  @override
  String get code => 'potato';
}

class PotatoSeeds extends SeedsObject {
  const PotatoSeeds() : super(crop: const Potato());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'potato_seeds';
}

class Carrot implements CropObject {
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const CarrotSeeds();

  @override
  String get code => 'carrot';
}

class CarrotSeeds extends SeedsObject {
  const CarrotSeeds() : super(crop: const Carrot());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'carrot_seeds';
}

class Corn implements CropObject {
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
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const CornSeeds();

  @override
  String get code => 'corn';
}

class CornSeeds extends SeedsObject {
  const CornSeeds() : super(crop: const Corn());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'corn_seeds';
}

class TomaRoot implements CropObject {
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
  SeedsObject get seeds => const TomaRootSeeds();

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  String get code => throw UnimplementedError();
}

class TomaRootSeeds extends SeedsObject {
  const TomaRootSeeds() : super(crop: const TomaRoot());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => throw UnimplementedError();
}

class Asparagus implements CropObject {
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
  SeedsObject get seeds => const AsparagusSeeds();

  @override
  String get code => throw UnimplementedError();
}

class AsparagusSeeds extends SeedsObject {
  const AsparagusSeeds() : super(crop: const Asparagus());

  @override
  String get name => 'Asparagus Seeds';

  @override
  String get code => throw UnimplementedError();
}

class Watermelon implements CropObject {
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
  SeedsObject get seeds => const WatermelonSeeds();

  @override
  String get code => throw UnimplementedError();
}

class WatermelonSeeds extends SeedsObject {
  const WatermelonSeeds() : super(crop: const Watermelon());

  @override
  String get name => 'Watermelon Seeds';

  @override
  String get code => throw UnimplementedError();
}

class Pumpkin implements CropObject {
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
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const PumpkinSeeds();

  @override
  String get code => throw UnimplementedError();
}

class PumpkinSeeds extends SeedsObject {
  const PumpkinSeeds() : super(crop: const Pumpkin());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => throw UnimplementedError();
}

class Eggplant implements CropObject {
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const EggplantSeeds();

  @override
  String get code => 'eggplant';
}

class EggplantSeeds extends SeedsObject {
  const EggplantSeeds() : super(crop: const Eggplant());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'eggplant_seeds';
}

class Garlic implements CropObject {
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const GarlicSeeds();

  @override
  String get code => 'garlic';
}

class GarlicSeeds extends SeedsObject {
  const GarlicSeeds() : super(crop: const Garlic());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'garlic_seeds';
}

class Onion implements CropObject {
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
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const OnionSeeds();

  @override
  String get code => throw UnimplementedError();
}

class OnionSeeds extends SeedsObject {
  const OnionSeeds() : super(crop: const Onion());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'onion_seeds';
}

class Pepper implements CropObject {
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const PepperSeeds();

  @override
  String get code => 'pepper';
}

class PepperSeeds extends SeedsObject {
  const PepperSeeds() : super(crop: const Pepper());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'pepper_seeds';
}

class Pomegranate implements CropObject {
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
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.fruit, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const PomegranateSeeds();

  @override
  String get code => 'pomegranate';
}

class PomegranateSeeds extends SeedsObject {
  const PomegranateSeeds() : super(crop: const Pomegranate());

  @override
  String get name => throw UnimplementedError();

  @override
  String get code => 'pomegranate_seeds';
}

class DragonFruit implements CropObject {
  const DragonFruit();

  @override
  String get code => 'dragonfruit';

  @override
  String get assetName => 'dragon_fruit';

  @override
  String get name => 'Dragon Fruit';

  @override
  Nutrient get nutrient => const Nutrient(compost: 4, growthFormula: 4, manure: -8);

  @override
  Seasons get seasons => {Season.spring, Season.summer};

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.fruit, 1.0)});

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const DragonFruitSeeds();
}

class DragonFruitSeeds extends SeedsObject {
  const DragonFruitSeeds() : super(crop: const DragonFruit());

  @override
  String get code => 'dragonfruit_seeds';

  @override
  String get name => throw UnimplementedError();
}

class Durian implements CropObject {
  const Durian();

  @override
  String get code => 'durian';

  @override
  String get assetName => 'durian';

  @override
  String get name => 'Durian';

  @override
  Nutrient get nutrient => const Nutrient(compost: -8, growthFormula: 4, manure: 4);

  @override
  Seasons get seasons => {Season.spring};

  @override
  FoodValues? get foodValues => const FoodValues({
        FoodValue(FoodValueCategory.fruit, 1.0),
        FoodValue(FoodValueCategory.monster, 1.0),
      });

  @override
  FoodType get type => FoodType.veggie;

  @override
  SeedsObject get seeds => const DurianSeeds();
}

class DurianSeeds extends SeedsObject {
  const DurianSeeds() : super(crop: const Durian());

  @override
  String get code => 'durian_seeds';

  @override
  String get name => throw UnimplementedError();
}

class ForgetMeLots implements WeedObject, FoodObject, IngredientObject {
  const ForgetMeLots();

  @override
  String get code => throw UnimplementedError();

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
  FoodType get type => throw UnimplementedError();
}

class FireNettleFronds implements WeedObject, FoodObject {
  @override
  String get assetName => 'fire_nettle_fronds';

  @override
  String get code => 'firenettles';

  @override
  String get name => 'Fire Nettle Fronds';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};

  @override
  FoodType get type => FoodType.veggie;
}

class Tillweeds implements WeedObject, FoodObject {
  @override
  String get assetName => 'tillweeds';

  @override
  String get code => 'tillweed';

  @override
  String get name => 'Tillweeds';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};

  @override
  FoodType get type => FoodType.veggie;
}

class SpinyBindweed implements WeedObject {
  @override
  String get assetName => 'spiny_bindweed';

  @override
  String get code => 'weed_ivy';

  @override
  String get name => 'Spiny Bindweed';

  @override
  Nutrient get nutrient => const Nutrient(compost: -2, growthFormula: -2, manure: -2);

  @override
  Seasons get seasons => {};
}

//
// Recipes
//

class Recipes {
  static List<RecipeObject> get recipes {
    return [
      const ButterMuffin(),
      const Fishsticks(),
      const FroggleBunwich(),
      const HoneyHam(),
      const HoneyNuggets(),
      const Meatballs(),
      const MeatyStew(),
      const PumpkinCookie(),
      const StuffedEggplant(),
      const Taffy(),
      const Amberosia(),
      const Asparagazpacho(),
      const AsparagusSoup(),
      const BaconAndEggs(),
      const BananaPop(),
      const BananaShake(),
      const BarnacleLinguine(),
      const BarnacleNigiri(),
      const BarnaclePita(),
      const BeefaloTreats(),
      const BeefyGreens(),
      const BoneBouillon(),
      const BreakfastSkillet(),
      const BunnyStew(),
      const CaliforniaRoll(),
      const Ceviche(),
      const Dragonpie(),
      const FancySpiralledTubers(),
      const FigStuffedTrunk(),
      const Figatoni(),
      const FiggyFrogwich(),
      const Figkabab(),
      const FishCordonBleu(),
      const FishTacos(),
      const FistFullOfJam(),
      const FlowerSalad(),
      const FreshFruitCrepes(),
      const FrozenBananaDaiquiri(),
      const FruitMedley(),
      const GlowBerryMousse(),
      const GrimGalette(),
      const Guacamole(),
      const HotDragonChiliSalad(),
      const IceCream(),
      const JellySalad(),
      const Jellybeans(),
      const Kabobs(),
      const LeafyMeatloaf(),
      const MandrakeSoup(),
      const MashedPotatoes(),
      const Melonsicle(),
      const MilkmadeHat(),
      const MonsterLasagna(),
      const MonsterTartare(),
      const Moqueca(),
      const MushyCake(),
      const Pierogi(),
      const PlainOmelette(),
      const Powdercake(),
      const PuffedPotatoSouffle(),
      const Ratatouille(),
      const SalsaFresca(),
      const SeafoodGumbo(),
      const SoothingTea(),
      const SpicyChili(),
      const SteamedTwigs(),
      const StuffedFishHeads(),
      const StuffedPepperPoppers(),
      const SurfNTurf(),
      const TallScotchEggs(),
      const TrailMix(),
      const TurkeyDinner(),
      const Unagi(),
      const VegetableStinger(),
      const VeggieBurger(),
      const VoltGoatChaudFroid(),
      const Waffles(),
      const WetGoop(),
      const WobsterBisque(),
      const WobsterDinner(),
    ];
  }
}

class ButterMuffin extends RecipeObject implements FoodObject {
  const ButterMuffin()
      : super(
          code: 'butterflymuffin',
          assetName: 'butter_muffin',
          priority: 1,
          requirements: const Requirements({
            OrRequirement({
              ContainingRequirement(ButterflyWings()),
              ContainingRequirement(MoonMothWings()),
            }),
            MeetRequirement(FoodValues({
              FoodValue(FoodValueCategory.vegetable, 0.5),
            })),
            NoRequirement(categories: {FoodValueCategory.meat}),
          }),
        );

  @override
  String get name => 'Butter Muffin';

  @override
  FoodType get type => FoodType.veggie;
}

class Fishsticks extends RecipeObject {
  const Fishsticks()
      : super(
          code: '',
          assetName: '',
          priority: 10,
          requirements: const Requirements({
            AtLeastRequirement({FoodValueCategory.fish}),
            ContainingRequirement(Twigs()),
            MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)), // Fillers cannot be `Inedibles`.
          }),
        );

  @override
  String get assetName => 'fishsticks';

  @override
  String get name => 'Fishsticks';

  @override
  FoodType get type => throw UnimplementedError();
}

class FroggleBunwich extends RecipeObject {
  const FroggleBunwich()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'froggle_bunwich';

  @override
  String get name => 'Froggle Bunwich';

  @override
  FoodType get type => throw UnimplementedError();
}

class Taffy extends RecipeObject {
  const Taffy()
      : super(
          code: '',
          assetName: '',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Honey(), 3),
            NoRequirement(categories: {FoodValueCategory.meat}),
          }),
        );

  @override
  String get assetName => 'taffy';

  @override
  String get name => 'Taffy';

  @override
  FoodType get type => throw UnimplementedError();
}

class PumpkinCookie extends RecipeObject {
  const PumpkinCookie()
      : super(
          code: '',
          assetName: 'pumpkin_cookie',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Pumpkin()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.sweetener, 2.0)})),
          }),
        );

  @override
  String get name => 'Pumpkin Cookie';

  @override
  FoodType get type => FoodType.veggie;
}

class StuffedEggplant extends RecipeObject {
  const StuffedEggplant()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'stuffed_eggplant';

  @override
  String get name => 'Stuffed Eggplant';

  @override
  FoodType get type => throw UnimplementedError();
}

class HoneyNuggets extends RecipeObject {
  const HoneyNuggets()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'honey_nuggets';

  @override
  String get name => 'Honey Nuggets';

  @override
  FoodType get type => throw UnimplementedError();
}

class HoneyHam extends RecipeObject {
  const HoneyHam()
      : super(
          code: '',
          assetName: '',
          priority: 2,
          requirements: const Requirements({
            ContainingRequirement(Honey()),
            ExcessRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 1.5)})),
            NoRequirement(categories: {FoodValueCategory.inedible}),
            MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
          }),
        );

  @override
  String get assetName => 'honey_ham';

  @override
  String get name => 'Honey Ham';

  @override
  FoodType get type => throw UnimplementedError();
}

class Dragonpie extends RecipeObject {
  const Dragonpie()
      : super(
          code: '',
          assetName: '',
          priority: 1,
          requirements: const Requirements({
            ContainingRequirement(DragonFruit()),
            NoRequirement(categories: {FoodValueCategory.meat}),
          }),
        );

  @override
  String get assetName => 'dragonpie';

  @override
  String get name => 'Dragonpie';

  @override
  FoodType get type => throw UnimplementedError();
}

class Kabobs extends RecipeObject {
  const Kabobs()
      : super(
          code: '',
          assetName: '',
          priority: 5,
          requirements: const Requirements({
            AtLeastRequirement({FoodValueCategory.meat}),
            ContainingRequirement(Twigs()),
            // Actually, `NoRequirement` should be here, but it requires 1 Twigs.
            MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)),
            MaxRequirement(FoodValue(FoodValueCategory.monster, 1.0)),
          }),
        );

  @override
  String get assetName => 'kabobs';

  @override
  String get name => 'Kabobs';

  @override
  FoodType get type => throw UnimplementedError();
}

class MandrakeSoup extends RecipeObject {
  const MandrakeSoup()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'mandrake_soup';

  @override
  String get name => 'Mandrake Soup';

  @override
  FoodType get type => throw UnimplementedError();
}

class BaconAndEggs extends RecipeObject {
  const BaconAndEggs()
      : super(
          code: '',
          assetName: '',
          priority: 10,
          requirements: const Requirements({
            ExcessRequirement(FoodValues({
              FoodValue(FoodValueCategory.meat, 1.0),
              FoodValue(FoodValueCategory.egg, 1.0),
            })),
            NoRequirement(categories: {FoodValueCategory.vegetable}),
          }),
        );

  @override
  String get assetName => 'bacon_and_eggs';

  @override
  String get name => 'Bacon and Eggs';

  @override
  FoodType get type => throw UnimplementedError();
}

class Meatballs extends RecipeObject {
  const Meatballs()
      : super(
          code: 'meatballs',
          assetName: 'meatballs',
          priority: -1,
          requirements: const Requirements({
            AtLeastRequirement({FoodValueCategory.meat}),
            NoRequirement(categories: {FoodValueCategory.inedible})
          }),
        );

  @override
  String get name => 'Meatballs';

  @override
  FoodType get type => FoodType.meat;
}

class MeatyStew extends RecipeObject {
  const MeatyStew()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 3.0)})),
            NoRequirement(
              categories: {FoodValueCategory.inedible},
              ingredients: {TallbirdEgg(), Mandrake()},
            )
          }),
        );

  @override
  String get assetName => 'meaty_stew';

  @override
  String get name => 'Meaty Stew';

  @override
  FoodType get type => FoodType.meat;

  // @override
  // bool canBeCookedWith(Ingredients ingredients) {

  //   return ingredients.meatValue.meets(3) &&
  //       !ingredients.containInedible &&
  //       !ingredients.containTallbirdEgg &&
  //       !ingredients.containMandrake;
  // }
}

class Pierogi extends RecipeObject implements FoodObject {
  const Pierogi()
      : super(
          code: '',
          assetName: 'pierogi',
          priority: 5,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.egg, 1.0)})),
            AtLeastRequirement({FoodValueCategory.meat, FoodValueCategory.vegetable}),
            NoRequirement(categories: {FoodValueCategory.inedible}),
          }),
        );

  @override
  String get name => 'Pierogi';

  @override
  FoodType get type => throw UnimplementedError();
}

class TurkeyDinner extends RecipeObject implements FoodObject {
  const TurkeyDinner()
      : super(
          code: 'turkeydinner',
          assetName: 'turkey_dinner',
          priority: 0,
          requirements: const Requirements({
            ContainingRequirement(Drumstick(), 2),
            // Due to 2 drumstick + any meat value.
            ExcessRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 1.0)})),
            OrRequirement({
              MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 0.5)})),
              MeetRequirement(FoodValues({FoodValue(FoodValueCategory.fruit, 0.5)})),
            }),
          }),
        );

  @override
  String get name => 'Turkey Dinner';

  @override
  FoodType get type => FoodType.meat;
}

class Ratatouille extends RecipeObject implements FoodObject {
  const Ratatouille()
      : super(
          code: '',
          assetName: 'ratatouille',
          priority: 0,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 0.5)})),
            NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
          }),
        );

  @override
  String get name => 'Ratatouille';

  @override
  FoodType get type => throw UnimplementedError();
}

class FistFullOfJam extends RecipeObject implements FoodObject {
  const FistFullOfJam()
      : super(
          code: 'jammypreserves',
          assetName: 'fist_full_of_jam',
          priority: 0,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.fruit, 0.5)})),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.vegetable,
              FoodValueCategory.inedible,
            })
          }),
        );

  @override
  String get name => 'Fist Full of Jam';

  @override
  FoodType get type => FoodType.veggie;
}

class FruitMedley extends RecipeObject implements FoodObject {
  const FruitMedley()
      : super(
          code: 'fruitmedley',
          assetName: 'fruit_medley',
          priority: 0,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.fruit, 3.0)})),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.vegetable,
            })
          }),
        );

  @override
  String get name => 'Fruit Medley';

  @override
  FoodType get type => FoodType.veggie;
}

class FishTacos extends RecipeObject {
  const FishTacos()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fish_tacos';

  @override
  String get name => 'Fish Tacos';

  @override
  FoodType get type => throw UnimplementedError();
}

class Waffles extends RecipeObject implements FoodObject {
  const Waffles()
      : super(
          code: 'waffles',
          assetName: 'waffles',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Butter()),
            ContainingRequirement(Berries()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.egg, 1.0)})),
          }),
        );

  @override
  String get name => 'Waffles';

  @override
  FoodType get type => FoodType.veggie;
}

class MonsterLasagna extends RecipeObject {
  const MonsterLasagna()
      : super(
          code: '',
          assetName: 'monster_lasagna',
          priority: 10,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.monster, 2.0)})),
            NoRequirement(categories: {FoodValueCategory.inedible}),
          }),
        );

  @override
  String get name => 'Monster Lasagna';

  @override
  FoodType get type => FoodType.meat;
}

class Powdercake extends RecipeObject {
  const Powdercake()
      : super(
          code: '',
          assetName: 'powdercake',
          priority: 10,
          requirements: const Requirements({
            OrRequirement({
              ContainingRequirement(Corn()),
              ContainingRequirement(Popperfish()),
            }),
            ContainingRequirement(Honey()),
            ContainingRequirement(Twigs()),
          }),
        );

  @override
  String get name => 'Powdercake';

  @override
  FoodType get type => throw UnimplementedError();
}

class Unagi extends RecipeObject {
  const Unagi()
      : super(
          code: '',
          assetName: 'unagi',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Unagi';

  @override
  FoodType get type => throw UnimplementedError();
}

class WetGoop extends RecipeObject {
  const WetGoop()
      : super(
          code: '',
          assetName: 'wet_goop',
          priority: -2,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Wet Goop';

  @override
  FoodType get type => throw UnimplementedError();
}

class FlowerSalad extends RecipeObject {
  const FlowerSalad()
      : super(
          code: '',
          assetName: 'flower_salad',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Flower Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class IceCream extends RecipeObject {
  const IceCream()
      : super(
          code: '',
          assetName: 'ice_cream',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Ice()),
            MeetRequirement(FoodValues({
              FoodValue(FoodValueCategory.dairy, 1.0),
              FoodValue(FoodValueCategory.sweetener, 1.0),
            })),
          }),
        );

  @override
  String get name => 'Ice Cream';

  @override
  FoodType get type => throw UnimplementedError();
}

class Melonsicle extends RecipeObject {
  const Melonsicle()
      : super(
          code: '',
          assetName: 'melonsicle',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Watermelon()),
            ContainingRequirement(Ice()),
            ContainingRequirement(Twigs()),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.egg,
              FoodValueCategory.vegetable,
            }),
          }),
        );

  @override
  String get name => 'Melonsicle';

  @override
  FoodType get type => throw UnimplementedError();
}

class TrailMix extends RecipeObject implements FoodObject {
  const TrailMix()
      : super(
          code: '',
          assetName: 'trail_mix',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(RoastedBirchnut()),
            OrRequirement({
              ContainingRequirement(Berries()),
              ContainingRequirement(JuicyBerries()),
            }),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.fruit, 0.5)})),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.egg,
              FoodValueCategory.vegetable,
              FoodValueCategory.dairy,
            }),
          }),
        );

  @override
  String get name => 'Trail Mix';

  @override
  FoodType get type => throw UnimplementedError();
}

class SpicyChili extends RecipeObject implements FoodObject {
  const SpicyChili()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'spicy_chili';

  @override
  String get name => 'Spicy Chili';

  @override
  FoodType get type => throw UnimplementedError();
}

class Guacamole extends RecipeObject implements FoodObject {
  const Guacamole()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'guacamole';

  @override
  String get name => 'Guacamole';

  @override
  FoodType get type => throw UnimplementedError();
}

class BananaPop extends RecipeObject implements FoodObject {
  const BananaPop()
      : super(
          code: '',
          assetName: 'banana_pop',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Banana Pop';

  @override
  FoodType get type => throw UnimplementedError();
}

class CaliforniaRoll extends RecipeObject implements FoodObject {
  const CaliforniaRoll()
      : super(
          code: '',
          assetName: 'california_roll',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'California Roll';

  @override
  FoodType get type => throw UnimplementedError();
}

class Ceviche extends RecipeObject {
  const Ceviche()
      : super(
          code: '',
          assetName: 'ceviche',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Ceviche';

  @override
  FoodType get type => throw UnimplementedError();
}

class WobsterBisque extends RecipeObject {
  const WobsterBisque()
      : super(
          code: '',
          assetName: 'wobster_bisque',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Wobster Bisque';

  @override
  FoodType get type => throw UnimplementedError();
}

class WobsterDinner extends RecipeObject {
  const WobsterDinner()
      : super(
          code: '',
          assetName: 'wobster_dinner',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Wobster Dinner';

  @override
  FoodType get type => throw UnimplementedError();
}

class SeafoodGumbo extends RecipeObject {
  const SeafoodGumbo()
      : super(
          code: '',
          assetName: 'seafood_gumbo',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Seafood Gumbo';

  @override
  FoodType get type => throw UnimplementedError();
}

class SurfNTurf extends RecipeObject {
  const SurfNTurf()
      : super(
          code: '',
          assetName: 'surf_n_turf',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Surf \'n\' Turf';

  @override
  FoodType get type => throw UnimplementedError();
}

class Jellybeans extends RecipeObject implements FoodObject {
  const Jellybeans()
      : super(
          code: '',
          assetName: 'jellybeans',
          priority: 12,
          requirements: const Requirements({
            ContainingRequirement(RoyalJelly()),
            NoRequirement(categories: {
              FoodValueCategory.inedible,
              FoodValueCategory.monster,
            })
          }),
        );

  @override
  String get name => 'Jellybeans';

  @override
  FoodType get type => FoodType.goodies;
}

class VegetableStinger extends RecipeObject implements FoodObject {
  const VegetableStinger()
      : super(
          code: '',
          assetName: 'vegetable_stinger',
          priority: 15,
          requirements: const Requirements({
            OrRequirement({
              ContainingRequirement(Asparagus()),
              ContainingRequirement(TomaRoot()),
            }),
            ContainingRequirement(Ice()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 1.5)})),
          }),
        );

  @override
  String get name => 'Vegetable Stinger';

  @override
  FoodType get type => throw UnimplementedError();

  @override
  List<String> get ingredientListAssetNames =>
      [const TomaRoot().assetName, const Ice().assetName, FoodValueCategory.vegetable.assetName];
}

class AsparagusSoup extends RecipeObject implements FoodObject {
  const AsparagusSoup()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'asparagus_soup';

  @override
  String get name => 'Asparagus Soup';

  @override
  FoodType get type => throw UnimplementedError();
}

class StuffedPepperPoppers extends RecipeObject implements FoodObject {
  const StuffedPepperPoppers()
      : super(
          code: '',
          assetName: '',
          priority: 20,
          requirements: const Requirements({
            ContainingRequirement(Pepper()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 0.5)})),
            NoRequirement(categories: {FoodValueCategory.inedible}),
            MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
          }),
        );

  @override
  String get assetName => 'stuffed_pepper_poppers';

  @override
  String get name => 'Stuffed Pepper Poppers';

  @override
  FoodType get type => throw UnimplementedError();
}

class SalsaFresca extends RecipeObject implements FoodObject {
  const SalsaFresca()
      : super(
          code: '',
          assetName: 'salsa_fresca',
          priority: 20,
          requirements: const Requirements({
            ContainingRequirement(TomaRoot()),
            ContainingRequirement(Onion()),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.inedible,
              FoodValueCategory.egg,
            })
          }),
        );

  @override
  String get name => 'Salsa Fresca';

  @override
  FoodType get type => throw UnimplementedError();
}

class FancySpiralledTubers extends RecipeObject implements FoodObject {
  const FancySpiralledTubers()
      : super(
          code: '',
          assetName: '',
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Potato()),
            ContainingRequirement(Twigs()),
            NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.monster}),
            MaxRequirement(FoodValue(FoodValueCategory.inedible, 2.0)),
          }),
        );

  @override
  String get assetName => 'fancy_spiralled_tubers';

  @override
  String get name => 'Fancy Spiralled Tubers';

  @override
  FoodType get type => throw UnimplementedError();
}

class BarnaclePita extends RecipeObject {
  const BarnaclePita()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'barnacle_pita';

  @override
  String get name => 'Barnacle Pita';

  @override
  FoodType get type => throw UnimplementedError();
}

class BarnacleNigiri extends RecipeObject {
  const BarnacleNigiri()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'barnacle_nigiri';

  @override
  String get name => 'Barnacle Nigiri';

  @override
  FoodType get type => throw UnimplementedError();
}

class BarnacleLinguine extends RecipeObject {
  const BarnacleLinguine()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'barnacle_linguine';

  @override
  String get name => 'Barnacle Linguine';

  @override
  FoodType get type => throw UnimplementedError();
}

class StuffedFishHeads extends RecipeObject {
  const StuffedFishHeads()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'stuffed_fish_heads';

  @override
  String get name => 'Stuffed Fish Heads';

  @override
  FoodType get type => throw UnimplementedError();
}

class MushyCake extends RecipeObject {
  const MushyCake()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'mushy_cake';

  @override
  String get name => 'Mushy Cake';

  @override
  FoodType get type => throw UnimplementedError();
}

class SoothingTea extends RecipeObject implements FoodObject {
  const SoothingTea()
      : super(
          code: '',
          assetName: '',
          priority: 1,
          requirements: const Requirements({
            ContainingRequirement(ForgetMeLots()),
            ContainingRequirement(Honey()),
            ContainingRequirement(Ice()),
            NoRequirement(categories: {
              FoodValueCategory.meat,
              FoodValueCategory.monster,
              FoodValueCategory.fish,
              FoodValueCategory.vegetable,
              FoodValueCategory.inedible,
              FoodValueCategory.dairy,
              FoodValueCategory.egg,
            }),
          }),
        );

  @override
  String get assetName => 'soothing_tea';

  @override
  String get name => 'Soothing Tea';

  @override
  FoodType get type => throw UnimplementedError();
}

class FigStuffedTrunk extends RecipeObject implements FoodObject {
  const FigStuffedTrunk()
      : super(
          code: '',
          assetName: 'fig_stuffed_trunk',
          priority: 40,
          requirements: const Requirements({
            ContainingRequirement(Fig()),
            OrRequirement({
              ContainingRequirement(KoalefantTrunk()),
              ContainingRequirement(WinterKoalefantTrunk()),
            }),
          }),
        );

  @override
  String get name => 'Fig-Stuffed Trunk';

  @override
  FoodType get type => throw UnimplementedError();
}

class Figatoni extends RecipeObject implements FoodObject {
  const Figatoni()
      : super(
          code: '',
          assetName: 'figatoni',
          priority: 30,
          requirements: const Requirements({
            ContainingRequirement(Fig()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 2.0)})),
            NoRequirement(categories: {FoodValueCategory.meat}),
          }),
        );

  @override
  String get name => 'Figatoni';

  @override
  FoodType get type => throw UnimplementedError();
}

class Figkabab extends RecipeObject implements FoodObject {
  const Figkabab()
      : super(
          code: '',
          assetName: '',
          priority: 30,
          requirements: const Requirements({
            ContainingRequirement(Fig()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 1.0)})),
            ContainingRequirement(Twigs()),
          }),
        );

  @override
  String get assetName => 'figkabab';

  @override
  String get name => 'Figkabab';

  @override
  FoodType get type => throw UnimplementedError();
}

class FiggyFrogwich extends RecipeObject implements FoodObject {
  const FiggyFrogwich()
      : super(
          code: '',
          assetName: '',
          priority: 1,
          requirements: const Requirements({
            ContainingRequirement(Fig()),
            ContainingRequirement(FrogLegs()),
          }),
        );

  @override
  String get assetName => 'figgy_frogwich';

  @override
  String get name => 'Figgy Frogwich';

  @override
  FoodType get type => throw UnimplementedError();
}

class FrozenBananaDaiquiri extends RecipeObject implements FoodObject {
  const FrozenBananaDaiquiri()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'frozen_banana_daiquiri';

  @override
  String get name => 'Frozen Banana Daiquiri';

  @override
  FoodType get type => throw UnimplementedError();
}

class BunnyStew extends RecipeObject {
  const BunnyStew()
      : super(
          code: '',
          assetName: '',
          priority: 1,
          requirements: const Requirements({
            AtLeastRequirement({FoodValueCategory.meat}),
            ContainingRequirement(Ice(), 2),
            NoRequirement(categories: {FoodValueCategory.inedible}),
            MaxRequirement(FoodValue(FoodValueCategory.meat, 0.75)),
          }),
        );

  @override
  String get assetName => 'bunny_stew';

  @override
  String get name => 'Bunny Stew';

  @override
  FoodType get type => throw UnimplementedError();
}

class BananaShake extends RecipeObject implements FoodObject {
  const BananaShake()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'banana_shake';

  @override
  String get name => 'Banana Shake';

  @override
  FoodType get type => throw UnimplementedError();
}

class PlainOmelette extends RecipeObject implements FoodObject {
  const PlainOmelette()
      : super(
          code: '',
          assetName: 'plain_omelette',
          priority: 1,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.egg, 3.0)})),
          }),
        );

  @override
  String get name => 'Plain Omelette';

  @override
  FoodType get type => throw UnimplementedError();
}

class BreakfastSkillet extends RecipeObject implements FoodObject {
  const BreakfastSkillet()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'breakfast_skillet';

  @override
  String get name => 'Breakfast Skillet';

  @override
  FoodType get type => throw UnimplementedError();
}

class TallScotchEggs extends RecipeObject implements FoodObject {
  const TallScotchEggs()
      : super(
          code: '',
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'tall_scotch_eggs';

  @override
  String get name => 'Tall Scotch Eggs';

  @override
  FoodType get type => throw UnimplementedError();
}

class SteamedTwigs extends RecipeObject {
  const SteamedTwigs()
      : super(
          code: '',
          assetName: 'steamed_twigs',
          priority: -5,
          requirements: const Requirements({
            ContainingRequirement(Twigs(), 3),
            NoRequirement(
              ingredients: {NightmareFuel()},
              categories: {
                FoodValueCategory.meat,
                FoodValueCategory.egg,
                FoodValueCategory.dairy,
              },
            ),
          }),
        );

  @override
  String get name => 'Steamed Twigs';

  @override
  FoodType get type => throw UnimplementedError();
}

class BeefaloTreats extends RecipeObject {
  const BeefaloTreats()
      : super(
          code: '',
          assetName: 'beefalo_treats',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Beefalo Treats';

  @override
  FoodType get type => throw UnimplementedError();
}

class LeafyMeatloaf extends RecipeObject {
  const LeafyMeatloaf()
      : super(
          code: '',
          assetName: 'leafy_meatloaf',
          priority: 25,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat(), 2),
          }),
        );

  @override
  String get name => 'Leafy Meatloaf';

  @override
  FoodType get type => FoodType.meat;
}

class VeggieBurger extends RecipeObject {
  const VeggieBurger()
      : super(
          code: '',
          assetName: 'veggie_burger',
          priority: 25,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat()),
            ContainingRequirement(Onion()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 2.0)})),
          }),
        );

  @override
  String get name => 'Veggie Burger';

  @override
  FoodType get type => throw UnimplementedError();
}

class JellySalad extends RecipeObject {
  const JellySalad()
      : super(
          code: '',
          assetName: 'jelly_salad',
          priority: 50,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat(), 2),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.sweetener, 2.0)})),
          }),
        );

  @override
  String get name => 'Jelly Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class BeefyGreens extends RecipeObject {
  const BeefyGreens()
      : super(
          code: '',
          assetName: 'beefy_greens',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Beefy Greens';

  @override
  FoodType get type => throw UnimplementedError();
}

class MilkmadeHat extends RecipeObject {
  const MilkmadeHat()
      : super(
          code: '',
          assetName: 'milkmade_hat',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Milkmade Hat';

  @override
  FoodType get type => throw UnimplementedError();
}

class Amberosia extends RecipeObject {
  const Amberosia()
      : super(
          code: '',
          assetName: 'amberosia',
          priority: 100,
          requirements: const Requirements({ContainingRequirement(CollectedDust())}),
        );

  @override
  String get name => 'Amberosia';

  @override
  FoodType get type => throw UnimplementedError();
}

class BeetSalho extends RecipeObject {
  const BeetSalho()
      : super(
          code: '',
          assetName: 'beet_salho',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Beet Salho';

  @override
  FoodType get type => throw UnimplementedError();
}

class CricketCrackers extends RecipeObject {
  const CricketCrackers()
      : super(
          code: '',
          assetName: 'cricket_crackers',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Cricket Crackers';

  @override
  FoodType get type => throw UnimplementedError();
}

class LeafySalad extends RecipeObject {
  const LeafySalad()
      : super(
          code: '',
          assetName: 'leafy_salad',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Leafy Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class Leafloaf extends RecipeObject {
  const Leafloaf()
      : super(
          code: '',
          assetName: 'leafloaf',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Leafloaf';

  @override
  FoodType get type => throw UnimplementedError();
}

class MixedVegetable extends RecipeObject {
  const MixedVegetable()
      : super(
          code: '',
          assetName: 'mixed_vegetable',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Mixed Vegetable';

  @override
  FoodType get type => throw UnimplementedError();
}

class BoneBouillon extends RecipeObject {
  const BoneBouillon()
      : super(
          code: '',
          assetName: 'bone_bouillon',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Bone Bouillon';

  @override
  FoodType get type => throw UnimplementedError();
}

class Moqueca extends RecipeObject {
  const Moqueca()
      : super(
          code: '',
          assetName: 'moqueca',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Moqueca';

  @override
  FoodType get type => throw UnimplementedError();
}

class MonsterTartare extends RecipeObject {
  const MonsterTartare()
      : super(
          code: '',
          assetName: 'monster_tartare',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Monster Tartare';

  @override
  FoodType get type => throw UnimplementedError();
}

class CreamyFettuccine extends RecipeObject {
  const CreamyFettuccine()
      : super(
          code: '',
          assetName: 'creamy_fettuccine',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Creamy Fettuccine';

  @override
  FoodType get type => throw UnimplementedError();
}

class Fruitcake extends RecipeObject {
  const Fruitcake()
      : super(
          code: '',
          assetName: 'fruitcake',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Fruitcake';

  @override
  FoodType get type => throw UnimplementedError();
}

class FreshFruitCrepes extends RecipeObject {
  const FreshFruitCrepes()
      : super(
          code: '',
          assetName: 'fresh_fruit_crepes',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Fresh Fruit Crepes';

  @override
  FoodType get type => throw UnimplementedError();
}

class HotChili extends RecipeObject {
  const HotChili()
      : super(
          code: '',
          assetName: 'hot_chili',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Hot Chili';

  @override
  FoodType get type => throw UnimplementedError();
}

class GlowBerryMousse extends RecipeObject {
  const GlowBerryMousse()
      : super(
          code: '',
          assetName: 'glow_berry_mousse',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Glow Berry Mousse';

  @override
  FoodType get type => throw UnimplementedError();
}

class MashedPotatoes extends RecipeObject {
  const MashedPotatoes()
      : super(
          code: '',
          assetName: 'mashedpotatoes',
          priority: 20,
          requirements: const Requirements({
            ContainingRequirement(Potato(), 2),
            ContainingRequirement(Garlic()),
            NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
          }),
        );

  @override
  String get name => 'Creamy Potato Purée';

  @override
  FoodType get type => throw UnimplementedError();
}

class GrimGalette extends RecipeObject {
  const GrimGalette()
      : super(
          code: '',
          assetName: 'grim_galette',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Grim Galette';

  @override
  FoodType get type => throw UnimplementedError();
}

class VoltGoatChaudFroid extends RecipeObject {
  const VoltGoatChaudFroid()
      : super(
          code: '',
          assetName: 'volt_goat_chaud_froid',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Volt Goat Chaud Froid';

  @override
  FoodType get type => throw UnimplementedError();
}

class FishCordonBleu extends RecipeObject {
  const FishCordonBleu()
      : super(
          code: '',
          assetName: 'fish_cordon_bleu',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Fish Cordon Bleu';

  @override
  FoodType get type => throw UnimplementedError();
}

class HotDragonChiliSalad extends RecipeObject {
  const HotDragonChiliSalad()
      : super(
          code: '',
          assetName: 'hot_dragon_chili_salad',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Hot Dragon Chili Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class Asparagazpacho extends RecipeObject {
  const Asparagazpacho()
      : super(
          code: '',
          assetName: 'asparagazpacho',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Asparagazpacho';

  @override
  FoodType get type => throw UnimplementedError();
}

class PuffedPotatoSouffle extends RecipeObject {
  const PuffedPotatoSouffle()
      : super(
          code: '',
          assetName: 'puffed_potato_souffle',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get name => 'Puffed Potato Souffle';

  @override
  FoodType get type => throw UnimplementedError();
}

//
// Itmes
//

class Twigs implements IngredientObject {
  const Twigs();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'twigs';

  @override
  String get name => 'Twigs';

  @override
  final FoodValues? foodValues = const FoodValues({FoodValue(FoodValueCategory.inedible, 1.0)});
}

class NightmareFuel implements IngredientObject {
  const NightmareFuel();

  @override
  String get assetName => 'nightmare_fuel';

  @override
  String get code => 'nightmarefuel';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.inedible, 1.0)});
}

// class CookedAsparagus {}

class Barnacles implements FoodObject, IngredientObject {
  const Barnacles();

  @override
  String get code => 'barnacle';

  @override
  String get assetName => 'barnacles';

  @override
  String get name => 'Barnacles';

  @override
  FoodType get type => FoodType.meat;

  @override
  FoodValues? get foodValues => const FoodValues({
        FoodValue(FoodValueCategory.meat, 0.25),
        FoodValue(FoodValueCategory.fish, 0.25),
      });
}

// class CookedBarnacles {}

class BatiliskWing implements FoodObject, IngredientObject {
  const BatiliskWing();

  @override
  String get code => 'batwing';

  @override
  String get assetName => 'batilisk_wing';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 0.5)});

  @override
  String get name => 'Batilisk Wing';

  @override
  FoodType get type => FoodType.meat;
}

// class CookedBatiliskWing {}

class Berries implements FoodObject, IngredientObject {
  const Berries();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => throw UnimplementedError();

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 0.5)});

  @override
  String get name => throw UnimplementedError();

  @override
  FoodType get type => FoodType.veggie;
}

// class RoastedBerries {}

class RoastedBirchnut implements FoodObject, IngredientObject {
  const RoastedBirchnut();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'roasted_birchnut';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Roasted Birchnut';

  @override
  FoodType get type => FoodType.veggie;
}

class Butter extends FoodObject implements IngredientObject {
  const Butter()
      : super(
          code: 'butter',
          assetName: 'butter',
          type: FoodType.generic,
        );

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.dairy, 1.0)});
}

class ButterflyWings implements FoodObject, IngredientObject {
  const ButterflyWings();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'butterfly_wings';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Butterfly Wings';

  @override
  FoodType get type => FoodType.veggie;
}

class CactusFlesh {}

// class CookedCactusFlesh {}

class CactusFlower {}

// class RoastedCarrot {}

class Banana {}

// class CookedBanana {}

class Popcorn {}

class DeadWobster {}

class DeliciousWobster {}

class DeerclopsEyeball {}

class PreparedDragonFruit {}

class Drumstick implements FoodObject, IngredientObject {
  const Drumstick();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => throw UnimplementedError();

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();
}

// class FriedDrumstick {}

class ExtraSmellyDurian {}

class Eel {}

// class CookedEel {}

class ElectricMilk {}

class Egg implements FoodObject, IngredientObject {
  const Egg();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => throw UnimplementedError();

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();
}

// class CookedEgg {}

class BraisedEggplant {}

class Fig implements CookableFood, IngredientObject {
  const Fig();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'fig';

  @override
  String get compositeAssetName => 'figs';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.fruit, 0.5)});

  @override
  String get name => 'Fig';

  @override
  FoodType get type => FoodType.veggie;
}

// class CookedFig {}

class Fish {}

// class CookedFish {}

class FishMorsel {}

// class CookedFishMorsel {}

class Foliage {}

class FrogLegs implements FoodObject, IngredientObject {
  const FrogLegs();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'frog_legs';

  @override
  String get name => 'Frog Legs';

  @override
  FoodType get type => FoodType.meat;

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 0.5)});
}

// class CookedFrogLegs {}

// class RoastedGarlic {}

class GlowBerry {}

class LesserGlowBerry {}

class Honey implements FoodObject, IngredientObject {
  const Honey();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'honey';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.sweetener, 1.0)});

  @override
  String get name => 'Honey';

  @override
  FoodType get type => FoodType.generic;
}

class Ice implements FoodObject, IngredientObject {
  const Ice();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'ice';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => "Ice";

  @override
  FoodType get type => throw UnimplementedError();
}

class JuicyBerries implements CookableFood, IngredientObject {
  const JuicyBerries();

  @override
  String get code => 'berries_juicy';

  @override
  String get assetName => 'juicy_berries';

  @override
  String get compositeAssetName => 'juicy_berries';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.fruit, 0.5)});

  @override
  String get name => 'Juicy Berries';

  @override
  FoodType get type => FoodType.veggie;
}

// class RoastedJuicyBerries {}

class KelpFronds {}

// class CookedKelpFronds {}

class DriedKelpFronds {}

class KoalefantTrunk implements CookableFood, IngredientObject {
  const KoalefantTrunk();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'koalefant_trunk';

  @override
  String get compositeAssetName => 'koalefant_trunks';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Koalefant Trunk';

  @override
  FoodType get type => FoodType.meat;
}

class WinterKoalefantTrunk implements CookableFood, IngredientObject {
  const WinterKoalefantTrunk();

  @override
  String get code => 'trunk_summer';

  @override
  String get assetName => 'winter_koalefant_trunk';

  @override
  String get compositeAssetName => 'koalefant_trunks';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 1.0)});

  @override
  String get name => 'Winter Koalefant Trunk';

  @override
  FoodType get type => FoodType.meat;
}

// class KoalefantTrunkSteak {}

class LeafyMeat implements CookableFood, IngredientObject {
  const LeafyMeat();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'leafy_meat';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 1.0)});

  @override
  String get name => 'Leafy Meat';

  @override
  FoodType get type => FoodType.meat;

  @override
  String get compositeAssetName => 'leafy_meats';
}

// class CookedLeafyMeat {}

class Lichen {}

class LightBulb {}

class LuneTreeBlossom {}

class Mandrake implements FoodObject, IngredientObject {
  const Mandrake();

  @override
  String get code => 'mandrake';

  @override
  String get assetName => 'mandrake';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  String get name => 'Mandrake';

  @override
  FoodType get type => FoodType.veggie;
}

// class CookedMandrake {}

class Meat implements FoodObject, IngredientObject {
  const Meat();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'meat';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 1.0)});

  @override
  String get name => 'Meat';

  @override
  FoodType get type => FoodType.meat;
}

// class CookedMeat {}

// class Jerky {}

class MilkyWhites {}

class MonsterMeat implements FoodObject, IngredientObject {
  const MonsterMeat();

  @override
  String get code => 'monstermeat';

  @override
  String get assetName => 'monster_meat';

  @override
  String get name => 'Monster Meat';

  @override
  FoodType get type => FoodType.meat;

  @override
  FoodValues? get foodValues => const FoodValues({
        FoodValue(FoodValueCategory.meat, 1.0),
        FoodValue(FoodValueCategory.monster, 1.0),
      });
}

// class CookedMonsterMeat {}

// class MonsterJerky {}

class MoonShroom {}

// class CookedMoonShroom {}

class MoonMothWings implements FoodObject, IngredientObject {
  const MoonMothWings();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => throw UnimplementedError();

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();
}

class Morsel implements IngredientObject, FoodObject {
  const Morsel();

  @override
  String get code => throw UnimplementedError();

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 0.5)});

  @override
  FoodType get type => FoodType.meat;

  @override
  String get assetName => 'morsel';

  @override
  String get name => 'Morsel';
}

// class CookedMorsel {}

class SmallJerky {}

class BlueCap {}

// class CookedBlueCap {}

class GreenCap {}

// class CookedGreenCap {}

class RedCap implements FoodObject, IngredientObject {
  const RedCap();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => throw UnimplementedError();

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();
}

// class CookedRedCap {}

class NakedNostrils {}

class CharredNostrils {}

// class RoastedOnion {}

// class RoastedPepper {}

class Petals {}

class DarkPetals {}

class Phlegm {}

class SlicedPomegranate {}

// class RoastedPotato {}

class HotPumpkin {}

class RawFish {}

class FishSteak {}

class Rot implements FoodObject, FertilizerObject {
  const Rot();

  @override
  String get assetName => 'rot';

  @override
  String get code => 'spoiled_food';

  @override
  Nutrient get nutrient => const Nutrient(compost: 8, growthFormula: 0, manure: 0);

  @override
  FoodType get type => FoodType.generic;
}

class RottenEgg implements FoodObject, FertilizerObject {
  const RottenEgg();

  @override
  String get assetName => 'rotten_egg';

  @override
  String get code => 'rottenegg';

  @override
  Nutrient get nutrient => const Nutrient(compost: 16, growthFormula: 0, manure: 0);

  @override
  FoodType get type => FoodType.generic;
}

class RoyalJelly implements FoodObject, IngredientObject {
  const RoyalJelly();

  @override
  String get assetName => throw UnimplementedError();

  @override
  String get code => throw UnimplementedError();

  @override
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();
}

class Seeds implements FoodObject {
  const Seeds();

  @override
  String get code => 'seeds';

  @override
  String get assetName => 'seeds';

  @override
  FoodType get type => FoodType.seeds;
}

class ToastedSeeds {}

class CropSeeds {}

class RipeStoneFruit {}

// class CookedStoneFruit {}

class Succulent {}

class TallbirdEgg implements FoodObject, IngredientObject {
  const TallbirdEgg();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'tallbird_egg';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.egg, 4.0)});

  @override
  String get name => 'Tallbird Egg';

  @override
  FoodType get type => FoodType.meat;
}

// class HatchingTallbirdEgg {}

// class FriedTallbirdEgg {}

// class RoastedTomaRoot {}

class GrilledWatermelon {}

class StuffedNightCap {}

class CollectedDust implements IngredientObject {
  const CollectedDust();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'collected_dust';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Collected Dust';
}

class Popperfish implements IngredientObject {
  const Popperfish();

  @override
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'popperfish';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  String get name => throw 'Popperfish';
}

//
// Fertilizer
//

sealed class FertilizerObject extends DSTObject {
  const FertilizerObject({
    required super.code,
    required super.assetName,
    required this.nutrient,
  });

  final Nutrient nutrient;
}

class Fertilizers {
  static const List<FertilizerObject> fertilizers = [
    Manure(),
    Fertilizer(),
    Guano(),
    Compost(),
    RottenEgg(),
    Rot(),
    GrowthFormulaStarter(),
    FermentingGrowthFormula(),
    FermentedGrowthFormula(),
    SuperGrowthFormula(),
    SpoiledFish(),
    SpoiledFishMorsel(),
    CompostWrap(),
    GlommerFuel(),
    TreeJam(),
  ];

  static const List<FertilizerObject> compostList = [
    Rot(),
    RottenEgg(),
    Compost(),
  ];

  static const List<FertilizerObject> growthFormulaList = [
    SpoiledFishMorsel(),
    SpoiledFish(),
    GrowthFormulaStarter(),
  ];

  static const List<FertilizerObject> manureList = [
    Manure(),
    Guano(),
    Fertilizer(),
  ];

  static const List<FertilizerObject> mixList = [
    GlommerFuel(),
    TreeJam(),
    CompostWrap(),
  ];
}

class Manure implements FertilizerObject {
  const Manure();

  @override
  String get assetName => 'manure';

  @override
  String get code => 'poop';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 0, manure: 8);
}

// Bucket-o-poop
class Fertilizer implements FertilizerObject {
  const Fertilizer();

  @override
  String get assetName => 'bucket-o-poop';

  @override
  String get code => 'fertilizer';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 0, manure: 16);
}

class Guano implements FertilizerObject {
  const Guano();

  @override
  String get assetName => 'guano';

  @override
  String get code => 'guano';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 0, manure: 16);
}

class Compost implements FertilizerObject {
  const Compost();

  @override
  String get assetName => 'compost';

  @override
  String get code => 'compost';

  @override
  Nutrient get nutrient => const Nutrient(compost: 24, growthFormula: 0, manure: 0);
}

class GrowthFormulaStarter implements FertilizerObject {
  const GrowthFormulaStarter();

  @override
  String get assetName => 'growth_formula_starter';

  @override
  String get code => 'soil_amender';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 8, manure: 0);
}

class FermentingGrowthFormula implements FertilizerObject {
  const FermentingGrowthFormula();

  @override
  String get assetName => 'fermenting_growth_formula';

  @override
  String get code => 'soil_amender';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 16, manure: 0);
}

class FermentedGrowthFormula implements FertilizerObject {
  const FermentedGrowthFormula();

  @override
  String get assetName => 'fermented_growth_formula';

  @override
  String get code => 'soil_amender';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 32, manure: 0);
}

class SuperGrowthFormula implements FertilizerObject {
  const SuperGrowthFormula();

  @override
  String get assetName => 'super_growth_formula';

  @override
  String get code => 'soil_amender';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 32, manure: 0);
}

class SpoiledFish implements FertilizerObject {
  const SpoiledFish();

  @override
  String get assetName => 'spoiled_fish';

  @override
  String get code => 'spoiled_fish';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 16, manure: 0);
}

class SpoiledFishMorsel implements FertilizerObject {
  const SpoiledFishMorsel();

  @override
  String get assetName => 'spoiled_fish_morsel';

  @override
  String get code => 'spoiled_fish_small';

  @override
  Nutrient get nutrient => const Nutrient(compost: 0, growthFormula: 8, manure: 0);
}

class CompostWrap implements FertilizerObject {
  const CompostWrap();

  @override
  String get assetName => 'compost_wrap';

  @override
  String get code => 'compostwrap';

  @override
  Nutrient get nutrient => const Nutrient(compost: 32, growthFormula: 24, manure: 24);
}

class GlommerFuel implements FertilizerObject {
  const GlommerFuel();

  @override
  String get assetName => 'glommer_fuel';

  @override
  String get code => 'glommerfuel';

  @override
  Nutrient get nutrient => const Nutrient(compost: 8, growthFormula: 8, manure: 8);
} // Glommer's Goop

class TreeJam implements FertilizerObject {
  const TreeJam();

  @override
  String get assetName => 'tree_jam';

  @override
  String get code => 'treegrowthsolution';

  @override
  Nutrient get nutrient => const Nutrient(compost: 32, growthFormula: 8, manure: 8);
}
