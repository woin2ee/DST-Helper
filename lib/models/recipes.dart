import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';
import 'package:dst_helper/models/recipe.dart';

class Recipes {
  static List<Recipe> get recipes {
    return [
      const ButterMuffin(),
      const FroggleBunwich(),
      const Taffy(),
      const PumpkinCookie(),
      const StuffedEggplant(),
      const Fishsticks(),
      const HoneyNuggets(),
      const HoneyHam(),
      Dragonpie(),
      Kabobs(),
      MandrakeSoup(),
      BaconAndEggs(),
      const Meatballs(),
      MeatyStew(),
      Pierogi(),
      TurkeyDinner(),
      Ratatouille(),
      FistFullOfJam(),
      FruitMedley(),
      FishTacos(),
      Waffles(),
      MonsterLasagna(),
      Powdercake(),
      Unagi(),
      WetGoop(),
      FlowerSalad(),
      IceCream(),
      Melonsicle(),
      TrailMix(),
      SpicyChili(),
      Guacamole(),
      BananaPop(),
      CaliforniaRoll(),
      Ceviche(),
      WobsterBisque(),
      WobsterDinner(),
      SeafoodGumbo(),
      SurfNTurf(),
      Jellybeans(),
      VegetableStinger(),
      AsparagusSoup(),
      StuffedPepperPoppers(),
      MashedPotatoes(),
      SalsaFresca(),
      FancySpiralledTubers(),
      BarnaclePita(),
      BarnacleNigiri(),
      BarnacleLinguine(),
      StuffedFishHeads(),
      MushyCake(),
      SoothingTea(),
      FigStuffedTrunk(),
      Figatoni(),
      Figkabab(),
      FiggyFrogwich(),
      FrozenBananaDaiquiri(),
      BunnyStew(),
      BananaShake(),
      PlainOmelette(),
      BreakfastSkillet(),
      TallScotchEggs(),
      SteamedTwigs(),
      BeefaloTreats(),
      LeafyMeatloaf(),
      VeggieBurger(),
      JellySalad(),
      BeefyGreens(),
      MilkmadeHat(),
      Amberosia(),
      GrimGalette(),
      VoltGoatChaudFroid(),
      GlowBerryMousse(),
      FishCordonBleu(),
      HotDragonChiliSalad(),
      Asparagazpacho(),
      PuffedPotatoSouffle(),
      MonsterTartare(),
      FreshFruitCrepes(),
      BoneBouillon(),
      Moqueca(),
    ];
  }
}

class ButterMuffin implements Recipe {
  const ButterMuffin();

  @override
  String get assetName => 'butter_muffin';

