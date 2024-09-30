import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:dst_helper/models/v2/item/requirement.dart';
import 'package:dst_helper/models/v2/status_value.dart';

extension Crops on Crop {
  static final List<Crop> crops = [
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

  static final Crop potato = Crop(
    code: 'potato',
    assetName: 'potato',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.potatoSeed,
  );

  static final Crop carrot = Crop(
    code: 'carrot',
    assetName: 'carrot',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.carrotSeed,
  );

  static final Crop corn = Crop(
    code: 'corn',
    assetName: 'corn',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.cornSeed,
  );

  static final Crop tomaRoot = Crop(
    code: 'tomato',
    assetName: 'toma_root',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -2, growthFormula: -2, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.tomaRootSeed,
  );

  static final Crop asparagus = Crop(
    code: 'asparagus',
    assetName: 'asparagus',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.asparagusSeed,
  );

  static final Crop watermelon = Crop(
    code: 'watermelon',
    assetName: 'watermelon',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: -2, growthFormula: 4, manure: -2),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.watermelonSeed,
  );

  static final Crop pumpkin = Crop(
    code: 'pumpkin',
    assetName: 'pumpkin',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.pumpkinSeed,
  );

  static final Crop eggplant = Crop(
    code: 'eggplant',
    assetName: 'eggplant',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.eggplantSeed,
  );

  static final Crop garlic = Crop(
    code: 'garlic',
    assetName: 'garlic',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: -8, growthFormula: 4, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Seeds.garlicSeed,
  );

  static final Crop onion = Crop(
    code: 'onion',
    assetName: 'onion',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.onionSeed,
  );

  static final Crop pepper = Crop(
    code: 'pepper',
    assetName: 'pepper',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Seeds.pepperSeed,
  );

  static final Crop pomegranate = Crop(
    code: 'pomegranate',
    assetName: 'pomegranate',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.pomegranateSeed,
  );

  static final Crop dragonFruit = Crop(
    code: 'dragonfruit',
    assetName: 'dragon_fruit',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 1.0)}),
    nutrient: const Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Seeds.dragonFruitSeed,
  );

  static final Crop durian = Crop(
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
  static const Plant forgetMeLots = Plant.forgetMeLots(
    code: 'forgetmelots',
    assetName: 'forget_me_lots',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
    foodValues: null,
  );

  static const Weed fireNettleFronds = Weed(
    code: 'firenettles',
    assetName: 'fire_nettle_fronds',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );

  static const Weed tillweeds = Weed(
    code: 'tillweed',
    assetName: 'tillweeds',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );

  static const Weed spinyBindweed = Weed(
    code: 'weed_ivy',
    assetName: 'spiny_bindweed',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
  );
}

extension Seeds on Seed {
  static const Seed seeds = Seed(
    code: 'seeds',
    assetName: 'seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed potatoSeed = Seed(
    code: 'potato_seeds',
    assetName: 'potato_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed carrotSeed = Seed(
    code: 'carrot_seeds',
    assetName: 'carrot_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed cornSeed = Seed(
    code: 'corn_seeds',
    assetName: 'corn_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed tomaRootSeed = Seed(
    code: 'tomato_seeds',
    assetName: 'toma_root_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed asparagusSeed = Seed(
    code: 'asparagus_seeds',
    assetName: 'asparagus_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed watermelonSeed = Seed(
    code: 'watermelon_seeds',
    assetName: 'watermelon_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed pumpkinSeed = Seed(
    code: 'pumpkin_seeds',
    assetName: 'pumpkin_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed eggplantSeed = Seed(
    code: 'eggplant_seeds',
    assetName: 'eggplant_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed garlicSeed = Seed(
    code: 'garlic_seeds',
    assetName: 'garlic_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed onionSeed = Seed(
    code: 'onion_seeds',
    assetName: 'onion_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed pepperSeed = Seed(
    code: 'pepper_seeds',
    assetName: 'pepper_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed pomegranateSeed = Seed(
    code: 'pomegranate_seeds',
    assetName: 'pomegranate_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed dragonFruitSeed = Seed(
    code: 'dragonfruit_seeds',
    assetName: 'dragon_fruit_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  static const Seed durianSeed = Seed(
    code: 'durian_seeds',
    assetName: 'durian_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );
}

extension Foods on Food {}

extension EdibleIngredients on EdibleIngredient {
  // TODO: Implementation is not checked
  static final EdibleIngredient barnacles = EdibleIngredient(
    code: 'code',
    assetName: 'barnacles',
    type: FoodType.generic,
    foodValues: FoodValues({
      const FoodValue(FoodValueCategory.meat, 0.25),
      const FoodValue(FoodValueCategory.fish, 0.25),
    }),
  );

