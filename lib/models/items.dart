import 'package:dst_helper/models/cookable_food.dart';
import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';

class Twigs implements Ingredient {
  const Twigs();

  @override
  String get assetName => 'twigs';

  @override
  String get name => 'Twigs';

  @override
  final FoodValues? foodValues = const FoodValues({FoodValue(FoodValueCategory.inedible, 1.0)});
}

// class CookedAsparagus {}

class Barnacles implements Food, Ingredient {
  const Barnacles();

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

class BatiliskWing implements Food, Ingredient {
  const BatiliskWing();

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

class Berries implements Food, Ingredient {
  const Berries();

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

class RoastedBirchnut {}

class Butter {}

class ButterflyWings implements Food, Ingredient {
  const ButterflyWings();

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

class Drumstick implements Food, Ingredient {
  const Drumstick();

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

class Egg implements Food, Ingredient {
  const Egg();

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

class Fig {}

// class CookedFig {}

class Fish {}

// class CookedFish {}

class FishMorsel {}

// class CookedFishMorsel {}

class Foliage {}

class FrogLegs implements Food, Ingredient {
  const FrogLegs();

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

class Honey implements Food, Ingredient {
  const Honey();

  @override
  String get assetName => 'honey';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.sweetener, 1.0)});

  @override
  String get name => 'Honey';

  @override
  FoodType get type => FoodType.generic;
}

class Ice implements Food, Ingredient {
  const Ice();

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

class JuicyBerries {}

// class RoastedJuicyBerries {}

class KelpFronds {}

// class CookedKelpFronds {}

class DriedKelpFronds {}

class KoalefantTrunk {}

class WinterKoalefantTrunk {}

class KoalefantTrunkSteak {}

class LeafyMeat implements CookableFood, Ingredient {
  const LeafyMeat();

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

class Mandrake implements Food, Ingredient {
  const Mandrake();

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

class Meat implements Food, Ingredient {
  const Meat();

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

class MonsterMeat implements Food, Ingredient {
  const MonsterMeat();

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

class MoonMothWings implements Food, Ingredient {
  const MoonMothWings();

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

class Morsel implements Ingredient, Food {
  const Morsel();

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

class RedCap implements Food, Ingredient {
  const RedCap();

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

class RoyalJelly {}

class Seeds implements Food {
  const Seeds();

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

class TallbirdEgg implements Food, Ingredient {
  const TallbirdEgg();

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

class CollectedDust implements Ingredient {
  const CollectedDust();

  @override
  String get assetName => 'collected_dust';

  @override
  FoodValues? get foodValues => null;

  @override
  String get name => 'Collected Dust';
}

class Popperfish implements Ingredient {
  const Popperfish();

  @override
  String get assetName => 'popperfish';

  @override
  FoodValues? get foodValues => const FoodValues({FoodValue(FoodValueCategory.vegetable, 1.0)});

  @override
  String get name => throw 'Popperfish';
}
