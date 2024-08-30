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
    foodValues: FoodValues({const FoodValue(category: FoodValueCategory.vegetable, quantifiedValue: 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop carrot = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop corn = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop tomaRoot = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop asparagus = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop watermelon = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop pumpkin = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop eggplant = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop garlic = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop onion = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop pepper = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop pomegranate = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop dragonFruit = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  // TODO: Implementation is not checked
  static Crop durian = const Crop(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
    seasons: {},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );
}

extension Weeds on Weed {
  // TODO: Implementation is not checked
  static Weed forgetMeLots = const Weed.forgetMeLots(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
    foodValues: null,
  );
  // TODO: Implementation is not checked
  static Weed fireNettleFronds = const Weed(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );
  // TODO: Implementation is not checked
  static Weed tillweeds = const Weed(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );
  // TODO: Implementation is not checked
  static Weed spinyBindweed = const Weed(
    code: 'code',
    assetName: 'assetName',
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

// TODO: Implementation is not checked
  static const Seed carrotSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed cornSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed tomaRootSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed asparagusSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed watermelonSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed pumpkinSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed eggplantSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed garlicSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed onionSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed pepperSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed pomegranateSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed dragonFruitSeed = Seed(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.seeds,
    compositeAssetName: null,
    cookedAssetName: 'toasted_seeds',
  );

// TODO: Implementation is not checked
  static const Seed durianSeed = Seed(
    code: 'code',
    assetName: 'assetName',
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

  // TODO: Implementation is not checked
  static const Fertilizer manure = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer fertilizer = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer guano = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer compost = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer rottenEgg = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer rot = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer growthFormulaStarter = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer fermentingGrowthFormula = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer fermentedGrowthFormula = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer superGrowthFormula = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer spoiledFish = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer spoiledFishMorsel = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer compostWrap = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer glommerFuel = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );

  // TODO: Implementation is not checked
  static const Fertilizer treeJam = Fertilizer(
    code: 'code',
    assetName: 'assetName',
    nutrient: Nutrient(compost: 0, growthFormula: 0, manure: 0),
  );
}
