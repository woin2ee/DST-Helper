import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/models/v2/item/item.dart';

extension Crops on Crop {
  static List<Crop> crops = [
    potato,
    carrot,
    corn,
    tomaRoot,
    asparagus,
    watermelon,
    pumpkin,
    eggplant,
    garlic,
    onion,
    pepper,
    pomegranate,
    dragonFruit,
    durian,
  ];

  static Crop potato = Crop(
    code: 'potato',
    assetName: 'potato',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  static Crop carrot = Crop(
    code: 'carrot',
    assetName: 'carrot',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.carrotSeed,
  );

  static Crop corn = Crop(
    code: 'corn',
    assetName: 'corn',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.cornSeed,
  );

  static Crop tomaRoot = Crop(
    code: 'tomato',
    assetName: 'toma_root',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -2, growthFormula: -2, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.tomaRootSeed,
  );

  static Crop asparagus = Crop(
    code: 'asparagus',
    assetName: 'asparagus',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.asparagusSeed,
  );

  static Crop watermelon = Crop(
    code: 'watermelon',
    assetName: 'watermelon',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: -2, growthFormula: 4, manure: -2),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.watermelonSeed,
  );

  static Crop pumpkin = Crop(
    code: 'pumpkin',
    assetName: 'pumpkin',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.pumpkinSeed,
  );

  static Crop eggplant = Crop(
    code: 'eggplant',
    assetName: 'eggplant',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.eggplantSeed,
  );

  static Crop garlic = Crop(
    code: 'garlic',
    assetName: 'garlic',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -8, growthFormula: 4, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.garlicSeed,
  );

  static Crop onion = Crop(
    code: 'onion',
    assetName: 'onion',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.onionSeed,
  );

  static Crop pepper = Crop(
    code: 'pepper',
    assetName: 'pepper',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.pepperSeed,
  );

  static Crop pomegranate = Crop(
    code: 'pomegranate',
    assetName: 'pomegranate',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.pomegranateSeed,
  );

  static Crop dragonFruit = Crop(
    code: 'dragonfruit',
    assetName: 'dragon_fruit',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.dragonFruitSeed,
  );

  static Crop durian = Crop(
    code: 'durian',
    assetName: 'durian',
    foodValues: FoodValues({
      const FoodValue(FoodValueCategory.fruit, 1.0),
      const FoodValue(FoodValueCategory.monster, 1.0),
    }),
    nutrient: const Nutrient(compost: -8, growthFormula: 4, manure: 4),
    seasons: {Season.spring},
    type: FoodType.veggie,
    seed: Seeds.durianSeed,
  );
}

extension Weeds on Weed {
  static Weed forgetMeLots = const Weed.forgetMeLots(
    code: 'forgetmelots',
    assetName: 'forget_me_lots',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
    foodValues: null,
  );

  static Weed fireNettleFronds = const Weed(
    code: 'firenettles',
    assetName: 'fire_nettle_fronds',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );

  static Weed tillweeds = const Weed(
    code: 'tillweed',
    assetName: 'tillweeds',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );

  static Weed spinyBindweed = const Weed(
    code: 'weed_ivy',
    assetName: '',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );
}

extension Seeds on Seed {
  static const Seed seeds = Seed(
    code: 'seeds',
    assetName: 'seeds',
    type: FoodType.seeds,
    cookedAssetName: 'toasted_seeds',
    compositeAssetName: null,
  );

  static const Seed potatoSeed = Seed(
    code: 'potato_seeds',
    assetName: 'potato_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed carrotSeed = Seed(
    code: 'carrot_seeds',
    assetName: 'carrot_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed cornSeed = Seed(
    code: 'corn_seeds',
    assetName: 'corn_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed tomaRootSeed = Seed(
    code: 'tomato_seeds',
    assetName: 'toma_root_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed asparagusSeed = Seed(
    code: 'asparagus_seeds',
    assetName: 'asparagus_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed watermelonSeed = Seed(
    code: 'watermelon_seeds',
    assetName: 'watermelon_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed pumpkinSeed = Seed(
    code: 'pumpkin_seeds',
    assetName: 'pumpkin_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed eggplantSeed = Seed(
    code: 'eggplant_seeds',
    assetName: 'eggplant_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed garlicSeed = Seed(
    code: 'garlic_seeds',
    assetName: 'garlic_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed onionSeed = Seed(
    code: 'onion_seeds',
    assetName: 'onion_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed pepperSeed = Seed(
    code: 'pepper_seeds',
    assetName: 'pepper_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed pomegranateSeed = Seed(
    code: 'pomegranate_seeds',
    assetName: 'pomegranate_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed dragonFruitSeed = Seed(
    code: 'dragonfruit_seeds',
    assetName: 'dragon_fruit_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

  static const Seed durianSeed = Seed(
    code: 'durian_seeds',
    assetName: 'durian_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );
}

extension Foods on Food {}

extension EdibleIngredients on EdibleIngredient {
  // TODO: Implementation is not checked
  static const EdibleIngredient barnacles = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient batiliskWing = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient berries = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient roastedBirchnut = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient butter = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient butterflyWings = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient cactusFlesh = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient cactusFlower = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient banana = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient popcorn = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient deadWobster = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient deliciousWobster = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient deerclopsEyeball = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient preparedDragonFruit = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient drumstick = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient extraSmellyDurian = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient eel = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient electricMilk = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient egg = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient braisedEggplant = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient fig = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient fish = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient fishMorsel = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient foliage = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient frogLegs = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient glowBerry = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient lesserGlowBerry = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient honey = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient ice = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient juicyBerries = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient kelpFronds = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient driedKelpFronds = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient koalefantTrunk = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient winterKoalefantTrunk = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient leafyMeat = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient lichen = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient lightBulb = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient luneTreeBlossom = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient mandrake = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient meat = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient milkyWhites = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient monsterMeat = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient moonShroom = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient moonMothWings = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient morsel = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient smallJerky = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient blueCap = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient greenCap = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient redCap = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient nakedNostrils = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient charredNostrils = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient petals = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient darkPetals = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient phlegm = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient slicedPomegranate = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient hotPumpkin = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient rawFish = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient fishSteak = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient rot = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient rottenEgg = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient royalJelly = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient toastedSeeds = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient cropSeeds = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient ripeStoneFruit = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient succulent = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient tallbirdEgg = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient grilledWatermelon = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient stuffedNightCap = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient collectedDust = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient popperfish = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );
}

extension Ingredients on Ingredient {
// TODO: Implementation is not checked
  static Ingredient twigs = const Ingredient(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
  );
  // TODO: Implementation is not checked
  static Ingredient nightmareFuel = const Ingredient(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
  );
}

extension Fertilizers on Fertilizer {
  static const List<Fertilizer> fertilizers = [
    manure,
    fertilizer,
    guano,
    compost,
    rottenEgg,
    rot,
    growthFormulaStarter,
    fermentingGrowthFormula,
    fermentedGrowthFormula,
    superGrowthFormula,
    spoiledFish,
    spoiledFishMorsel,
    compostWrap,
    glommerFuel,
    treeJam,
  ];

