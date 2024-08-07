import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';

class Twigs implements Ingredient {
  const Twigs();

  @override
  String get assetName => 'twigs';

  @override
  String get name => 'Twigs';

  @override
  final FoodValue? foodValue = null;
}

// class CookedAsparagus {}

class Barnacles {}

// class CookedBarnacles {}

class BatiliskWing {}

// class CookedBatiliskWing {}

class Berries implements Food, Ingredient {
  @override
  // TODO: implement assetName
  String get assetName => throw UnimplementedError();

  @override
  // TODO: implement foodValue
  FoodValue? get foodValue => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  // TODO: implement type
  FoodType get type => throw UnimplementedError();
}

// class RoastedBerries {}

class RoastedBirchnut {}

class Butter {}

class ButterflyWings {}

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

class Drumstick {}

class FriedDrumstick {}

class ExtraSmellyDurian {}

class Eel {}

// class CookedEel {}

class ElectricMilk {}

class Egg {}

// class CookedEgg {}

class BraisedEggplant {}

class Fig {}

// class CookedFig {}

class Fish {}

// class CookedFish {}

class FishMorsel {}

// class CookedFishMorsel {}

class Foliage {}

class FrogLegs {}

// class CookedFrogLegs {}

// class RoastedGarlic {}

class GlowBerry {}

class LesserGlowBerry {}

class Honey {}

class Ice {}

class JuicyBerries {}

// class RoastedJuicyBerries {}

class KelpFronds {}

// class CookedKelpFronds {}

class DriedKelpFronds {}

class KoalefantTrunk {}

class WinterKoalefantTrunk {}

class KoalefantTrunkSteak {}

class LeafyMeat {}

// class CookedLeafyMeat {}

class Lichen {}

class LightBulb {}

class LuneTreeBlossom {}

class Mandrake {}

// class CookedMandrake {}

class Meat {}

// class CookedMeat {}

class Jerky {}

class MilkyWhites {}

class MonsterMeat {}

// class CookedMonsterMeat {}

class MonsterJerky {}

class MoonShroom {}

// class CookedMoonShroom {}

class MoonMothWings {}

class Morsel implements Ingredient, Food {
  const Morsel();

  @override
  FoodValue? get foodValue => const FoodValue(meat: MeatValue.half);

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

class RedCap {}

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

class TallbirdEgg {}

class HatchingTallbirdEgg {}

class FriedTallbirdEgg {}

// class RoastedTomaRoot {}

class GrilledWatermelon {}

class StuffedNightCap {}
