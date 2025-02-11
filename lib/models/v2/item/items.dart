import '../../v1/season.dart';
import '../status_value.dart';
import 'item.dart';
import 'requirement.dart';

extension Items on Item {
  static const Food toastedSeeds = Food(
    code: 'seeds_cooked',
    assetName: 'toasted_seeds',
    type: FoodType.seeds,
  );

  //
  // *** Crops ***
  //

  static const List<Crop> crops = [
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

  static const Crop potato = Crop(
    code: 'potato',
    assetName: 'potato',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Items.potatoSeed,
  );

  static const Crop carrot = Crop(
    code: 'carrot',
    assetName: 'carrot',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.spring, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Items.carrotSeed,
  );

  static const Crop corn = Crop(
    code: 'corn',
    assetName: 'corn',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Items.cornSeed,
  );

  static const Crop tomaRoot = Crop(
    code: 'tomato',
    assetName: 'toma_root',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Items.tomaRootSeed,
  );

  static const Crop asparagus = Crop(
    code: 'asparagus',
    assetName: 'asparagus',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: -4, growthFormula: 2, manure: 2),
    seasons: {Season.spring, Season.winter},
    type: FoodType.veggie,
    seed: Items.asparagusSeed,
  );

  static const Crop watermelon = Crop(
    code: 'watermelon',
    assetName: 'watermelon',
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 1.0)]),
    nutrient: Nutrient(compost: -2, growthFormula: 4, manure: -2),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Items.watermelonSeed,
  );

  static const Crop pumpkin = Crop(
    code: 'pumpkin',
    assetName: 'pumpkin',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 2, growthFormula: -4, manure: 2),
    seasons: {Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Items.pumpkinSeed,
  );

  static const Crop eggplant = Crop(
    code: 'eggplant',
    assetName: 'eggplant',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 2, growthFormula: 2, manure: -4),
    seasons: {Season.spring, Season.autumn},
    type: FoodType.veggie,
    seed: Items.eggplantSeed,
  );

  static const Crop garlic = Crop(
    code: 'garlic',
    assetName: 'garlic',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: -8, growthFormula: 4, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn, Season.winter},
    type: FoodType.veggie,
    seed: Items.garlicSeed,
  );

  static const Crop onion = Crop(
    code: 'onion',
    assetName: 'onion',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Items.onionSeed,
  );

  static const Crop pepper = Crop(
    code: 'pepper',
    assetName: 'pepper',
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
    nutrient: Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.summer, Season.autumn},
    type: FoodType.veggie,
    seed: Items.pepperSeed,
  );

  static const Crop pomegranate = Crop(
    code: 'pomegranate',
    assetName: 'pomegranate',
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 1.0)]),
    nutrient: Nutrient(compost: 4, growthFormula: -8, manure: 4),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Items.pomegranateSeed,
  );

  static const Crop dragonFruit = Crop(
    code: 'dragonfruit',
    assetName: 'dragon_fruit',
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 1.0)]),
    nutrient: Nutrient(compost: 4, growthFormula: 4, manure: -8),
    seasons: {Season.spring, Season.summer},
    type: FoodType.veggie,
    seed: Items.dragonFruitSeed,
  );

  static const Crop durian = Crop(
    code: 'durian',
    assetName: 'durian',
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
      FoodValue(FoodValueCategory.monster, 1.0),
    ]),
    nutrient: Nutrient(compost: -8, growthFormula: 4, manure: 4),
    seasons: {Season.spring},
    type: FoodType.veggie,
    seed: Items.durianSeed,
  );

  //
  // *** Weeds ***
  //

  static const Plant forgetMeLots = Plant.forgetMeLots(
    code: 'forgetmelots',
    assetName: 'forget_me_lots',
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
    seasons: {},
    foodValues: null,
    type: FoodType.veggie,
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

  //
  // *** Seeds ***
  //

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

  static const Seed cropSeeds = Seed(
    code: '',
    assetName: 'crops_seeds',
    type: FoodType.seeds,
    compositeAssetName: null,
  );

  //
  // *** Edible Ingredients ***
  //

  static const List<Item> ingredients = [
    barnacles,
    batiliskWing,
    berries,
    roastedBirchnut,
    butter,
    butterflyWings,
    cactusFlesh,
    cactusFlower,
    banana,
    popcorn,
    deadWobster,
    deliciousWobster,
    deerclopsEyeball,
    preparedDragonFruit,
    drumstick,
    extraSmellyDurian,
    eel,
    electricMilk,
    egg,
    braisedEggplant,
    fig,
    fish,
    fishMorsel,
    foliage,
    frogLegs,
    glowBerry,
    lesserGlowBerry,
    honey,
    ice,
    juicyBerries,
    kelpFronds,
    driedKelpFronds,
    koalefantTrunk,
    winterKoalefantTrunk,
    leafyMeat,
    lichen,
    lightBulb,
    luneTreeBlossom,
    mandrake,
    meat,
    milkyWhites,
    monsterMeat,
    moonShroom,
    moonMothWings,
    morsel,
    smallJerky,
    blueCap,
    greenCap,
    redCap,
    nakedNostrils,
    charredNostrils,
    petals,
    darkPetals,
    phlegm,
    slicedPomegranate,
    hotPumpkin,
    rawFish,
    fishSteak,
    royalJelly,
    toastedSeeds,
    ripeStoneFruit,
    succulent,
    tallbirdEgg,
    grilledWatermelon,
    popperfish,
    twigs,
    nightmareFuel,
    collectedDust,
    birchnut,
    moleworm,
    wobster,
  ];

  static const EdibleIngredient barnacles = EdibleIngredient(
    code: 'barnacle',
    assetName: 'barnacles',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.25),
      FoodValue(FoodValueCategory.fish, 0.25),
    ]),
  );

  static const EdibleIngredient batiliskWing = EdibleIngredient(
    code: 'batwing',
    assetName: 'batilisk_wing',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient berries = EdibleIngredient(
    code: 'berries',
    assetName: 'berries',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)]),
  );

  static const EdibleIngredient roastedBirchnut = EdibleIngredient(
    code: 'acorn_cooked',
    assetName: 'roasted_birchnut',
    type: FoodType.veggie,
    foodValues: null, // Roasted Birchnut value x 1.0, but skipped.
  );

  static const EdibleIngredient butter = EdibleIngredient(
    code: 'butter',
    assetName: 'butter',
    type: FoodType.generic,
    foodValues: FoodValues([FoodValue(FoodValueCategory.dairy, 1.0)]),
  );

  static const EdibleIngredient butterflyWings = EdibleIngredient(
    code: 'butterflywings',
    assetName: 'butterfly_wings',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient cactusFlesh = EdibleIngredient(
    code: 'cactus_meat',
    assetName: 'cactus_flesh',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 1.0),
    ]),
  );

  static const EdibleIngredient cactusFlower = EdibleIngredient(
    code: 'cactus_flower',
    assetName: 'cactus_flower',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 0.5),
    ]),
  );

  static const EdibleIngredient banana = EdibleIngredient(
    code: 'cave_banana',
    assetName: 'cave_banana',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
    ]),
  );

  static const EdibleIngredient popcorn = EdibleIngredient(
    code: 'corn_cooked',
    assetName: 'popcorn',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 1.0),
    ]),
  );

  static const EdibleIngredient deadWobster = EdibleIngredient(
    code: 'wobster_sheller_dead',
    assetName: 'dead_wobster',
    type: FoodType.meat, // Not be sure
    foodValues: null,
  );

  static const EdibleIngredient deliciousWobster = EdibleIngredient(
    code: 'wobster_sheller_dead_cooked',
    assetName: 'cooked_wobster',
    type: FoodType.meat, // Not be sure
    foodValues: null,
  );

  static const EdibleIngredient deerclopsEyeball = EdibleIngredient(
    code: 'deerclops_eyeball',
    assetName: 'deerclops_eyeball',
    type: FoodType.meat,
    foodValues: null,
  );

  static const EdibleIngredient preparedDragonFruit = EdibleIngredient(
    code: 'dragonfruit_cooked',
    assetName: 'prepared_dragon_fruit',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
    ]),
  );

  static const EdibleIngredient drumstick = EdibleIngredient(
    code: 'drumstick',
    assetName: 'drumstick',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient extraSmellyDurian = EdibleIngredient(
    code: 'durian_cooked',
    assetName: 'extra_smelly_durian',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
      FoodValue(FoodValueCategory.monster, 1.0),
    ]),
  );

  static const EdibleIngredient eel = EdibleIngredient(
    code: 'eel',
    assetName: 'eel',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.5),
      FoodValue(FoodValueCategory.fish, 1.0),
    ]),
  );

  static const EdibleIngredient electricMilk = EdibleIngredient(
    code: 'goatmilk',
    assetName: 'electric_milk',
    type: FoodType.generic,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.dairy, 1.0),
    ]),
  );

  static const EdibleIngredient egg = EdibleIngredient(
    code: 'bird_egg',
    assetName: 'egg',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.egg, 1.0),
    ]),
  );

  static const EdibleIngredient braisedEggplant = EdibleIngredient(
    code: 'eggplant_cooked',
    assetName: 'braised_eggplant',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 1.0),
    ]),
  );

  static const EdibleIngredient fig = EdibleIngredient(
    code: 'fig',
    assetName: 'fig',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)]),
  );

  static const EdibleIngredient fish = EdibleIngredient(
    code: 'fish',
    assetName: 'fish',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.5),
      FoodValue(FoodValueCategory.fish, 1.0),
    ]),
  );

  static const EdibleIngredient fishMorsel = EdibleIngredient(
    code: 'fishmeat_small',
    assetName: 'fish_morsel',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fish, 0.5),
    ]),
  );

  static const EdibleIngredient foliage = EdibleIngredient(
    code: 'foliage',
    assetName: 'foliage',
    type: FoodType.veggie,
    foodValues: null,
    // foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]), // For DLC Hamlet Only
  );

  static const EdibleIngredient frogLegs = EdibleIngredient(
    code: 'froglegs',
    assetName: 'frog_legs',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient glowBerry = EdibleIngredient(
    code: 'wormlight',
    assetName: 'glow_berry',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
    ]),
  );

  static const EdibleIngredient lesserGlowBerry = EdibleIngredient(
    code: 'wormlight_lesser',
    assetName: 'lesser_glow_berry',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 0.5),
    ]),
  );

  static const EdibleIngredient honey = EdibleIngredient(
    code: 'honey',
    assetName: 'honey',
    type: FoodType.generic,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.sweetener, 1.0),
    ]),
  );

  static const EdibleIngredient ice = EdibleIngredient(
    code: 'ice',
    assetName: 'ice',
    type: FoodType.generic,
    foodValues: null,
  );

  static const EdibleIngredient juicyBerries = EdibleIngredient(
    code: 'berries_juicy',
    assetName: 'juicy_berries',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)]),
  );

  static const EdibleIngredient kelpFronds = EdibleIngredient(
    code: 'kelp',
    assetName: 'kelp_fronds',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)]),
  );

  static const EdibleIngredient driedKelpFronds = EdibleIngredient(
    code: 'kelp_dried',
    assetName: 'dried_kelp_fronds',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 0.5),
    ]),
  );

  static const EdibleIngredient koalefantTrunk = EdibleIngredient(
    code: 'trunk_summer',
    assetName: 'koalefant_trunk',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 1.0)]),
  );

  static const EdibleIngredient winterKoalefantTrunk = EdibleIngredient(
    code: 'trunk_summer',
    assetName: 'winter_koalefant_trunk',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 1.0)]),
  );

  static const EdibleIngredient leafyMeat = EdibleIngredient(
    code: 'plantmeat',
    assetName: 'leafy_meat',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 1.0)]),
  );

  static const EdibleIngredient lichen = EdibleIngredient(
    code: 'cutlichen',
    assetName: 'lichen',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
  );

  static const EdibleIngredient lightBulb = EdibleIngredient(
    code: 'lightbulb',
    assetName: 'light_bulb',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient luneTreeBlossom = EdibleIngredient(
    code: 'moon_tree_blossom',
    assetName: 'lune_tree_blossom',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient mandrake = EdibleIngredient(
    code: 'mandrake',
    assetName: 'mandrake',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
  );

  static const EdibleIngredient meat = EdibleIngredient(
    code: 'meat',
    assetName: 'meat',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 1.0)]),
  );

  static const EdibleIngredient milkyWhites = EdibleIngredient(
    code: 'milkywhites',
    assetName: 'milky_whites',
    type: FoodType.generic,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.dairy, 1.0),
    ]),
  );

  static const EdibleIngredient monsterMeat = EdibleIngredient(
    code: 'monstermeat',
    assetName: 'monster_meat',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 1.0),
      FoodValue(FoodValueCategory.monster, 1.0),
    ]),
  );

  static const EdibleIngredient moonShroom = EdibleIngredient(
    code: 'moon_cap',
    assetName: 'moon_shroom',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)]),
  );

  static const EdibleIngredient moonMothWings = EdibleIngredient(
    code: 'moonbutterflywings',
    assetName: 'moon_moth_wings',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient morsel = EdibleIngredient(
    code: 'smallmeat',
    assetName: 'morsel',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient smallJerky = EdibleIngredient(
    code: 'smallmeat_dried',
    assetName: 'small_jerky',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient blueCap = EdibleIngredient(
    code: 'blue_cap',
    assetName: 'blue_cap',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)]),
  );

  static const EdibleIngredient greenCap = EdibleIngredient(
    code: 'green_cap',
    assetName: 'green_cap',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)]),
  );

  static const EdibleIngredient redCap = EdibleIngredient(
    code: 'red_cap',
    assetName: 'red_cap',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)]),
  );

  static const EdibleIngredient nakedNostrils = EdibleIngredient(
    code: 'batnose',
    assetName: 'naked_nostrils',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.meat, 0.5)]),
  );

  static const EdibleIngredient charredNostrils = EdibleIngredient(
    code: 'batnose_cooked',
    assetName: 'charred_nostrils',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.5),
    ]),
  );

  static const EdibleIngredient petals = EdibleIngredient(
    code: 'petals',
    assetName: 'petals',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient darkPetals = EdibleIngredient(
    code: 'petals_evil',
    assetName: 'dark_petals',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient phlegm = EdibleIngredient(
    code: 'phlegm',
    assetName: 'phlegm',
    type: FoodType.generic,
    foodValues: null,
  );

  static const EdibleIngredient slicedPomegranate = EdibleIngredient(
    code: 'pomegranate_cooked',
    assetName: 'sliced_pomegranate',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
    ]),
  );

  static const EdibleIngredient hotPumpkin = EdibleIngredient(
    code: 'pumpkin_cooked',
    assetName: 'hot_pumpkin',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 1.0),
    ]),
  );

  static const EdibleIngredient rawFish = EdibleIngredient(
    code: 'fish_raw',
    assetName: 'raw_fish',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.5),
      FoodValue(FoodValueCategory.fish, 1.0),
    ]),
  );

  static const EdibleIngredient fishSteak = EdibleIngredient(
    code: 'fish_med_cooked',
    assetName: 'fish_steak',
    type: FoodType.meat,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 0.5),
      FoodValue(FoodValueCategory.fish, 1.0),
    ]),
  );

  static const EdibleIngredient royalJelly = EdibleIngredient(
    code: 'royal_jelly',
    assetName: 'royal_jelly',
    type: FoodType.generic,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.sweetener, 3.0),
    ]),
  );

  static const EdibleIngredient ripeStoneFruit = EdibleIngredient(
    code: 'rock_avocado_fruit',
    assetName: 'ripe_stone_fruit',
    type: FoodType.veggie,
    foodValues: FoodValues([FoodValue(FoodValueCategory.vegetable, 1.0)]),
  );

  static const EdibleIngredient succulent = EdibleIngredient(
    code: 'succulent_picked',
    assetName: 'succulent',
    type: FoodType.veggie,
    foodValues: null,
  );

  static const EdibleIngredient tallbirdEgg = EdibleIngredient(
    code: 'tallbirdegg',
    assetName: 'tallbird_egg',
    type: FoodType.meat,
    foodValues: FoodValues([FoodValue(FoodValueCategory.egg, 4.0)]),
  );

  static const EdibleIngredient grilledWatermelon = EdibleIngredient(
    code: 'watermelon_cooked',
    assetName: 'grilled_watermelon',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.fruit, 1.0),
    ]),
  );

  static const EdibleIngredient popperfish = EdibleIngredient(
    code: 'oceanfish_small_5',
    assetName: 'popperfish_land',
    type: FoodType.veggie,
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.vegetable, 1.0),
    ]),
  );

  //
  // *** Ingredients ***
  //

  static const Ingredient twigs = Ingredient(
    code: 'twigs',
    assetName: 'twigs',
    foodValues: FoodValues([FoodValue(FoodValueCategory.inedible, 1.0)]),
  );

  static const Ingredient nightmareFuel = Ingredient(
    code: 'nightmarefuel',
    assetName: 'nightmare_fuel',
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.inedible, 1.0),
    ]),
  );

  static const Ingredient collectedDust = Ingredient(
    code: 'refined_dust',
    assetName: 'collected_dust',
    foodValues: null, // decoration value
  );

  static const Ingredient birchnut = Ingredient(
    code: 'acorn',
    assetName: 'birchnut',
    foodValues: null,
  );

  static const Ingredient moleworm = Ingredient(
    code: 'mole',
    assetName: 'moleworm',
    foodValues: null,
  );

  static const Ingredient wobster = Ingredient(
    code: 'wobster_sheller_land',
    assetName: 'wobster',
    foodValues: FoodValues([
      FoodValue(FoodValueCategory.meat, 1.0),
      FoodValue(FoodValueCategory.fish, 1.0),
    ]),
  );

  //
  // *** Fertilizers ***
  //

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
    nutrient: Nutrient(compost: 0, growthFormula: 16, manure: 0),
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

  //
  // *** Recipes ***
  //

  static const List<Recipe> recipes = [
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
      ContainingRequirement(Items.collectedDust),
    }),
  );

  static const Recipe asparagusSoup = Recipe(
    code: 'asparagussoup',
    assetName: 'asparagus_soup',
    priority: 10,
    hungerValue: NumericStatusValue(18.75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Items.asparagus),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 1.5 + 1.0), // Due to Asparagus(1.0 value)
      ])),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.inedible,
      ]),
    }),
  );

  static const Recipe baconAndEggs = Recipe(
    code: 'baconeggs',
    assetName: 'bacon_and_eggs',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(20),
    cookTimeValue: SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ExcessRequirement(FoodValues([
        FoodValue(FoodValueCategory.meat, 1.0),
        FoodValue(FoodValueCategory.egg, 1.0),
      ])),
      NoRequirement(categories: [FoodValueCategory.vegetable]),
    }),
  );

  static const Recipe bananaPop = Recipe(
    code: 'bananapop',
    assetName: 'banana_pop',
    priority: 20,
    hungerValue: NumericStatusValue(12.5),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(3),
    cookTimeValue: SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Items.banana),
      ContainingRequirement(Items.ice),
      ContainingRequirement(Items.twigs),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.fish,
      ]),
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
      ContainingRequirement(Items.banana, 2),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.fish,
        FoodValueCategory.monster,
      ]),
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
    requirements: Requirements({
      ContainingRequirement(Items.barnacles, 2),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 2),
      ])),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.barnacles),
      ContainingRequirement(Items.kelpFronds),
      AtLeastRequirement({FoodValueCategory.egg}),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.barnacles),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 0.5),
      ])),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.birchnut),
      ContainingRequirement(Items.twigs),
      ContainingRequirement(Items.forgetMeLots as UsingInCrockPot),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.leafyMeat),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 3.0),
      ])),
    }),
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
    requirements: Requirements({
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.egg, 1.0),
        FoodValue(FoodValueCategory.vegetable, 1.0),
      ])),
      NoRequirement(
        categories: [
          FoodValueCategory.meat,
          FoodValueCategory.egg,
        ],
      ),
    }),
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
      ContainingRequirement(Items.ice, 2),
      NoRequirement(categories: [FoodValueCategory.inedible]),
      MaxRequirement(FoodValue(FoodValueCategory.meat, 0.75)),
    }),
  );

  static const Recipe butterMuffin = Recipe(
    code: 'butterflymuffin',
    assetName: 'butter_muffin',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 1,
    requirements: Requirements({
      OrRequirement({
        ContainingRequirement(Items.butterflyWings),
        ContainingRequirement(Items.moonMothWings),
      }),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 0.5),
      ])),
      NoRequirement(categories: [FoodValueCategory.meat]),
    }),
  );

  static const Recipe californiaRoll = Recipe(
    code: 'californiaroll',
    assetName: 'california_roll',
    priority: 20,
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Items.kelpFronds, 2),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.fish, 1.0),
      ])),
    }),
  );

  static const Recipe ceviche = Recipe(
    code: 'ceviche',
    assetName: 'ceviche',
    priority: 20,
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Items.ice),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.fish, 2.0),
      ])),
      NoRequirement(
        categories: [
          FoodValueCategory.egg,
          FoodValueCategory.inedible,
        ],
      ),
    }),
  );

  static const Recipe creamyPotatoPuree = Recipe(
    code: 'mashedpotatoes',
    assetName: 'mashedpotatoes',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Items.potato, 2),
      ContainingRequirement(Items.garlic),
      NoRequirement(categories: [FoodValueCategory.meat, FoodValueCategory.inedible]),
    }),
  );

  static const Recipe dragonpie = Recipe(
    code: 'dragonpie',
    assetName: 'dragonpie',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(Items.dragonFruit),
      NoRequirement(categories: [FoodValueCategory.meat]),
    }),
  );

  static const Recipe fancySpiralledTubers = Recipe(
    code: 'potatotornado',
    assetName: 'fancy_spiralled_tubers',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(15),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.potato),
      ContainingRequirement(Items.twigs),
      NoRequirement(categories: [FoodValueCategory.meat, FoodValueCategory.monster]),
      MaxRequirement(FoodValue(FoodValueCategory.inedible, 2.0)),
    }),
  );

  static const Recipe figatoni = Recipe(
    code: 'figatoni',
    assetName: 'figatoni',
    hungerValue: NumericStatusValue(56.25),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(40),
    priority: 30,
    requirements: Requirements({
      ContainingRequirement(Items.fig),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.vegetable, 2.0)])),
      NoRequirement(categories: [FoodValueCategory.meat]),
    }),
  );

  static const Recipe figgyFrogwich = Recipe(
    code: 'frognewton',
    assetName: 'figgy_frogwich',
    hungerValue: NumericStatusValue(18.75),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(8),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(Items.fig),
      ContainingRequirement(Items.frogLegs),
    }),
  );

  static const Recipe figkabab = Recipe(
    code: 'figkabab',
    assetName: 'figkabab',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 30,
    requirements: Requirements({
      ContainingRequirement(Items.fig),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.meat, 1.0)])),
      ContainingRequirement(Items.twigs),
    }),
  );

  static const Recipe figStuffedTrunk = Recipe(
    code: 'koalefig_trunk',
    assetName: 'fig_stuffed_trunk',
    hungerValue: NumericStatusValue(56.25),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(40),
    priority: 40,
    requirements: Requirements({
      ContainingRequirement(Items.fig),
      OrRequirement({
        ContainingRequirement(Items.koalefantTrunk),
        ContainingRequirement(Items.winterKoalefantTrunk),
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
    requirements: Requirements({
      ContainingRequirement(Items.corn),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.fish, 0.5),
      ])),
    }),
  );

  static const Recipe fishsticks = Recipe(
    code: 'fishsticks',
    assetName: 'fishsticks',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      AtLeastRequirement({FoodValueCategory.fish}),
      ContainingRequirement(Items.twigs),
      MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)), // Fillers cannot be `Inedibles`.
    }),
  );

  static const Recipe fistFullOfJam = Recipe(
    code: 'jammypreserves',
    assetName: 'fist_full_of_jam',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)])),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.vegetable,
        FoodValueCategory.inedible,
      ]),
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
    requirements: Requirements({
      ContainingRequirement(Items.cactusFlower),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 1.5 + 0.5), // Due to Cactus Flower(0.5 value)
      ])),
      NoRequirement(
        categories: [
          FoodValueCategory.fruit,
          FoodValueCategory.meat,
          FoodValueCategory.egg,
          FoodValueCategory.sweetener,
          FoodValueCategory.inedible,
        ],
      ),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.frogLegs),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 0.5),
      ])),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.banana),
      ContainingRequirement(Items.ice),
      NoRequirement(ingredients: [Items.twigs]),
    }),
  );

  static const Recipe fruitMedley = Recipe(
    code: 'fruitmedley',
    assetName: 'fruit_medley',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(10),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.fruit, 3.0)])),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.vegetable,
      ]),
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
    requirements: Requirements({
      ContainingRequirement(Items.moleworm),
      OrRequirement({
        ContainingRequirement(Items.cactusFlesh),
        ContainingRequirement(Items.ripeStoneFruit),
      }),
      NoRequirement(categories: [FoodValueCategory.fruit]),
    }),
  );

  static const Recipe honeyHam = Recipe(
    code: 'honeyham',
    assetName: 'honey_ham',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 2,
    requirements: Requirements({
      ContainingRequirement(Items.honey),
      ExcessRequirement(FoodValues([FoodValue(FoodValueCategory.meat, 1.5)])),
      NoRequirement(categories: [FoodValueCategory.inedible]),
      MaxRequirement(FoodValue(FoodValueCategory.monster, 1.0)),
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
    requirements: Requirements({
      ContainingRequirement(Items.honey),
      AtLeastRequirement({FoodValueCategory.meat}),
      NoRequirement(categories: [FoodValueCategory.inedible]),
      MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
    }),
  );

  static const Recipe iceCream = Recipe(
    code: 'icecream',
    assetName: 'ice_cream',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(50),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: DayStatusValue(3),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.ice),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.dairy, 1.0),
        FoodValue(FoodValueCategory.sweetener, 1.0),
      ])),
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
      ContainingRequirement(Items.royalJelly),
      NoRequirement(categories: [
        FoodValueCategory.inedible,
        FoodValueCategory.monster,
      ]),
    }),
  );

  static const Recipe jellySalad = Recipe(
    code: 'leafymeatsouffle',
    assetName: 'jelly_salad',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(50),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(40),
    priority: 50,
    requirements: Requirements({
      ContainingRequirement(Items.leafyMeat, 2),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.sweetener, 2.0)])),
    }),
  );

  static const Recipe kabobs = Recipe(
    code: 'kabobs',
    assetName: 'kabobs',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 5,
    requirements: Requirements({
      AtLeastRequirement({FoodValueCategory.meat}),
      ContainingRequirement(Items.twigs),
      // Actually, `NoRequirement` should be here, but it requires 1 Twigs.
      MaxRequirement(FoodValue(FoodValueCategory.inedible, 1.0)),
      MaxRequirement(FoodValue(FoodValueCategory.monster, 1.0)),
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
    requirements: Requirements({
      ContainingRequirement(Items.mandrake),
    }),
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
      NoRequirement(categories: [FoodValueCategory.inedible])
    }),
  );

  static const Recipe meatyStew = Recipe(
    code: 'bonestew',
    assetName: 'meaty_stew',
    hungerValue: NumericStatusValue(150),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(12),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(15),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.meat, 3.0)])),
      NoRequirement(
        categories: [FoodValueCategory.inedible],
        ingredients: [Items.tallbirdEgg, Items.mandrake],
      ),
    }),
  );

  static const Recipe melonsicle = Recipe(
    code: 'watermelonicle',
    assetName: 'melonsicle',
    hungerValue: NumericStatusValue(12.5),
    sanityValue: NumericStatusValue(20),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(3),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.watermelon),
      ContainingRequirement(Items.ice),
      ContainingRequirement(Items.twigs),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.egg,
        FoodValueCategory.vegetable,
      ]),
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
    requirements: Requirements({
      ContainingRequirement(Items.nakedNostrils),
      ContainingRequirement(Items.kelpFronds),
      AtLeastRequirement({FoodValueCategory.dairy}),
    }),
  );

  static const Recipe monsterLasagna = Recipe(
    code: 'monsterlasagna',
    assetName: 'monster_lasagna',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(-20),
    healthValue: NumericStatusValue(-20),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.monster, 2.0)])),
      NoRequirement(categories: [FoodValueCategory.inedible]),
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
    requirements: Requirements({
      ContainingRequirement(Items.moonShroom),
      ContainingRequirement(Items.redCap),
      ContainingRequirement(Items.blueCap),
      ContainingRequirement(Items.greenCap),
    }),
  );

  static const Recipe leafyMeatloaf = Recipe(
    code: 'leafloaf',
    assetName: 'leafy_meatloaf',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(8),
    maxPerishTimeValue: DayStatusValue(20),
    cookTimeValue: SecStatusValue(40),
    priority: 25,
    requirements: Requirements({
      ContainingRequirement(Items.leafyMeat, 2),
    }),
  );

  static const Recipe pierogi = Recipe(
    code: 'perogies',
    assetName: 'pierogi',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(20),
    cookTimeValue: SecStatusValue(20),
    priority: 5,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.egg, 1.0)])),
      AtLeastRequirement({FoodValueCategory.meat, FoodValueCategory.vegetable}),
      NoRequirement(categories: [FoodValueCategory.inedible]),
    }),
  );

  static const Recipe plainOmelette = Recipe(
    code: 'justeggs',
    assetName: 'plain_omelette',
    hungerValue: NumericStatusValue(50),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(20),
    cookTimeValue: SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.egg, 3.0)])),
    }),
  );

  static const Recipe powdercake = Recipe(
    code: 'powcake',
    assetName: 'powdercake',
    hungerValue: NumericStatusValue(0),
    sanityValue: NumericStatusValue(0),
    healthValue: NumericStatusValue(-3),
    maxPerishTimeValue: DayStatusValue(18750),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      OrRequirement({
        ContainingRequirement(Items.corn),
        ContainingRequirement(Items.popperfish),
      }),
      ContainingRequirement(Items.honey),
      ContainingRequirement(Items.twigs),
    }),
  );

  static const Recipe pumpkinCookie = Recipe(
    code: 'pumpkincookie',
    assetName: 'pumpkin_cookie',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(0),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.pumpkin),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.sweetener, 2.0)])),
    }),
  );

  static const Recipe ratatouille = Recipe(
    code: 'ratatouille',
    assetName: 'ratatouille',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    priority: 0,
    requirements: Requirements({
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)])),
      NoRequirement(categories: [FoodValueCategory.meat, FoodValueCategory.inedible]),
    }),
  );

  static const Recipe salsaFresca = Recipe(
    code: 'salsa',
    assetName: 'salsa_fresca',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Items.tomaRoot),
      ContainingRequirement(Items.onion),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.inedible,
        FoodValueCategory.egg,
      ]),
    }),
  );

  static const Recipe seafoodGumbo = Recipe(
    code: 'seafoodgumbo',
    assetName: 'seafood_gumbo',
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.eel),
      ExcessRequirement(
        FoodValues([FoodValue(FoodValueCategory.fish, 1.0 + 1.0)]), // Due to Eel (1.0 value)
      ),
    }),
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(20),
    healthValue: NumericStatusValue(40),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(20),
  );

  static const Recipe soothingTea = Recipe(
    code: 'sweettea',
    assetName: 'soothing_tea',
    hungerValue: NumericStatusValue(0),
    sanityValue: DurationStatusValue(initialValue: 15, value: 30, minute: 1),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(3),
    cookTimeValue: SecStatusValue(20),
    priority: 1,
    requirements: Requirements({
      ContainingRequirement(Items.forgetMeLots as UsingInCrockPot),
      ContainingRequirement(Items.honey),
      ContainingRequirement(Items.ice),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.monster,
        FoodValueCategory.fish,
        FoodValueCategory.vegetable,
        FoodValueCategory.inedible,
        FoodValueCategory.dairy,
        FoodValueCategory.egg,
      ]),
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
    requirements: Requirements({
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 1.5),
        FoodValue(FoodValueCategory.meat, 1.5),
      ])),
    }),
  );

  static const Recipe steamedTwigs = Recipe(
    code: 'beefalofeed',
    assetName: 'steamed_twigs',
    hungerValue: NotApplicableStatusValue(),
    sanityValue: NotApplicableStatusValue(),
    healthValue: NotApplicableStatusValue(),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    priority: -5,
    requirements: Requirements({
      ContainingRequirement(Items.twigs, 3),
      NoRequirement(
        ingredients: [Items.nightmareFuel],
        categories: [
          FoodValueCategory.meat,
          FoodValueCategory.egg,
          FoodValueCategory.dairy,
        ],
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
    requirements: Requirements({
      ContainingRequirement(Items.eggplant),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 0.5 + 1.0), // Due to Eggplant(1.0 value)
      ])),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.barnacles),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.fish, 1.0 + 0.25), // Due to Barnacles(0.25 value)
      ])),
    }),
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
    requirements: Requirements({
      ContainingRequirement(Items.moonShroom, 2),
      AtLeastRequirement({FoodValueCategory.monster}),
    }),
  );

  static const Recipe stuffedPepperPoppers = Recipe(
    code: 'pepperpopper',
    assetName: 'stuffed_pepper_poppers',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(-5),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 20,
    requirements: Requirements({
      ContainingRequirement(Items.pepper),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.meat, 0.5)])),
      NoRequirement(categories: [FoodValueCategory.inedible]),
      MaxRequirement(FoodValue(FoodValueCategory.meat, 1.5)),
    }),
  );

  static const Recipe surfNTurf = Recipe(
    code: 'surfnturf',
    assetName: 'surf_n_turf',
    priority: 30,
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(20),
    requirements: Requirements({
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.meat, 2.5),
        FoodValue(FoodValueCategory.fish, 1.5),
      ])),
      NoRequirement(ingredients: [Items.ice]),
    }),
  );

  static const Recipe taffy = Recipe(
    code: 'taffy',
    assetName: 'taffy',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(15),
    healthValue: NumericStatusValue(-3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(40),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.honey, 3),
      NoRequirement(categories: [FoodValueCategory.meat]),
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
    requirements: Requirements({
      ContainingRequirement(Items.tallbirdEgg),
      MeetRequirement(FoodValues([
        FoodValue(FoodValueCategory.vegetable, 1.0),
      ])),
    }),
  );

  static const Recipe trailMix = Recipe(
    code: 'trailmix',
    assetName: 'trail_mix',
    hungerValue: NumericStatusValue(12.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.roastedBirchnut),
      OrRequirement({
        ContainingRequirement(Items.berries),
        ContainingRequirement(Items.juicyBerries),
      }),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)])),
      NoRequirement(categories: [
        FoodValueCategory.meat,
        FoodValueCategory.egg,
        FoodValueCategory.vegetable,
        FoodValueCategory.dairy,
      ]),
    }),
  );

  static const Recipe turkeyDinner = Recipe(
    code: 'turkeydinner',
    assetName: 'turkey_dinner',
    hungerValue: NumericStatusValue(75),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(20),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(60),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.drumstick, 2),
      // Due to 2 drumstick + any meat value.
      ExcessRequirement(FoodValues([FoodValue(FoodValueCategory.meat, 1.0)])),
      OrRequirement({
        MeetRequirement(FoodValues([FoodValue(FoodValueCategory.vegetable, 0.5)])),
        MeetRequirement(FoodValues([FoodValue(FoodValueCategory.fruit, 0.5)])),
      }),
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
    requirements: Requirements({
      ContainingRequirement(Items.eel),
      OrRequirement({
        ContainingRequirement(Items.lichen),
        ContainingRequirement(Items.kelpFronds),
      }),
    }),
  );

  static const Recipe veggieBurger = Recipe(
    code: 'leafymeatburger',
    assetName: 'veggie_burger',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(30),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(40),
    priority: 25,
    requirements: Requirements({
      ContainingRequirement(Items.leafyMeat),
      ContainingRequirement(Items.onion),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.vegetable, 2.0)])),
    }),
  );

  static const Recipe vegetableStinger = Recipe(
    code: 'vegstinger',
    assetName: 'vegetable_stinger',
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(33),
    healthValue: NumericStatusValue(3),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(10),
    priority: 15,
    requirements: Requirements({
      OrRequirement({
        ContainingRequirement(Items.asparagus),
        ContainingRequirement(Items.tomaRoot),
      }),
      ContainingRequirement(Items.ice),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.vegetable, 1.5)])),
    }),
  );

  static const Recipe waffles = Recipe(
    code: 'waffles',
    assetName: 'waffles',
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(5),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(6),
    cookTimeValue: SecStatusValue(10),
    priority: 10,
    requirements: Requirements({
      ContainingRequirement(Items.butter),
      ContainingRequirement(Items.berries),
      MeetRequirement(FoodValues([FoodValue(FoodValueCategory.egg, 1.0)])),
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
    hungerValue: NumericStatusValue(25),
    sanityValue: NumericStatusValue(10),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(10),
    cookTimeValue: SecStatusValue(10),
    requirements: Requirements({
      ContainingRequirement(Items.wobster),
      ContainingRequirement(Items.ice),
    }),
  );

  static const Recipe wobsterDinner = Recipe(
    code: 'lobsterdinner',
    assetName: 'wobster_dinner',
    priority: 25,
    hungerValue: NumericStatusValue(37.5),
    sanityValue: NumericStatusValue(50),
    healthValue: NumericStatusValue(60),
    maxPerishTimeValue: DayStatusValue(15),
    cookTimeValue: SecStatusValue(20),
    requirements: Requirements({
      ContainingRequirement(Items.wobster),
      ContainingRequirement(Items.butter),
      NoRequirement(
        categories: [FoodValueCategory.meat],
        ingredients: [Items.ice],
      ),
    }),
  );
}