  static const List<Fertilizer> compostList = [
    rot,
    rottenEgg,
    compost,
  ];

  static const List<Fertilizer> growthFormulaList = [
    spoiledFishMorsel,
    spoiledFish,
    growthFormulaStarter,
  ];

  static const List<Fertilizer> manureList = [
    manure,
    guano,
    fertilizer,
  ];

  static const List<Fertilizer> mixList = [
    glommerFuel,
    treeJam,
    compostWrap,
  ];

  static const Fertilizer manure = Fertilizer(
    code: 'poop',
    assetName: 'manure',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 8),
  );

  static const Fertilizer fertilizer = Fertilizer(
    code: 'fertilizer',
    assetName: 'bucket-o-poop',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 16),
  );

  static const Fertilizer guano = Fertilizer(
    code: 'guano',
    assetName: 'guano',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 16),
  );

  static const Fertilizer compost = Fertilizer(
    code: 'compost',
    assetName: 'compost',
    nutrient: Nutrient(compost: 24, growthFormula: 0, manure: 0),
  );

  static const Fertilizer rottenEgg = Fertilizer(
    code: 'rottenegg',
    assetName: 'rotten_egg',
    nutrient: Nutrient(compost: 16, growthFormula: 0, manure: 0),
  );

  static const Fertilizer rot = Fertilizer(
    code: 'spoiled_food',
    assetName: 'rot',
    nutrient: Nutrient(compost: 8, growthFormula: 0, manure: 0),
  );

  static const Fertilizer growthFormulaStarter = Fertilizer(
    code: 'soil_amender',
    assetName: 'growth_formula_starter',
    nutrient: Nutrient(compost: 0, growthFormula: 8, manure: 0),
  );

  static const Fertilizer fermentingGrowthFormula = Fertilizer(
    code: 'soil_amender',
    assetName: 'fermenting_growth_formula',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  static const Fertilizer fermentedGrowthFormula = Fertilizer(
    code: 'soil_amender',
    assetName: 'fermented_growth_formula',
    nutrient: Nutrient(compost: 0, growthFormula: 32, manure: 0),
  );

  static const Fertilizer superGrowthFormula = Fertilizer(
    code: 'soil_amender',
    assetName: 'super_growth_formula',
    nutrient: Nutrient(compost: 0, growthFormula: 32, manure: 0),
  );

  static const Fertilizer spoiledFish = Fertilizer(
    code: 'spoiled_fish',
    assetName: 'spoiled_fish',
    nutrient: Nutrient(compost: 0, growthFormula: 16, manure: 0),
  );

  static const Fertilizer spoiledFishMorsel = Fertilizer(
    code: 'spoiled_fish_small',
    assetName: 'spoiled_fish_morsel',
    nutrient: Nutrient(compost: 0, growthFormula: 8, manure: 0),
  );

  static const Fertilizer compostWrap = Fertilizer(
    code: 'compostwrap',
    assetName: 'compost_wrap',
    nutrient: Nutrient(compost: 32, growthFormula: 24, manure: 24),
  );

  static const Fertilizer glommerFuel = Fertilizer(
    code: 'glommerfuel',
    assetName: 'glommer_fuel',
    nutrient: Nutrient(compost: 8, growthFormula: 8, manure: 8),
  );

  static const Fertilizer treeJam = Fertilizer(
    code: 'treegrowthsolution',
    assetName: 'tree_jam',
    nutrient: Nutrient(compost: 32, growthFormula: 8, manure: 8),
  );
}