  // TODO: Implementation is not checked
  static final EdibleIngredient batiliskWing = EdibleIngredient(
    code: 'code',
    assetName: 'batilisk_wing',
    type: FoodType.generic,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 0.5)}),
  );

  static final EdibleIngredient berries = EdibleIngredient(
    code: 'berries',
    assetName: 'berries',
    type: FoodType.veggie,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient roastedBirchnut = EdibleIngredient(
    code: 'code',
    assetName: 'roasted_birchnut',
    type: FoodType.generic,
    foodValues: null,
  );

  static final EdibleIngredient butter = EdibleIngredient(
    code: 'butter',
    assetName: 'butter',
    type: FoodType.generic,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.dairy, 1.0)}),
  );

  static const EdibleIngredient butterflyWings = EdibleIngredient(
    code: 'butterflywings',
    assetName: 'butterfly_wings',
    type: FoodType.veggie,
    foodValues: null,
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

  static final EdibleIngredient drumstick = EdibleIngredient(
    code: 'drumstick',
    assetName: 'drumstick',
    type: FoodType.meat,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 0.5)}),
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

  static final EdibleIngredient fig = EdibleIngredient(
    code: 'fig',
    assetName: 'fig',
    type: FoodType.veggie,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)}),
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

  static final EdibleIngredient frogLegs = EdibleIngredient(
    code: 'froglegs',
    assetName: 'frog_legs',
    type: FoodType.meat,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 0.5)}),
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
  static final EdibleIngredient honey = EdibleIngredient(
    code: 'code',
    assetName: 'honey',
    type: FoodType.generic,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.sweetener, 1.0)}),
  );

  static const EdibleIngredient ice = EdibleIngredient(
    code: 'ice',
    assetName: 'ice',
    type: FoodType.generic,
    foodValues: null,
  );

  // TODO: Implementation is not checked
  static final EdibleIngredient juicyBerries = EdibleIngredient(
    code: 'code',
    assetName: 'juicy_berries',
    type: FoodType.veggie,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)}),
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

  static const EdibleIngredient koalefantTrunk = EdibleIngredient(
    code: 'trunk_summer',
    assetName: 'koalefant_trunk',
    type: FoodType.meat,
    foodValues: null,
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient winterKoalefantTrunk = EdibleIngredient(
    code: 'code',
    assetName: 'winter_koalefant_trunk',
    type: FoodType.meat,
    foodValues: null,
  );

  // TODO: Implementation is not checked
  static final EdibleIngredient leafyMeat = EdibleIngredient(
    code: 'code',
    assetName: 'leafy_meat',
    type: FoodType.meat,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 1.0)}),
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

  static final EdibleIngredient mandrake = EdibleIngredient(
    code: 'mandrake',
    assetName: 'mandrake',
    type: FoodType.veggie,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
  );

  // TODO: Implementation is not checked
  static final EdibleIngredient meat = EdibleIngredient(
    code: 'code',
    assetName: 'meat',
    type: FoodType.meat,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 1.0)}),
  );

  // TODO: Implementation is not checked
  static const EdibleIngredient milkyWhites = EdibleIngredient(
    code: 'code',
    assetName: 'assetName',
    type: FoodType.generic,
    foodValues: FoodValues({}),
  );

  // TODO: Implementation is not checked
  static final EdibleIngredient monsterMeat = EdibleIngredient(
    code: 'code',
    assetName: 'monster_meat',
    type: FoodType.meat,
    foodValues: FoodValues({
      const FoodValue(FoodValueCategory.meat, 1.0),
      const FoodValue(FoodValueCategory.monster, 1.0),
    }),
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
  static final EdibleIngredient morsel = EdibleIngredient(
    code: 'code',
    assetName: 'morsel',
    type: FoodType.meat,
    foodValues: FoodValues({const FoodValue(FoodValueCategory.meat, 0.5)}),
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
  static final Ingredient twigs = Ingredient(
    code: 'twigs',
    assetName: 'twigs',
    foodValues: FoodValues({const FoodValue(FoodValueCategory.inedible, 1.0)}),
  );
  // TODO: Implementation is not checked
  static const Ingredient nightmareFuel = Ingredient(
    code: 'code',
    assetName: 'assetName',
    foodValues: FoodValues({}),
  );

  static const Ingredient collectedDust = Ingredient(
    code: 'refined_dust',
    assetName: 'collected_dust',
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

extension Recipes on Recipe {
  static final List<Recipe> recipes = [
    amberosia, // Amberosia
    asparagusSoup, // Asparagus Soup
    baconAndEggs, // Bacon and Eggs
    bananaPop, // Banana Pop
    bananaShake, // Banana Shake
    barnacleLinguine, // Barnacle Linguine
    barnacleNigiri, // Barnacle Nigiri
    barnaclePita, // Barnacle Pita
    beefaloTreats, // Beefalo Treats
    beefyGreens, // Beefy Greens
    breakfastSkillet, // Breakfast Skillet
    bunnyStew, // Bunny Stew
    butterMuffin, // Butter Muffin
    californiaRoll, // California Roll
    ceviche, // Ceviche
    creamyPotatoPuree, // Creamy Potato Purée
    dragonpie, // Dragonpie
    fancySpiralledTubers, // Fancy Spiralled Tubers
    figatoni, // Figatoni
    figgyFrogwich, // Figgy Frogwich
    figkabab, // Figkabab
    figStuffedTrunk, // Fig-Stuffed Trunk
    fishTacos, // Fish Tacos
    fishsticks, // Fishsticks
    fistFullOfJam, // Fist Full of Jam
    flowerSalad, // Flower Salad
    froggleBunwich, // Froggle Bunwich
    frozenBananaDaiquiri, // Frozen Banana Daiquiri
    fruitMedley, // Fruit Medley
    guacamole, // Guacamole
    honeyHam, // Honey Ham
    honeyNuggets, // Honey Nuggets
    iceCream, // Ice Cream
    jellybeans, // Jellybeans
    jellySalad, // Jelly Salad
    kabobs, // Kabobs
    mandrakeSoup, // Mandrake Soup
    meatballs, // Meatballs
    meatyStew, // Meaty Stew
    melonsicle, // Melonsicle
    milkmadeHat, // Milkmade Hat
    monsterLasagna, // Monster Lasagna
    mushyCake, // Mushy Cake
    leafyMeatloaf, // Leafy Meatloaf
    pierogi, // Pierogi
    plainOmelette, // Plain Omelette
    powdercake, // Powdercake
    pumpkinCookie, // Pumpkin Cookie
    ratatouille, // Ratatouille
    salsaFresca, // Salsa Fresca
    seafoodGumbo, // Seafood Gumbo
    soothingTea, // Soothing Tea
    spicyChili, // Spicy Chili
    steamedTwigs, // Steamed Twigs
    stuffedEggplant, // Stuffed Eggplant
    stuffedFishHeads, // Stuffed Fish Heads
    stuffedNightCap, // Stuffed Night Cap
    stuffedPepperPoppers, // Stuffed Pepper Poppers
    surfNTurf, // Surf 'n' Turf
    taffy, // Taffy
    tallScotchEggs, // Tall Scotch Eggs
    trailMix, // Trail Mix
    turkeyDinner, // Turkey Dinner
    unagi, // Unagi
    veggieBurger, // Veggie Burger
    vegetableStinger, // Vegetable Stinger
    waffles, // Waffles
    wetGoop, // Wet Goop
    wobsterBisque, // Wobster Bisque
    wobsterDinner, // Wobster Dinner
  ];

  static const Recipe amberosia = Recipe(
    code: 'dustmeringue',
    assetName: 'amberosia',
    hungerValue: NotApplicableStatusValue(),
    sanityValue: NotApplicableStatusValue(),
    healthValue: NotApplicableStatusValue(),
    maxPerishTimeValue: NotApplicableStatusValue(),
    cookTimeValue: SecStatusValue(40),
    priority: 100,
    requirements: Requirements({
      ContainingRequirement(Ingredients.collectedDust),
    }),
  );

  static final Recipe asparagusSoup = Recipe(
    code: 'asparagussoup',
    assetName: 'asparagus_soup',
    priority: 10,
    hungerValue: const NumericStatusValue(18.75),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Crops.asparagus),
      MeetRequirement(FoodValues({
        const FoodValue(FoodValueCategory.vegetable, 2.5),
      })),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.inedible,
      }),
    }),
  );

  static final Recipe baconAndEggs = Recipe(
    code: 'baconeggs',
    assetName: 'bacon_and_eggs',
    hungerValue: const NumericStatusValue(75),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(20),
    cookTimeValue: const SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ExcessRequirement(FoodValues({
        const FoodValue(FoodValueCategory.meat, 1.0),
        const FoodValue(FoodValueCategory.egg, 1.0),
      })),
      const NoRequirement(categories: {FoodValueCategory.vegetable}),
    }),
  );

  static final Recipe bananaPop = Recipe(
    code: 'bananapop',
    assetName: 'banana_pop',
    priority: 20,
    hungerValue: const NumericStatusValue(12.5),
    sanityValue: const NumericStatusValue(33),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(3),
    cookTimeValue: const SecStatusValue(10),
    requirements: Requirements({
      const ContainingRequirement(EdibleIngredients.banana),
      const ContainingRequirement(EdibleIngredients.ice),
      ContainingRequirement(Ingredients.twigs),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.fish,
      }),
    }),
  );

  static const Recipe bananaShake = Recipe(
    code: 'bananajuice',
    assetName: 'banana_shake',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(8),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.banana, 2),
      NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.fish,
        FoodValueCategory.monster,
      }),
    }),
  );

  static const Recipe barnacleLinguine = Recipe(
    code: 'barnaclinguine',
    assetName: 'barnacle_linguine',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(20),
    healthValue: NumericStatusValue(10),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(40),
    priority: 30,
    requirements: Requirements({}),
  );

  static const Recipe barnacleNigiri = Recipe(
    code: 'barnaclesushi',
    assetName: 'barnacle_nigiri',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: 30,
    requirements: Requirements({}),
  );

  static const Recipe barnaclePita = Recipe(
    code: 'barnaclepita',
    assetName: 'barnacle_pita',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 25,
    requirements: Requirements({}),
  );

  static const Recipe beefaloTreats = Recipe(
    code: 'beefalotreat',
    assetName: 'beefalo_treats',
    hungerValue: NotApplicableStatusValue(),
    sanityValue: NotApplicableStatusValue(),
    healthValue: NotApplicableStatusValue(),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(40),
    priority: -4,
    requirements: Requirements({}),
  );

  static const Recipe beefyGreens = Recipe(
    code: 'meatysalad',
    assetName: 'beefy_greens',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(40),
    priority: 25,
    requirements: Requirements({}),
  );

  static const Recipe breakfastSkillet = Recipe(
    code: 'veggieomlet',
    assetName: 'breakfast_skillet',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(20),
    cookTimeValue: SecStatusValue(20),
    priority: 1,
    requirements: Requirements({}),
  );

  static const Recipe bunnyStew = Recipe(
    code: 'bunnystew',
    assetName: 'bunny_stew',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: 1,
    requirements: Requirements({
      AtLeastRequirement({FoodValueCategory.meat}),
      ContainingRequirement(EdibleIngredients.ice, 2),
      NoRequirement(categories: {FoodValueCategory.inedible}),
      MaxRequirement(FoodValue(FoodValueCategory.meat, 0.75)),
    }),
  );

  static final Recipe butterMuffin = Recipe(
    code: 'butterflymuffin',
    assetName: 'butter_muffin',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 1,
    requirements: Requirements({
      const OrRequirement({
        ContainingRequirement(EdibleIngredients.butterflyWings),
        ContainingRequirement(EdibleIngredients.moonMothWings),
      }),
      MeetRequirement(FoodValues({
        const FoodValue(FoodValueCategory.vegetable, 0.5),
      })),
      const NoRequirement(categories: {FoodValueCategory.meat}),
    }),
  );

  static const Recipe californiaRoll = Recipe(
    code: 'californiaroll',
    assetName: 'california_roll',
    priority: 20,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
  );

  static const Recipe ceviche = Recipe(
    code: 'ceviche',
    assetName: 'ceviche',
    priority: 20,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
  );

  static final Recipe creamyPotatoPuree = Recipe(
    code: 'mashedpotatoes',
    assetName: 'mashedpotatoes',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(33),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(20),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Crops.potato, 2),
      ContainingRequirement(Crops.garlic),
      const NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
    }),
  );

  static final Recipe dragonpie = Recipe(
    code: 'dragonpie',
    assetName: 'dragonpie',
    hungerValue: const NumericStatusValue(75),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(40),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(Crops.dragonFruit),
      const NoRequirement(categories: {FoodValueCategory.meat}),
    }),
  );

  static final Recipe fancySpiralledTubers = Recipe(
    code: 'potatotornado',
    assetName: 'fancy_spiralled_tubers',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(15),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(15),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Crops.potato),
      ContainingRequirement(Ingredients.twigs),
      const NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.monster}),
      const MaxRequirement(FoodValue(FoodValueCategory.inedible, 2.0)),
    }),
  );

  static final Recipe figatoni = Recipe(
    code: 'figatoni',
    assetName: 'figatoni',
    hungerValue: const NumericStatusValue(56.25),
    sanityValue: const NumericStatusValue(15),
    healthValue: const NumericStatusValue(30),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(40),
    priority: 30,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.fig),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.vegetable, 2.0)})),
      const NoRequirement(categories: {FoodValueCategory.meat}),
    }),
  );

  static final Recipe figgyFrogwich = Recipe(
    code: 'frognewton',
    assetName: 'figgy_frogwich',
    hungerValue: const NumericStatusValue(18.75),
    sanityValue: const NumericStatusValue(10),
    healthValue: const NumericStatusValue(8),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.fig),
      ContainingRequirement(EdibleIngredients.frogLegs),
    }),
  );

  static final Recipe figkabab = Recipe(
    code: 'figkabab',
    assetName: 'figkabab',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(15),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(20),
    priority: 30,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.fig),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.meat, 1.0)})),
      ContainingRequirement(Ingredients.twigs),
    }),
  );

  static final Recipe figStuffedTrunk = Recipe(
    code: 'koalefig_trunk',
    assetName: 'fig_stuffed_trunk',
    hungerValue: const NumericStatusValue(56.25),
    sanityValue: const NumericStatusValue(0),
    healthValue: const NumericStatusValue(60),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(40),
    priority: 40,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.fig),
      const OrRequirement({
        ContainingRequirement(EdibleIngredients.koalefantTrunk),
        ContainingRequirement(EdibleIngredients.winterKoalefantTrunk),
      }),
    }),
  );

  static const Recipe fishTacos = Recipe(
    code: 'fishtacos',
    assetName: 'fish_tacos',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({}),
  );

  static final Recipe fishsticks = Recipe(
    code: 'fishsticks',
    assetName: 'fishsticks',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(40),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      const AtLeastRequirement({FoodValueCategory.fish}),
      ContainingRequirement(Ingredients.twigs),
      const MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)), // Fillers cannot be `Inedibles`.
    }),
  );

  static final Recipe fistFullOfJam = Recipe(
    code: 'jammypreserves',
    assetName: 'fist_full_of_jam',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(10),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)})),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.vegetable,
        FoodValueCategory.inedible,
      }),
    }),
  );

  static const Recipe flowerSalad = Recipe(
    code: 'flowersalad',
    assetName: 'flower_salad',
    hungerValue: NumericStatusValue(12.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({}),
  );

  static const Recipe froggleBunwich = Recipe(
    code: 'frogglebunwich',
    assetName: 'froggle_bunwich',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 1,
    requirements: Requirements({}),
  );

  static const Recipe frozenBananaDaiquiri = Recipe(
    code: 'frozenbananadaiquiri',
    assetName: 'frozen_banana_daiquiri',
    hungerValue: NumericStatusValue(18.75),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 1,
    requirements: Requirements({}),
  );

  static final Recipe fruitMedley = Recipe(
    code: 'fruitmedley',
    assetName: 'fruit_medley',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(10),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.fruit, 3.0)})),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.vegetable,
      }),
    }),
  );

  static const Recipe guacamole = Recipe(
    code: 'guacamole',
    assetName: 'guacamole',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({}),
  );

  static final Recipe honeyHam = Recipe(
    code: 'honeyham',
    assetName: 'honey_ham',
    hungerValue: const NumericStatusValue(75),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(30),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 2,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.honey),
      ExcessRequirement(FoodValues({const FoodValue(FoodValueCategory.meat, 1.5)})),
      const NoRequirement(categories: {FoodValueCategory.inedible}),
      const MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
    }),
  );

  static const Recipe honeyNuggets = Recipe(
    code: 'honeynuggets',
    assetName: 'honey_nuggets',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 2,
    requirements: Requirements({}),
  );

  static final Recipe iceCream = Recipe(
    code: 'icecream',
    assetName: 'ice_cream',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(50),
    healthValue: const NumericStatusValue(0),
    maxPerishTimeValue: const DayStatusValue(3),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      const ContainingRequirement(EdibleIngredients.ice),
      MeetRequirement(FoodValues({
        const FoodValue(FoodValueCategory.dairy, 1.0),
        const FoodValue(FoodValueCategory.sweetener, 1.0),
      })),
    }),
  );

  static const Recipe jellybeans = Recipe(
    code: 'jellybean',
    assetName: 'jellybeans',
    hungerValue: NumericStatusValue(0),
    sanityValue: NumericStatusValue(5),
    healthValue: DurationStatusValue(value: 122, minute: 2),
    maxPerishTimeValue: NotApplicableStatusValue(),
    cookTimeValue: SecStatusValue(50),
    priority: 12,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.royalJelly),
      NoRequirement(categories: {
        FoodValueCategory.inedible,
        FoodValueCategory.monster,
      }),
    }),
  );

  static final Recipe jellySalad = Recipe(
    code: 'leafymeatsouffle',
    assetName: 'jelly_salad',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(50),
    healthValue: const NumericStatusValue(0),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(40),
    priority: 50,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.leafyMeat, 2),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.sweetener, 2.0)})),
    }),
  );

  static final Recipe kabobs = Recipe(
    code: 'kabobs',
    assetName: 'kabobs',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 5,
    requirements: Requirements({
      const AtLeastRequirement({FoodValueCategory.meat}),
      ContainingRequirement(Ingredients.twigs),
      // Actually, `NoRequirement` should be here, but it requires 1 Twigs.
      const MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)),
      const MaxRequirement(FoodValue(FoodValueCategory.monster, 1.0)),
    }),
  );

  static const Recipe mandrakeSoup = Recipe(
    code: 'mandrakesoup',
    assetName: 'mandrake_soup',
    hungerValue: NumericStatusValue(150),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(100),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(60),
    priority: 10,
    requirements: Requirements({}),
  );

  static const Recipe meatballs = Recipe(
    code: 'meatballs',
    assetName: 'meatballs',
    hungerValue: NumericStatusValue(62.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(15),
    priority: -1,
    requirements: Requirements({
      AtLeastRequirement({FoodValueCategory.meat}),
      NoRequirement(categories: {FoodValueCategory.inedible})
    }),
  );

  static final Recipe meatyStew = Recipe(
    code: 'bonestew',
    assetName: 'meaty_stew',
    hungerValue: const NumericStatusValue(150),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(12),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(15),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.meat, 3.0)})),
      NoRequirement(
        categories: {FoodValueCategory.inedible},
        ingredients: {EdibleIngredients.tallbirdEgg, EdibleIngredients.mandrake},
      ),
    }),
  );

  static final Recipe melonsicle = Recipe(
    code: 'watermelonicle',
    assetName: 'melonsicle',
    hungerValue: const NumericStatusValue(12.5),
    sanityValue: const NumericStatusValue(20),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(3),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Crops.watermelon),
      const ContainingRequirement(EdibleIngredients.ice),
      ContainingRequirement(Ingredients.twigs),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.egg,
        FoodValueCategory.vegetable,
      }),
    }),
  );

  static const Recipe milkmadeHat = Recipe(
    code: 'batnosehat',
    assetName: 'milkmade_hat',
    hungerValue: DurationStatusValue(value: 187.5, minute: 4),
    sanityValue: DurationStatusValue(value: -5.3, minute: 4),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: NotApplicableStatusValue(),
    cookTimeValue: SecStatusValue(40),
    priority: 55,
    requirements: Requirements({}),
  );

  static final Recipe monsterLasagna = Recipe(
    code: 'monsterlasagna',
    assetName: 'monster_lasagna',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(-20),
    healthValue: const NumericStatusValue(-20),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.monster, 2.0)})),
      const NoRequirement(categories: {FoodValueCategory.inedible}),
    }),
  );

  static const Recipe mushyCake = Recipe(
    code: 'shroomcake',
    assetName: 'mushy_cake',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 30,
    requirements: Requirements({}),
  );

  static final Recipe leafyMeatloaf = Recipe(
    code: 'leafloaf',
    assetName: 'leafy_meatloaf',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(8),
    maxPerishTimeValue: const DayStatusValue(20),
    cookTimeValue: const SecStatusValue(40),
    priority: 25,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.leafyMeat, 2),
    }),
  );

  static final Recipe pierogi = Recipe(
    code: 'perogies',
    assetName: 'pierogi',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(40),
    maxPerishTimeValue: const DayStatusValue(20),
    cookTimeValue: const SecStatusValue(20),
    priority: 5,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.egg, 1.0)})),
      const AtLeastRequirement({FoodValueCategory.meat, FoodValueCategory.vegetable}),
      const NoRequirement(categories: {FoodValueCategory.inedible}),
    }),
  );

  static final Recipe plainOmelette = Recipe(
    code: 'justeggs',
    assetName: 'plain_omelette',
    hungerValue: const NumericStatusValue(50),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(20),
    cookTimeValue: const SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.egg, 3.0)})),
    }),
  );

  static final Recipe powdercake = Recipe(
    code: 'powcake',
    assetName: 'powdercake',
    hungerValue: const NumericStatusValue(0),
    sanityValue: const NumericStatusValue(0),
    healthValue: const NumericStatusValue(-3),
    maxPerishTimeValue: const DayStatusValue(18750),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      OrRequirement({
        ContainingRequirement(Crops.corn),
        const ContainingRequirement(EdibleIngredients.popperfish),
      }),
      ContainingRequirement(EdibleIngredients.honey),
      ContainingRequirement(Ingredients.twigs),
    }),
  );

  static final Recipe pumpkinCookie = Recipe(
    code: 'pumpkincookie',
    assetName: 'pumpkin_cookie',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(15),
    healthValue: const NumericStatusValue(0),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Crops.pumpkin),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.sweetener, 2.0)})),
    }),
  );

  static final Recipe ratatouille = Recipe(
    code: 'ratatouille',
    assetName: 'ratatouille',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(20),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.vegetable, 0.5)})),
      const NoRequirement(categories: {FoodValueCategory.meat, FoodValueCategory.inedible}),
    }),
  );

  static final Recipe salsaFresca = Recipe(
    code: 'salsa',
    assetName: 'salsa_fresca',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(33),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(10),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Crops.tomaRoot),
      ContainingRequirement(Crops.onion),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.inedible,
        FoodValueCategory.egg,
      }),
    }),
  );

  static const Recipe seafoodGumbo = Recipe(
    code: 'seafoodgumbo',
    assetName: 'seafood_gumbo',
    priority: 10,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(20),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(20),
  );

  static final Recipe soothingTea = Recipe(
    code: 'sweettea',
    assetName: 'soothing_tea',
    hungerValue: const NumericStatusValue(0),
    sanityValue: const DurationStatusValue(initialValue: 15, value: 30, minute: 1),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(3),
    cookTimeValue: const SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      const ContainingRequirement(Weeds.forgetMeLots as UsingInCrockPot),
      ContainingRequirement(EdibleIngredients.honey),
      const ContainingRequirement(EdibleIngredients.ice),
      const NoRequirement(categories: {
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

  static const Recipe spicyChili = Recipe(
    code: 'hotchili',
    assetName: 'spicy_chili',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({}),
  );

  static final Recipe steamedTwigs = Recipe(
    code: 'beefalofeed',
    assetName: 'steamed_twigs',
    hungerValue: const NotApplicableStatusValue(),
    sanityValue: const NotApplicableStatusValue(),
    healthValue: const NotApplicableStatusValue(),
    maxPerishTimeValue: const DayStatusValue(10),
    cookTimeValue: const SecStatusValue(10),
    priority: -5,
    requirements: Requirements({
      ContainingRequirement(Ingredients.twigs, 3),
      NoRequirement(
        ingredients: {Ingredients.nightmareFuel},
        categories: {
          FoodValueCategory.meat,
          FoodValueCategory.egg,
          FoodValueCategory.dairy,
        },
      ),
    }),
  );

  static const Recipe stuffedEggplant = Recipe(
    code: 'stuffedeggplant',
    assetName: 'stuffed_eggplant',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 1,
    requirements: Requirements({}),
  );

  static const Recipe stuffedFishHeads = Recipe(
    code: 'barnaclestuffedfishhead',
    assetName: 'stuffed_fish_heads',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(3),
    cookTimeValue: SecStatusValue(40),
    priority: 25,
    requirements: Requirements({}),
  );

  static const Recipe stuffedNightCap = Recipe(
    code: 'shroombait',
    assetName: 'stuffed_night_cap',
    hungerValue: NumericStatusValue(18.75),
    sanityValue: NumericStatusValue(-15),
    healthValue: NumericStatusValue(-20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 30,
    requirements: Requirements({}),
  );

  static final Recipe stuffedPepperPoppers = Recipe(
    code: 'pepperpopper',
    assetName: 'stuffed_pepper_poppers',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(-5),
    healthValue: const NumericStatusValue(30),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Crops.pepper),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.meat, 0.5)})),
      const NoRequirement(categories: {FoodValueCategory.inedible}),
      const MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
    }),
  );

  static const Recipe surfNTurf = Recipe(
    code: 'surfnturf',
    assetName: 'surf_n_turf',
    priority: 30,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(20),
  );

  static final Recipe taffy = Recipe(
    code: 'taffy',
    assetName: 'taffy',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(15),
    healthValue: const NumericStatusValue(-3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.honey, 3),
      const NoRequirement(categories: {FoodValueCategory.meat}),
    }),
  );

  static const Recipe tallScotchEggs = Recipe(
    code: 'talleggs',
    assetName: 'tall_scotch_eggs',
    hungerValue: NumericStatusValue(150),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 10,
    requirements: Requirements({}),
  );

  static final Recipe trailMix = Recipe(
    code: 'trailmix',
    assetName: 'trail_mix',
    hungerValue: const NumericStatusValue(12.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(30),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      const ContainingRequirement(EdibleIngredients.roastedBirchnut),
      OrRequirement({
        ContainingRequirement(EdibleIngredients.berries),
        ContainingRequirement(EdibleIngredients.juicyBerries),
      }),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)})),
      const NoRequirement(categories: {
        FoodValueCategory.meat,
        FoodValueCategory.egg,
        FoodValueCategory.vegetable,
        FoodValueCategory.dairy,
      }),
    }),
  );

  static final Recipe turkeyDinner = Recipe(
    code: 'turkeydinner',
    assetName: 'turkey_dinner',
    hungerValue: const NumericStatusValue(75),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(20),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(60),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.drumstick, 2),
      // Due to 2 drumstick + any meat value.
      ExcessRequirement(FoodValues({const FoodValue(FoodValueCategory.meat, 1.0)})),
      OrRequirement({
        MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.vegetable, 0.5)})),
        MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.fruit, 0.5)})),
      }),
      // TODO: When using Barnacle don't add Vegetable.
    }),
  );

  static const Recipe unagi = Recipe(
    code: 'unagi',
    assetName: 'unagi',
    hungerValue: NumericStatusValue(18.75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: 20,
    requirements: Requirements({}),
  );

  static final Recipe veggieBurger = Recipe(
    code: 'leafymeatburger',
    assetName: 'veggie_burger',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(33),
    healthValue: const NumericStatusValue(30),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(40),
    priority: 25,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.leafyMeat),
      ContainingRequirement(Crops.onion),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.vegetable, 2.0)})),
    }),
  );

  static final Recipe vegetableStinger = Recipe(
    code: 'vegstinger',
    assetName: 'vegetable_stinger',
    hungerValue: const NumericStatusValue(25),
    sanityValue: const NumericStatusValue(33),
    healthValue: const NumericStatusValue(3),
    maxPerishTimeValue: const DayStatusValue(15),
    cookTimeValue: const SecStatusValue(10),
    priority: 15,
    requirements: Requirements({
      OrRequirement({
        ContainingRequirement(Crops.asparagus),
        ContainingRequirement(Crops.tomaRoot),
      }),
      const ContainingRequirement(EdibleIngredients.ice),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.5)})),
    }),
  );

  static final Recipe waffles = Recipe(
    code: 'waffles',
    assetName: 'waffles',
    hungerValue: const NumericStatusValue(37.5),
    sanityValue: const NumericStatusValue(5),
    healthValue: const NumericStatusValue(60),
    maxPerishTimeValue: const DayStatusValue(6),
    cookTimeValue: const SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(EdibleIngredients.butter),
      ContainingRequirement(EdibleIngredients.berries),
      MeetRequirement(FoodValues({const FoodValue(FoodValueCategory.egg, 1.0)})),
    }),
  );

  static const Recipe wetGoop = Recipe(
    code: 'wetgoop',
    assetName: 'wet_goop',
    hungerValue: NumericStatusValue(0),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(5),
    priority: -2,
    requirements: Requirements({}),
  );

  static const Recipe wobsterBisque = Recipe(
    code: 'lobsterbisque',
    assetName: 'wobster_bisque',
    priority: 30,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
  );

  static const Recipe wobsterDinner = Recipe(
    code: 'lobsterdinner',
    assetName: 'wobster_dinner',
    priority: 25,
    requirements: Requirements({}),
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(50),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
  );
}
