import 'dart:math';

import 'package:dst_helper/models/food_value.dart';
import 'package:dst_helper/models/ingredients_analyser.dart';
import 'package:dst_helper/models/requirement.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/foundation.dart';

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

  Nutrient operator +(Nutrient right) => Nutrient(
        compost: compost + right.compost,
        growthFormula: growthFormula + right.growthFormula,
        manure: manure + right.manure,
      );
}

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
    var satisfiedRecipes = Recipes.recipes.where((recipe) => recipe.requirements.isMetFor(ingredientsAnalyser));
    if (satisfiedRecipes.length == 1) return true;
    var maxPriority = satisfiedRecipes.map((recipe) => recipe.priority).reduce(max);
    if (priority < maxPriority) return false;
    return true;
  }

  List<String> get ingredientListAssetNames {
    final requirements = this.requirements.rawRequirements.toList();
    requirements.sort((a, b) => a.runtimeType is ContainingRequirement ? 1 : 0);

    List<String> assets = [];
    List<IngredientObject> containedIngredient = [];
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
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const PotatoSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class PotatoSeeds extends SeedsObject {
  const PotatoSeeds()
      : super(
          crop: const Potato(),
          // assumedName: 'Fluffy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const CarrotSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class CarrotSeeds extends SeedsObject {
  const CarrotSeeds()
      : super(
          crop: const Carrot(),
          // assumedName: 'Oblong Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const CornSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class CornSeeds extends SeedsObject {
  const CornSeeds()
      : super(
          crop: const Corn(),
          // assumedName: 'Clustered Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class TomaRootSeeds extends SeedsObject {
  const TomaRootSeeds()
      : super(
          crop: const TomaRoot(),
          // assumedName: 'Spiky Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class AsparagusSeeds extends SeedsObject {
  const AsparagusSeeds()
      : super(
          // assumedName: 'Tubular Seeds',
          crop: const Asparagus(),
        );

  @override
  String get name => 'Asparagus Seeds';

  @override
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class WatermelonSeeds extends SeedsObject {
  const WatermelonSeeds()
      : super(
          crop: const Watermelon(),
          // assumedName: 'Square Seeds',
        );

  @override
  String get name => 'Watermelon Seeds';

  @override
  // TODO: implement code
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
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const PumpkinSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class PumpkinSeeds extends SeedsObject {
  const PumpkinSeeds()
      : super(
          crop: const Pumpkin(),
          // assumedName: 'Sharp Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
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
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const EggplantSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class EggplantSeeds extends SeedsObject {
  const EggplantSeeds()
      : super(
          crop: const Eggplant(),
          // assumedName: 'Swirly Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const GarlicSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class GarlicSeeds extends SeedsObject {
  const GarlicSeeds()
      : super(
          crop: const Garlic(),
          // assumedName: 'Seed Pods',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const OnionSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class OnionSeeds extends SeedsObject {
  const OnionSeeds()
      : super(
          crop: const Onion(),
          // assumedName: 'Pointy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const PepperSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class PepperSeeds extends SeedsObject {
  const PepperSeeds()
      : super(
          crop: const Pepper(),
          // assumedName: 'Lumpy Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
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
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();

  @override
  SeedsObject get seeds => const PomegranateSeeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class PomegranateSeeds extends SeedsObject {
  const PomegranateSeeds()
      : super(
          crop: const Pomegranate(),
          // assumedName: 'Windblown Seeds',
        );

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();
}

class DragonFruit implements CropObject {
  const DragonFruit();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  SeedsObject get seeds => const DragonFruitSeeds();
}

class DragonFruitSeeds extends SeedsObject {
  const DragonFruitSeeds()
      : super(
          crop: const DragonFruit(),
          // assumedName: 'Bulbous Seeds',
        );

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}

class Durian implements CropObject {
  const Durian();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  SeedsObject get seeds => const DurianSeeds();
}

class DurianSeeds extends SeedsObject {
  const DurianSeeds()
      : super(
          crop: const Durian(),
          // assumedName: 'Brittle Seed Pods',
        );

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}

class ForgetMeLots implements WeedObject, FoodObject, IngredientObject {
  const ForgetMeLots();

  @override
  // TODO: implement code
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
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class FireNettleFronds implements WeedObject, FoodObject {
  @override
  String get assetName => 'fire_nettle_fronds';

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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

class Tillweeds implements WeedObject, FoodObject {
  @override
  String get assetName => 'tillweeds';

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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

class SpinyBindweed implements WeedObject {
  @override
  String get assetName => 'spiny_bindweed';

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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

class ButterMuffin extends RecipeObject {
  const ButterMuffin()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 1,
          requirements: const Requirements({
            OrRequirement({
              ContainingRequirement(ButterflyWings()),
              ContainingRequirement(MoonMothWings()),
            }),
            MeetRequirement(FoodValues({
              FoodValue(FoodValueCategory.vegetable, 0.5),
            }))
          }),
        );

  @override
  String get assetName => 'butter_muffin';

  @override
  String get name => 'Butter Muffin';

  @override
  FoodType get type => throw UnimplementedError();
}

class Fishsticks extends RecipeObject {
  const Fishsticks()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const FroggleBunwich()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
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
  // TODO: implement
  const StuffedEggplant()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const MandrakeSoup()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class Pierogi extends RecipeObject {
  const Pierogi()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 5,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.egg, 1.0)})),
            AtLeastRequirement({FoodValueCategory.meat, FoodValueCategory.vegetable}),
            NoRequirement(categories: {FoodValueCategory.inedible}),
          }),
        );

  @override
  String get assetName => 'pierogi';

  @override
  String get name => 'Pierogi';

  @override
  FoodType get type => throw UnimplementedError();
}

class TurkeyDinner extends RecipeObject {
  // TODO: implement
  const TurkeyDinner()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'turkey_dinner';

  @override
  String get name => 'Turkey Dinner';

  @override
  FoodType get type => throw UnimplementedError();
}

class Ratatouille extends RecipeObject {
  const Ratatouille()
      : super(
          // TODO: Implement
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

class FistFullOfJam extends RecipeObject {
  // TODO: implement
  const FistFullOfJam()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fist_full_of_jam';

  @override
  String get name => 'Fist Full of Jam';

  @override
  FoodType get type => throw UnimplementedError();
}

class FruitMedley extends RecipeObject {
  // TODO: implement
  const FruitMedley()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fruit_medley';

  @override
  String get name => 'Fruit Medley';

  @override
  FoodType get type => throw UnimplementedError();
}

class FishTacos extends RecipeObject {
  // TODO: implement
  const FishTacos()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class Waffles extends RecipeObject {
  // TODO: implement
  const Waffles()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'waffles';

  @override
  String get name => 'Waffles';

  @override
  FoodType get type => throw UnimplementedError();
}

class MonsterLasagna extends RecipeObject {
  const MonsterLasagna()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 10,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.monster, 2.0)})),
            NoRequirement(categories: {FoodValueCategory.inedible}),
          }),
        );

  @override
  String get assetName => 'monster_lasagna';

  @override
  String get name => 'Monster Lasagna';

  @override
  FoodType get type => FoodType.meat;
}

class Powdercake extends RecipeObject {
  const Powdercake()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
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
  String get assetName => 'powdercake';

  @override
  String get name => 'Powdercake';

  @override
  FoodType get type => throw UnimplementedError();
}

class Unagi extends RecipeObject {
  // TODO: implement
  const Unagi()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'unagi';

  @override
  String get name => 'Unagi';

  @override
  FoodType get type => throw UnimplementedError();
}

class WetGoop extends RecipeObject {
  const WetGoop()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: -2,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'wet_goop';

  @override
  String get name => 'Wet Goop';

  @override
  FoodType get type => throw UnimplementedError();
}

class FlowerSalad extends RecipeObject {
  // TODO: implement
  const FlowerSalad()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'flower_salad';

  @override
  String get name => 'Flower Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class IceCream extends RecipeObject {
  const IceCream()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
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
  String get assetName => 'ice_cream';

  @override
  String get name => 'Ice Cream';

  @override
  FoodType get type => throw UnimplementedError();
}

class Melonsicle extends RecipeObject {
  const Melonsicle()
      : super(
          // TODO: Implement
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

class TrailMix extends RecipeObject {
  const TrailMix()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
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
  String get assetName => 'trail_mix';

  @override
  String get name => 'Trail Mix';

  @override
  FoodType get type => throw UnimplementedError();
}

class SpicyChili extends RecipeObject {
  // TODO: implement
  const SpicyChili()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class Guacamole extends RecipeObject {
  // TODO: implement
  const Guacamole()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class BananaPop extends RecipeObject {
  // TODO: implement
  const BananaPop()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'banana_pop';

  @override
  String get name => 'Banana Pop';

  @override
  FoodType get type => throw UnimplementedError();
}

class CaliforniaRoll extends RecipeObject {
  // TODO: implement
  const CaliforniaRoll()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'california_roll';

  @override
  String get name => 'California Roll';

  @override
  FoodType get type => throw UnimplementedError();
}

class Ceviche extends RecipeObject {
  // TODO: implement
  const Ceviche()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'ceviche';

  @override
  String get name => 'Ceviche';

  @override
  FoodType get type => throw UnimplementedError();
}

class WobsterBisque extends RecipeObject {
  // TODO: implement
  const WobsterBisque()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'wobster_bisque';

  @override
  String get name => 'Wobster Bisque';

  @override
  FoodType get type => throw UnimplementedError();
}

class WobsterDinner extends RecipeObject {
  // TODO: implement
  const WobsterDinner()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'wobster_dinner';

  @override
  String get name => 'Wobster Dinner';

  @override
  FoodType get type => throw UnimplementedError();
}

class SeafoodGumbo extends RecipeObject {
  // TODO: implement
  const SeafoodGumbo()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'seafood_gumbo';

  @override
  String get name => 'Seafood Gumbo';

  @override
  FoodType get type => throw UnimplementedError();
}

class SurfNTurf extends RecipeObject {
  // TODO: implement
  const SurfNTurf()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'surf_n_turf';

  @override
  String get name => 'Surf \'n\' Turf';

  @override
  FoodType get type => throw UnimplementedError();
}

class Jellybeans extends RecipeObject {
  const Jellybeans()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  FoodType get type => throw UnimplementedError();
}

class VegetableStinger extends RecipeObject {
  const VegetableStinger()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
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
  String get assetName => 'vegetable_stinger';

  @override
  String get name => 'Vegetable Stinger';

  @override
  FoodType get type => throw UnimplementedError();

  @override
  List<String> get ingredientListAssetNames =>
      [const TomaRoot().assetName, const Ice().assetName, FoodValueCategory.vegetable.assetName];
}

class AsparagusSoup extends RecipeObject {
  // TODO: implement
  const AsparagusSoup()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class StuffedPepperPoppers extends RecipeObject {
  const StuffedPepperPoppers()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class SalsaFresca extends RecipeObject {
  const SalsaFresca()
      : super(
          // TODO: Implement
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

class FancySpiralledTubers extends RecipeObject {
  const FancySpiralledTubers()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const BarnaclePita()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const BarnacleNigiri()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const BarnacleLinguine()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const StuffedFishHeads()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
  // TODO: implement
  const MushyCake()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class SoothingTea extends RecipeObject {
  const SoothingTea()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class FigStuffedTrunk extends RecipeObject {
  const FigStuffedTrunk()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
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
  String get assetName => 'fig_stuffed_trunk';

  @override
  String get name => 'Fig-Stuffed Trunk';

  @override
  FoodType get type => throw UnimplementedError();
}

class Figatoni extends RecipeObject {
  const Figatoni()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 30,
          requirements: const Requirements({
            ContainingRequirement(Fig()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 2.0)})),
            NoRequirement(categories: {FoodValueCategory.meat}),
          }),
        );

  @override
  String get assetName => 'figatoni';

  @override
  String get name => 'Figatoni';

  @override
  FoodType get type => throw UnimplementedError();
}

class Figkabab extends RecipeObject {
  const Figkabab()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class FiggyFrogwich extends RecipeObject {
  const FiggyFrogwich()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class FrozenBananaDaiquiri extends RecipeObject {
  // TODO: implement
  const FrozenBananaDaiquiri()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class BananaShake extends RecipeObject {
  // TODO: implement
  const BananaShake()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class PlainOmelette extends RecipeObject {
  const PlainOmelette()
      : super(
          // TODO: Implement
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

class BreakfastSkillet extends RecipeObject {
  // TODO: implement
  const BreakfastSkillet()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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

class TallScotchEggs extends RecipeObject {
  // TODO: implement
  const TallScotchEggs()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
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
          // TODO: Implement
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
  // TODO: implement
  const BeefaloTreats()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'beefalo_treats';

  @override
  String get name => 'Beefalo Treats';

  @override
  FoodType get type => throw UnimplementedError();
}

class LeafyMeatloaf extends RecipeObject {
  const LeafyMeatloaf()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 25,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat(), 2),
          }),
        );

  @override
  String get assetName => 'leafy_meatloaf';

  @override
  String get name => 'Leafy Meatloaf';

  @override
  FoodType get type => FoodType.meat;
}

class VeggieBurger extends RecipeObject {
  const VeggieBurger()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 25,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat()),
            ContainingRequirement(Onion()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 2.0)})),
          }),
        );

  @override
  String get assetName => 'veggie_burger';

  @override
  String get name => 'Veggie Burger';

  @override
  FoodType get type => throw UnimplementedError();
}

class JellySalad extends RecipeObject {
  const JellySalad()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 50,
          requirements: const Requirements({
            ContainingRequirement(LeafyMeat(), 2),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.sweetener, 2.0)})),
          }),
        );

  @override
  String get assetName => 'jelly_salad';

  @override
  String get name => 'Jelly Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class BeefyGreens extends RecipeObject {
  // TODO: implement
  const BeefyGreens()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'beefy_greens';

  @override
  String get name => 'Beefy Greens';

  @override
  FoodType get type => throw UnimplementedError();
}

class MilkmadeHat extends RecipeObject {
  // TODO: implement
  const MilkmadeHat()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'milkmade_hat';

  @override
  String get name => 'Milkmade Hat';

  @override
  FoodType get type => throw UnimplementedError();
}

class Amberosia extends RecipeObject {
  const Amberosia()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 100,
          requirements: const Requirements({ContainingRequirement(CollectedDust())}),
        );

  @override
  String get assetName => 'amberosia';

  @override
  String get name => 'Amberosia';

  @override
  // TODO: Not food checking
  FoodType get type => throw UnimplementedError();
}

class BeetSalho extends RecipeObject {
  // TODO: implement
  const BeetSalho()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'beet_salho';

  @override
  String get name => 'Beet Salho';

  @override
  FoodType get type => throw UnimplementedError();
}

class CricketCrackers extends RecipeObject {
  // TODO: implement
  const CricketCrackers()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'cricket_crackers';

  @override
  String get name => 'Cricket Crackers';

  @override
  FoodType get type => throw UnimplementedError();
}

class LeafySalad extends RecipeObject {
  // TODO: implement
  const LeafySalad()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'leafy_salad';

  @override
  String get name => 'Leafy Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class Leafloaf extends RecipeObject {
  // TODO: implement
  const Leafloaf()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'leafloaf';

  @override
  String get name => 'Leafloaf';

  @override
  FoodType get type => throw UnimplementedError();
}

class MixedVegetable extends RecipeObject {
  // TODO: implement
  const MixedVegetable()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'mixed_vegetable';

  @override
  String get name => 'Mixed Vegetable';

  @override
  FoodType get type => throw UnimplementedError();
}

class BoneBouillon extends RecipeObject {
  // TODO: implement
  const BoneBouillon()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'bone_bouillon';

  @override
  String get name => 'Bone Bouillon';

  @override
  FoodType get type => throw UnimplementedError();
}

class Moqueca extends RecipeObject {
  // TODO: implement
  const Moqueca()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'moqueca';

  @override
  String get name => 'Moqueca';

  @override
  FoodType get type => throw UnimplementedError();
}

class MonsterTartare extends RecipeObject {
  // TODO: implement
  const MonsterTartare()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'monster_tartare';

  @override
  String get name => 'Monster Tartare';

  @override
  FoodType get type => throw UnimplementedError();
}

class CreamyFettuccine extends RecipeObject {
  // TODO: implement
  const CreamyFettuccine()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'creamy_fettuccine';

  @override
  String get name => 'Creamy Fettuccine';

  @override
  FoodType get type => throw UnimplementedError();
}

class Fruitcake extends RecipeObject {
  // TODO: implement
  const Fruitcake()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fruitcake';

  @override
  String get name => 'Fruitcake';

  @override
  FoodType get type => throw UnimplementedError();
}

class FreshFruitCrepes extends RecipeObject {
  // TODO: implement
  const FreshFruitCrepes()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fresh_fruit_crepes';

  @override
  String get name => 'Fresh Fruit Crepes';

  @override
  FoodType get type => throw UnimplementedError();
}

class HotChili extends RecipeObject {
  // TODO: implement
  const HotChili()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'hot_chili';

  @override
  String get name => 'Hot Chili';

  @override
  FoodType get type => throw UnimplementedError();
}

class GlowBerryMousse extends RecipeObject {
  // TODO: implement
  const GlowBerryMousse()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'glow_berry_mousse';

  @override
  String get name => 'Glow Berry Mousse';

  @override
  FoodType get type => throw UnimplementedError();
}

class MashedPotatoes extends RecipeObject {
  const MashedPotatoes()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 20,
          requirements: const Requirements({
            ContainingRequirement(Potato(), 2),
            ContainingRequirement(Garlic()),
            NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
          }),
        );

  @override
  String get assetName => 'mashedpotatoes';

  @override
  String get name => 'Creamy Potato Purée';

  @override
  FoodType get type => throw UnimplementedError();
}

class GrimGalette extends RecipeObject {
  // TODO: implement
  const GrimGalette()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'grim_galette';

  @override
  String get name => 'Grim Galette';

  @override
  FoodType get type => throw UnimplementedError();
}

class VoltGoatChaudFroid extends RecipeObject {
  // TODO: implement
  const VoltGoatChaudFroid()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'volt_goat_chaud_froid';

  @override
  String get name => 'Volt Goat Chaud Froid';

  @override
  FoodType get type => throw UnimplementedError();
}

class FishCordonBleu extends RecipeObject {
  // TODO: implement
  const FishCordonBleu()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'fish_cordon_bleu';

  @override
  String get name => 'Fish Cordon Bleu';

  @override
  FoodType get type => throw UnimplementedError();
}

class HotDragonChiliSalad extends RecipeObject {
  // TODO: implement
  const HotDragonChiliSalad()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'hot_dragon_chili_salad';

  @override
  String get name => 'Hot Dragon Chili Salad';

  @override
  FoodType get type => throw UnimplementedError();
}

class Asparagazpacho extends RecipeObject {
  // TODO: implement
  const Asparagazpacho()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'asparagazpacho';

  @override
  String get name => 'Asparagazpacho';

  @override
  FoodType get type => throw UnimplementedError();
}

class PuffedPotatoSouffle extends RecipeObject {
  // TODO: implement
  const PuffedPotatoSouffle()
      : super(
          // TODO: Implement
          code: '',
          // TODO: Implement
          assetName: '',
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'puffed_potato_souffle';

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
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValue
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.meat, 0.5)});

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => FoodType.veggie;
}