  @override
  String get name => 'Butter Muffin';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FroggleBunwich implements Recipe {
  const FroggleBunwich();

  @override
  String get assetName => 'froggle_bunwich';

  @override
  String get name => 'Froggle Bunwich';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Taffy implements Recipe {
  const Taffy();

  @override
  String get assetName => 'taffy';

  @override
  String get name => 'Taffy';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PumpkinCookie implements Recipe {
  const PumpkinCookie();

  @override
  String get assetName => 'pumpkin_cookie';

  @override
  String get name => 'Pumpkin Cookie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class StuffedEggplant implements Recipe {
  const StuffedEggplant();

  @override
  String get assetName => 'stuffed_eggplant';

  @override
  String get name => 'Stuffed Eggplant';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Fishsticks implements Recipe {
  const Fishsticks();

  @override
  String get assetName => 'fishsticks';

  @override
  String get name => 'Fishsticks';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HoneyNuggets implements Recipe {
  const HoneyNuggets();

  @override
  String get assetName => 'honey_nuggets';

  @override
  String get name => 'Honey Nuggets';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HoneyHam implements Recipe {
  const HoneyHam();

  @override
  String get assetName => 'honey_ham';

  @override
  String get name => 'Honey Ham';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Dragonpie implements Recipe {
  @override
  String get assetName => 'dragonpie';

  @override
  String get name => 'Dragonpie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Kabobs implements Recipe {
  @override
  String get assetName => 'kabobs';

  @override
  String get name => 'Kabobs';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MandrakeSoup implements Recipe {
  @override
  String get assetName => 'mandrake_soup';

  @override
  String get name => 'Mandrake Soup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BaconAndEggs implements Recipe {
  @override
  String get assetName => 'bacon_and_eggs';

  @override
  String get name => 'Bacon and Eggs';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Meatballs implements Recipe {
  const Meatballs();

  @override
  String get assetName => 'meatballs';

  @override
  String get name => 'Meatballs';

  @override
  int get priority => -1;

  @override
  FoodType get type => FoodType.meat;

  @override
  bool canCookWith(Ingredients ingredients) {
    assert(ingredients.length == 4);
    return ingredients.containMeet && !ingredients.containInedible;
  }
}

class MeatyStew implements Recipe {
  @override
  String get assetName => 'meaty_stew';

  @override
  String get name => 'Meaty Stew';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Pierogi implements Recipe {
  @override
  String get assetName => 'pierogi';

  @override
  String get name => 'Pierogi';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class TurkeyDinner implements Recipe {
  @override
  String get assetName => 'turkey_dinner';

  @override
  String get name => 'Turkey Dinner';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Ratatouille implements Recipe {
  @override
  String get assetName => 'ratatouille';

  @override
  String get name => 'Ratatouille';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FistFullOfJam implements Recipe {
  @override
  String get assetName => 'fist_full_of_jam';

  @override
  String get name => 'Fist Full of Jam';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FruitMedley implements Recipe {
  @override
  String get assetName => 'fruit_medley';

  @override
  String get name => 'Fruit Medley';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FishTacos implements Recipe {
  @override
  String get assetName => 'fish_tacos';

  @override
  String get name => 'Fish Tacos';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Waffles implements Recipe {
  @override
  String get assetName => 'waffles';

  @override
  String get name => 'Waffles';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MonsterLasagna implements Recipe {
  @override
  String get assetName => 'monster_lasagna';

  @override
  String get name => 'Monster Lasagna';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Powdercake implements Recipe {
  @override
  String get assetName => 'powdercake';

  @override
  String get name => 'Powdercake';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Unagi implements Recipe {
  @override
  String get assetName => 'unagi';

  @override
  String get name => 'Unagi';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class WetGoop implements Recipe {
  @override
  String get assetName => 'wet_goop';

  @override
  String get name => 'Wet Goop';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FlowerSalad implements Recipe {
  @override
  String get assetName => 'flower_salad';

  @override
  String get name => 'Flower Salad';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class IceCream implements Recipe {
  @override
  String get assetName => 'ice_cream';

  @override
  String get name => 'Ice Cream';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Melonsicle implements Recipe {
  @override
  String get assetName => 'melonsicle';

  @override
  String get name => 'Melonsicle';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class TrailMix implements Recipe {
  @override
  String get assetName => 'trail_mix';

  @override
  String get name => 'Trail Mix';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SpicyChili implements Recipe {
  @override
  String get assetName => 'spicy_chili';

  @override
  String get name => 'Spicy Chili';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Guacamole implements Recipe {
  @override
  String get assetName => 'guacamole';

  @override
  String get name => 'Guacamole';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BananaPop implements Recipe {
  @override
  String get assetName => 'banana_pop';

  @override
  String get name => 'Banana Pop';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class CaliforniaRoll implements Recipe {
  @override
  String get assetName => 'california_roll';

  @override
  String get name => 'California Roll';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Ceviche implements Recipe {
  @override
  String get assetName => 'ceviche';

  @override
  String get name => 'Ceviche';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class WobsterBisque implements Recipe {
  @override
  String get assetName => 'wobster_bisque';

  @override
  String get name => 'Wobster Bisque';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class WobsterDinner implements Recipe {
  @override
  String get assetName => 'wobster_dinner';

  @override
  String get name => 'Wobster Dinner';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SeafoodGumbo implements Recipe {
  @override
  String get assetName => 'seafood_gumbo';

  @override
  String get name => 'Seafood Gumbo';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SurfNTurf implements Recipe {
  @override
  String get assetName => 'surf_n_turf';

  @override
  String get name => 'Surf \'n\' Turf';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Jellybeans implements Recipe {
  @override
  String get assetName => 'jellybeans';

  @override
  String get name => 'Jellybeans';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class VegetableStinger implements Recipe {
  @override
  String get assetName => 'vegetable_stinger';

  @override
  String get name => 'Vegetable Stinger';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class AsparagusSoup implements Recipe {
  @override
  String get assetName => 'asparagus_soup';

  @override
  String get name => 'Asparagus Soup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class StuffedPepperPoppers implements Recipe {
  @override
  String get assetName => 'stuffed_pepper_poppers';

  @override
  String get name => 'Stuffed Pepper Poppers';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SalsaFresca implements Recipe {
  @override
  String get assetName => 'salsa_fresca';

  @override
  String get name => 'Salsa Fresca';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FancySpiralledTubers implements Recipe {
  @override
  String get assetName => 'fancy_spiralled_tubers';

  @override
  String get name => 'Fancy Spiralled Tubers';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BarnaclePita implements Recipe {
  @override
  String get assetName => 'barnacle_pita';

  @override
  String get name => 'Barnacle Pita';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BarnacleNigiri implements Recipe {
  @override
  String get assetName => 'barnacle_nigiri';

  @override
  String get name => 'Barnacle Nigiri';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BarnacleLinguine implements Recipe {
  @override
  String get assetName => 'barnacle_linguine';

  @override
  String get name => 'Barnacle Linguine';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class StuffedFishHeads implements Recipe {
  @override
  String get assetName => 'stuffed_fish_heads';

  @override
  String get name => 'Stuffed Fish Heads';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MushyCake implements Recipe {
  @override
  String get assetName => 'mushy_cake';

  @override
  String get name => 'Mushy Cake';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SoothingTea implements Recipe {
  @override
  String get assetName => 'soothing_tea';

  @override
  String get name => 'Soothing Tea';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FigStuffedTrunk implements Recipe {
  @override
  String get assetName => 'fig_stuffed_trunk';

  @override
  String get name => 'Fig-Stuffed Trunk';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Figatoni implements Recipe {
  @override
  String get assetName => 'figatoni';

  @override
  String get name => 'Figatoni';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Figkabab implements Recipe {
  @override
  String get assetName => 'figkabab';

  @override
  String get name => 'Figkabab';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FiggyFrogwich implements Recipe {
  @override
  String get assetName => 'figgy_frogwich';

  @override
  String get name => 'Figgy Frogwich';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FrozenBananaDaiquiri implements Recipe {
  @override
  String get assetName => 'frozen_banana_daiquiri';

  @override
  String get name => 'Frozen Banana Daiquiri';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BunnyStew implements Recipe {
  @override
  String get assetName => 'bunny_stew';

  @override
  String get name => 'Bunny Stew';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BananaShake implements Recipe {
  @override
  String get assetName => 'banana_shake';

  @override
  String get name => 'Banana Shake';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PlainOmelette implements Recipe {
  @override
  String get assetName => 'plain_omelette';

  @override
  String get name => 'Plain Omelette';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BreakfastSkillet implements Recipe {
  @override
  String get assetName => 'breakfast_skillet';

  @override
  String get name => 'Breakfast Skillet';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class TallScotchEggs implements Recipe {
  @override
  String get assetName => 'tall_scotch_eggs';

  @override
  String get name => 'Tall Scotch Eggs';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SteamedTwigs implements Recipe {
  @override
  String get assetName => 'steamed_twigs';

  @override
  String get name => 'Steamed Twigs';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BeefaloTreats implements Recipe {
  @override
  String get assetName => 'beefalo_treats';

  @override
  String get name => 'Beefalo Treats';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class LeafyMeatloaf implements Recipe {
  @override
  String get assetName => 'leafy_meatloaf';

  @override
  String get name => 'Leafy Meatloaf';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class VeggieBurger implements Recipe {
  @override
  String get assetName => 'veggie_burger';

  @override
  String get name => 'Veggie Burger';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class JellySalad implements Recipe {
  @override
  String get assetName => 'jelly_salad';

  @override
  String get name => 'Jelly Salad';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BeefyGreens implements Recipe {
  @override
  String get assetName => 'beefy_greens';

  @override
  String get name => 'Beefy Greens';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MilkmadeHat implements Recipe {
  @override
  String get assetName => 'milkmade_hat';

  @override
  String get name => 'Milkmade Hat';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Amberosia implements Recipe {
  @override
  String get assetName => 'amberosia';

  @override
  String get name => 'Amberosia';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BeetSalho implements Recipe {
  @override
  String get assetName => 'beet_salho';

  @override
  String get name => 'Beet Salho';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class CricketCrackers implements Recipe {
  @override
  String get assetName => 'cricket_crackers';

  @override
  String get name => 'Cricket Crackers';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class LeafySalad implements Recipe {
  @override
  String get assetName => 'leafy_salad';

  @override
  String get name => 'Leafy Salad';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Leafloaf implements Recipe {
  @override
  String get assetName => 'leafloaf';

  @override
  String get name => 'Leafloaf';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MixedVegetable implements Recipe {
  @override
  String get assetName => 'mixed_vegetable';

  @override
  String get name => 'Mixed Vegetable';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MudPie implements Recipe {
  @override
  String get assetName => 'mud_pie';

  @override
  String get name => 'Mud Pie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MixedJellybeans implements Recipe {
  @override
  String get assetName => 'mixed_jellybeans';

  @override
  String get name => 'Mixed Jellybeans';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MisoRamen implements Recipe {
  @override
  String get assetName => 'miso_ramen';

  @override
  String get name => 'Miso Ramen';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class RoastedGarlicMussels implements Recipe {
  @override
  String get assetName => 'roasted_garlic_mussels';

  @override
  String get name => 'Roasted Garlic Mussels';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BoneBouillon implements Recipe {
  @override
  String get assetName => 'bone_bouillon';

  @override
  String get name => 'Bone Bouillon';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BoneStew implements Recipe {
  @override
  String get assetName => 'bone_stew';

  @override
  String get name => 'Bone Stew';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Moqueca implements Recipe {
  @override
  String get assetName => 'moqueca';

  @override
  String get name => 'Moqueca';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class JellyOmelette implements Recipe {
  @override
  String get assetName => 'jelly_omelette';

  @override
  String get name => 'Jelly Omelette';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class StuffedTomato implements Recipe {
  @override
  String get assetName => 'stuffed_tomato';

  @override
  String get name => 'Stuffed Tomato';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MonsterTartare implements Recipe {
  @override
  String get assetName => 'monster_tartare';

  @override
  String get name => 'Monster Tartare';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class DragonPie implements Recipe {
  @override
  String get assetName => 'dragonpie';

  @override
  String get name => 'Dragon Pie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class CreamyFettuccine implements Recipe {
  @override
  String get assetName => 'creamy_fettuccine';

  @override
  String get name => 'Creamy Fettuccine';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Fruitcake implements Recipe {
  @override
  String get assetName => 'fruitcake';

  @override
  String get name => 'Fruitcake';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FreshFruitCrepes implements Recipe {
  @override
  String get assetName => 'fresh_fruit_crepes';

  @override
  String get name => 'Fresh Fruit Crepes';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HotChili implements Recipe {
  @override
  String get assetName => 'hot_chili';

  @override
  String get name => 'Hot Chili';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class GlowBerryMousse implements Recipe {
  @override
  String get assetName => 'glow_berry_mousse';

  @override
  String get name => 'Glow Berry Mousse';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class StoneSoup implements Recipe {
  @override
  String get assetName => 'stone_soup';

  @override
  String get name => 'Stone Soup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Gravy implements Recipe {
  @override
  String get assetName => 'gravy';

  @override
  String get name => 'Gravy';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class LuneTreeBlend implements Recipe {
  @override
  String get assetName => 'lune_tree_blend';

  @override
  String get name => 'Lune Tree Blend';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BrambleBlooms implements Recipe {
  @override
  String get assetName => 'bramble_blooms';

  @override
  String get name => 'Bramble Blooms';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class GlowberrySyrup implements Recipe {
  @override
  String get assetName => 'glowberry_syrup';

  @override
  String get name => 'Glowberry Syrup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class BerryWaffleDelight implements Recipe {
  @override
  String get assetName => 'berry_waffle_delight';

  @override
  String get name => 'Berry Waffle Delight';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HoneyCrackers implements Recipe {
  @override
  String get assetName => 'honey_crackers';

  @override
  String get name => 'Honey Crackers';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MashedPotatoes implements Recipe {
  @override
  String get assetName => 'mashedpotatoes';

  @override
  String get name => 'Creamy Potato Purée';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PotatoSouffle implements Recipe {
  @override
  String get assetName => 'potato_souffle';

  @override
  String get name => 'Potato Souffle';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class CreamyMushroomSoup implements Recipe {
  @override
  String get assetName => 'creamy_mushroom_soup';

  @override
  String get name => 'Creamy Mushroom Soup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class IceBream implements Recipe {
  @override
  String get assetName => 'ice_bream';

  @override
  String get name => 'Ice Bream';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class GrilledAsparagus implements Recipe {
  @override
  String get assetName => 'grilled_asparagus';

  @override
  String get name => 'Grilled Asparagus';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PoachedEgg implements Recipe {
  @override
  String get assetName => 'poached_egg';

  @override
  String get name => 'Poached Egg';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HerbalSalad implements Recipe {
  @override
  String get assetName => 'herbal_salad';

  @override
  String get name => 'Herbal Salad';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class CreamyFishMuffin implements Recipe {
  @override
  String get assetName => 'creamy_fish_muffin';

  @override
  String get name => 'Creamy Fish Muffin';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class TropicalBouillabaisse implements Recipe {
  @override
  String get assetName => 'tropical_bouillabaisse';

  @override
  String get name => 'Tropical Bouillabaisse';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Gazpacho implements Recipe {
  @override
  String get assetName => 'gazpacho';

  @override
  String get name => 'Gazpacho';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HibiscusTea implements Recipe {
  @override
  String get assetName => 'hibiscus_tea';

  @override
  String get name => 'Hibiscus Tea';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Horchata implements Recipe {
  @override
  String get assetName => 'horchata';

  @override
  String get name => 'Horchata';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class IcedTea implements Recipe {
  @override
  String get assetName => 'iced_tea';

  @override
  String get name => 'Iced Tea';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class JellyBean implements Recipe {
  @override
  String get assetName => 'jelly_bean';

  @override
  String get name => 'Jelly Bean';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MangoFloat implements Recipe {
  @override
  String get assetName => 'mango_float';

  @override
  String get name => 'Mango Float';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Marshmallow implements Recipe {
  @override
  String get assetName => 'marshmallow';

  @override
  String get name => 'Marshmallow';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MelonJuice implements Recipe {
  @override
  String get assetName => 'melon_juice';

  @override
  String get name => 'Melon Juice';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class MusselBouillabaisse implements Recipe {
  @override
  String get assetName => 'mussel_bouillabaisse';

  @override
  String get name => 'Mussel Bouillabaisse';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Mustard implements Recipe {
  @override
  String get assetName => 'mustard';

  @override
  String get name => 'Mustard';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class OnionSoup implements Recipe {
  @override
  String get assetName => 'onion_soup';

  @override
  String get name => 'Onion Soup';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PankoCrustedFish implements Recipe {
  @override
  String get assetName => 'panko_crusted_fish';

  @override
  String get name => 'Panko Crusted Fish';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Parfait implements Recipe {
  @override
  String get assetName => 'parfait';

  @override
  String get name => 'Parfait';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PeachCobbler implements Recipe {
  @override
  String get assetName => 'peach_cobbler';

  @override
  String get name => 'Peach Cobbler';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PickledVeggies implements Recipe {
  @override
  String get assetName => 'pickled_veggies';

  @override
  String get name => 'Pickled Veggies';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PistachioBrittle implements Recipe {
  @override
  String get assetName => 'pistachio_brittle';

  @override
  String get name => 'Pistachio Brittle';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PoachedFishWithAsparagus implements Recipe {
  @override
  String get assetName => 'poached_fish_with_asparagus';

  @override
  String get name => 'Poached Fish With Asparagus';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Popcorn implements Recipe {
  @override
  String get assetName => 'popcorn';

  @override
  String get name => 'Popcorn';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PulledPorkSandwich implements Recipe {
  @override
  String get assetName => 'pulled_pork_sandwich';

  @override
  String get name => 'Pulled Pork Sandwich';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PumpkinPie implements Recipe {
  @override
  String get assetName => 'pumpkin_pie';

  @override
  String get name => 'Pumpkin Pie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class RoastedBrusselsSprouts implements Recipe {
  @override
  String get assetName => 'roasted_brussels_sprouts';

  @override
  String get name => 'Roasted Brussels Sprouts';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class SaltedPeanuts implements Recipe {
  @override
  String get assetName => 'salted_peanuts';

  @override
  String get name => 'Salted Peanuts';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Smoothie implements Recipe {
  @override
  String get assetName => 'smoothie';

  @override
  String get name => 'Smoothie';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class GrimGalette implements Recipe {
  @override
  String get assetName => 'grim_galette';

  @override
  String get name => 'Grim Galette';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class VoltGoatChaudFroid implements Recipe {
  @override
  String get assetName => 'volt_goat_chaud_froid';

  @override
  String get name => 'Volt Goat Chaud Froid';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class FishCordonBleu implements Recipe {
  @override
  String get assetName => 'fish_cordon_bleu';

  @override
  String get name => 'Fish Cordon Bleu';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class HotDragonChiliSalad implements Recipe {
  @override
  String get assetName => 'hot_dragon_chili_salad';

  @override
  String get name => 'Hot Dragon Chili Salad';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class Asparagazpacho implements Recipe {
  @override
  String get assetName => 'asparagazpacho';

  @override
  String get name => 'Asparagazpacho';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}

class PuffedPotatoSouffle implements Recipe {
  @override
  String get assetName => 'puffed_potato_souffle';

  @override
  String get name => 'Puffed Potato Souffle';

  @override
  int get priority => throw UnimplementedError();

  @override
  FoodType get type => throw UnimplementedError();

  @override
  bool canCookWith(Ingredients ingredients) {
    throw UnimplementedError();
  }
}
