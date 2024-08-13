
import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';
import 'package:dst_helper/models/items.dart';
import 'package:dst_helper/models/plants.dart';
import 'package:dst_helper/models/recipe.dart';

class Recipes {
  static List<Recipe> get recipes {
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

class ButterMuffin extends Recipe {
  const ButterMuffin()
      : super(
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

class Fishsticks extends Recipe {
  const Fishsticks()
      : super(
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

class FroggleBunwich extends Recipe {
  // TODO: implement
  const FroggleBunwich()
      : super(
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

class Taffy extends Recipe {
  const Taffy()
      : super(
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

class PumpkinCookie extends Recipe {
  const PumpkinCookie()
      : super(
          priority: 10,
          requirements: const Requirements({
            ContainingRequirement(Pumpkin()),
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.sweetener, 2.0)})),
          }),
        );

  @override
  String get assetName => 'pumpkin_cookie';

  @override
  String get name => 'Pumpkin Cookie';

  @override
  FoodType get type => FoodType.veggie;
}

class StuffedEggplant extends Recipe {
  // TODO: implement
  const StuffedEggplant()
      : super(
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

class HoneyNuggets extends Recipe {
  const HoneyNuggets()
      : super(
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

class HoneyHam extends Recipe {
  const HoneyHam()
      : super(
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

class Dragonpie extends Recipe {
  const Dragonpie()
      : super(
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

class Kabobs extends Recipe {
  const Kabobs()
      : super(
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

class MandrakeSoup extends Recipe {
  // TODO: implement
  const MandrakeSoup()
      : super(
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

class BaconAndEggs extends Recipe {
  const BaconAndEggs()
      : super(
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

class Meatballs extends Recipe {
  const Meatballs()
      : super(
          priority: -1,
          requirements: const Requirements({
            AtLeastRequirement({FoodValueCategory.meat}),
            NoRequirement(categories: {FoodValueCategory.inedible})
          }),
        );

  @override
  String get assetName => 'meatballs';

  @override
  String get name => 'Meatballs';

  @override
  FoodType get type => FoodType.meat;
}

class MeatyStew extends Recipe {
  const MeatyStew()
      : super(
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

class Pierogi extends Recipe {
  const Pierogi()
      : super(
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

class TurkeyDinner extends Recipe {
  // TODO: implement
  const TurkeyDinner()
      : super(
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

class Ratatouille extends Recipe {
  const Ratatouille()
      : super(
          priority: 0,
          requirements: const Requirements({
            MeetRequirement(FoodValues({FoodValue(FoodValueCategory.vegetable, 0.5)})),
            NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
          }),
        );

  @override
  String get assetName => 'ratatouille';

  @override
  String get name => 'Ratatouille';

  @override
  FoodType get type => throw UnimplementedError();
}

class FistFullOfJam extends Recipe {
  // TODO: implement
  const FistFullOfJam()
      : super(
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

class FruitMedley extends Recipe {
  // TODO: implement
  const FruitMedley()
      : super(
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

class FishTacos extends Recipe {
  // TODO: implement
  const FishTacos()
      : super(
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

class Waffles extends Recipe {
  // TODO: implement
  const Waffles()
      : super(
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

class MonsterLasagna extends Recipe {
  const MonsterLasagna()
      : super(
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

class Powdercake extends Recipe {
  const Powdercake()
      : super(
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

class Unagi extends Recipe {
  // TODO: implement
  const Unagi()
      : super(
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

class WetGoop extends Recipe {
  const WetGoop()
      : super(
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

class FlowerSalad extends Recipe {
  // TODO: implement
  const FlowerSalad()
      : super(
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

class IceCream extends Recipe {
  const IceCream()
      : super(
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

class Melonsicle extends Recipe {
  // TODO: implement
  const Melonsicle()
      : super(
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'melonsicle';

  @override
  String get name => 'Melonsicle';

  @override
  FoodType get type => throw UnimplementedError();
}

class TrailMix extends Recipe {
  const TrailMix()
      : super(
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

class SpicyChili extends Recipe {
  // TODO: implement
  const SpicyChili()
      : super(
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

class Guacamole extends Recipe {
  // TODO: implement
  const Guacamole()
      : super(
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

class BananaPop extends Recipe {
  // TODO: implement
  const BananaPop()
      : super(
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

class CaliforniaRoll extends Recipe {
  // TODO: implement
  const CaliforniaRoll()
      : super(
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

class Ceviche extends Recipe {
  // TODO: implement
  const Ceviche()
      : super(
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

class WobsterBisque extends Recipe {
  // TODO: implement
  const WobsterBisque()
      : super(
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

class WobsterDinner extends Recipe {
  // TODO: implement
  const WobsterDinner()
      : super(
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

class SeafoodGumbo extends Recipe {
  // TODO: implement
  const SeafoodGumbo()
      : super(
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

class SurfNTurf extends Recipe {
  // TODO: implement
  const SurfNTurf()
      : super(
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

class Jellybeans extends Recipe {
  // TODO: implement
  const Jellybeans()
      : super(
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'jellybeans';

  @override
  String get name => 'Jellybeans';

  @override
  FoodType get type => throw UnimplementedError();
}

class VegetableStinger extends Recipe {
  const VegetableStinger()
      : super(
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

class AsparagusSoup extends Recipe {
  // TODO: implement
  const AsparagusSoup()
      : super(
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

class StuffedPepperPoppers extends Recipe {
  const StuffedPepperPoppers()
      : super(
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

class SalsaFresca extends Recipe {
  const SalsaFresca()
      : super(
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
  String get assetName => 'salsa_fresca';

  @override
  String get name => 'Salsa Fresca';

  @override
  FoodType get type => throw UnimplementedError();
}

class FancySpiralledTubers extends Recipe {
  const FancySpiralledTubers()
      : super(
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

class BarnaclePita extends Recipe {
  // TODO: implement
  const BarnaclePita()
      : super(
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

class BarnacleNigiri extends Recipe {
  // TODO: implement
  const BarnacleNigiri()
      : super(
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

class BarnacleLinguine extends Recipe {
  // TODO: implement
  const BarnacleLinguine()
      : super(
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

class StuffedFishHeads extends Recipe {
  // TODO: implement
  const StuffedFishHeads()
      : super(
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

class MushyCake extends Recipe {
  // TODO: implement
  const MushyCake()
      : super(
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

class SoothingTea extends Recipe {
  const SoothingTea()
      : super(
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

class FigStuffedTrunk extends Recipe {
  const FigStuffedTrunk()
      : super(
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

class Figatoni extends Recipe {
  const Figatoni()
      : super(
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

class Figkabab extends Recipe {
  const Figkabab()
      : super(
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

class FiggyFrogwich extends Recipe {
  const FiggyFrogwich()
      : super(
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

class FrozenBananaDaiquiri extends Recipe {
  // TODO: implement
  const FrozenBananaDaiquiri()
      : super(
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

class BunnyStew extends Recipe {
  const BunnyStew()
      : super(
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

class BananaShake extends Recipe {
  // TODO: implement
  const BananaShake()
      : super(
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

class PlainOmelette extends Recipe {
  // TODO: implement
  const PlainOmelette()
      : super(
          priority: 0,
          requirements: const Requirements({}),
        );

  @override
  String get assetName => 'plain_omelette';

  @override
  String get name => 'Plain Omelette';

  @override
  FoodType get type => throw UnimplementedError();
}

class BreakfastSkillet extends Recipe {
  // TODO: implement
  const BreakfastSkillet()
      : super(
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

class TallScotchEggs extends Recipe {
  // TODO: implement
  const TallScotchEggs()
      : super(
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

class SteamedTwigs extends Recipe {
  const SteamedTwigs()
      : super(
          priority: -5,
          requirements: const Requirements({
            ContainingRequirement(Twigs(), 3),
          }),
        );

  @override
  String get assetName => 'steamed_twigs';

  @override
  String get name => 'Steamed Twigs';

  @override
  FoodType get type => throw UnimplementedError();
}

class BeefaloTreats extends Recipe {
  // TODO: implement
  const BeefaloTreats()
      : super(
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

class LeafyMeatloaf extends Recipe {
  const LeafyMeatloaf()
      : super(
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

class VeggieBurger extends Recipe {
  const VeggieBurger()
      : super(
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

class JellySalad extends Recipe {
  const JellySalad()
      : super(
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

class BeefyGreens extends Recipe {
  // TODO: implement
  const BeefyGreens()
      : super(
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

class MilkmadeHat extends Recipe {
  // TODO: implement
  const MilkmadeHat()
      : super(
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

class Amberosia extends Recipe {
  const Amberosia()
      : super(
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

class BeetSalho extends Recipe {
  // TODO: implement
  const BeetSalho()
      : super(
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

class CricketCrackers extends Recipe {
  // TODO: implement
  const CricketCrackers()
      : super(
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

class LeafySalad extends Recipe {
  // TODO: implement
  const LeafySalad()
      : super(
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

class Leafloaf extends Recipe {
  // TODO: implement
  const Leafloaf()
      : super(
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

class MixedVegetable extends Recipe {
  // TODO: implement
  const MixedVegetable()
      : super(
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

class BoneBouillon extends Recipe {
  // TODO: implement
  const BoneBouillon()
      : super(
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

class Moqueca extends Recipe {
  // TODO: implement
  const Moqueca()
      : super(
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

class MonsterTartare extends Recipe {
  // TODO: implement
  const MonsterTartare()
      : super(
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

class CreamyFettuccine extends Recipe {
  // TODO: implement
  const CreamyFettuccine()
      : super(
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

class Fruitcake extends Recipe {
  // TODO: implement
  const Fruitcake()
      : super(
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

class FreshFruitCrepes extends Recipe {
  // TODO: implement
  const FreshFruitCrepes()
      : super(
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

class HotChili extends Recipe {
  // TODO: implement
  const HotChili()
      : super(
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

class GlowBerryMousse extends Recipe {
  // TODO: implement
  const GlowBerryMousse()
      : super(
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

class MashedPotatoes extends Recipe {
  const MashedPotatoes()
      : super(
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

class GrimGalette extends Recipe {
  // TODO: implement
  const GrimGalette()
      : super(
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

class VoltGoatChaudFroid extends Recipe {
  // TODO: implement
  const VoltGoatChaudFroid()
      : super(
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

class FishCordonBleu extends Recipe {
  // TODO: implement
  const FishCordonBleu()
      : super(
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

class HotDragonChiliSalad extends Recipe {
  // TODO: implement
  const HotDragonChiliSalad()
      : super(
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

class Asparagazpacho extends Recipe {
  // TODO: implement
  const Asparagazpacho()
      : super(
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

class PuffedPotatoSouffle extends Recipe {
  // TODO: implement
  const PuffedPotatoSouffle()
      : super(
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