// class RoastedBerries {}

class RoastedBirchnut implements FoodObject, IngredientObject {
  const RoastedBirchnut();

  @override
  // TODO: implement code
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

class Butter {}

class ButterflyWings implements FoodObject, IngredientObject {
  const ButterflyWings();

  @override
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValue
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValue
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

// class CookedEgg {}

class BraisedEggplant {}

class Fig implements CookableFood, IngredientObject {
  const Fig();

  @override
  // TODO: implement code
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
  // TODO: implement code
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
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'ice';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => "Ice";

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class JuicyBerries implements CookableFood, IngredientObject {
  const JuicyBerries();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'winter_koalefant_trunk';

  @override
  String get compositeAssetName => 'koalefant_trunks';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Winter Koalefant Trunk';

  @override
  FoodType get type => FoodType.meat;
}

// class KoalefantTrunkSteak {}

class LeafyMeat implements CookableFood, IngredientObject {
  const LeafyMeat();

  @override
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValues
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class Morsel implements IngredientObject, FoodObject {
  const Morsel();

  @override
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValue
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
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

class Rot {}

class RottenEgg {}

class RoyalJelly implements FoodObject, IngredientObject {
  const RoyalJelly();

  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  // TODO: implement foodValues
  FoodValues? get foodValues => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

class Seeds implements FoodObject {
  const Seeds();

  @override
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'seeds';

  @override
  String get name => 'Seeds';

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
  // TODO: implement code
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
  // TODO: implement code
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
  // TODO: implement code
  String get code => throw UnimplementedError();

  @override
  String get assetName => 'popperfish';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  String get name => throw 'Popperfish';
}
