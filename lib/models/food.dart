import 'package:dst_helper/models/item.dart';

enum FoodType {
  veggie,
  meat,
  generic,
  seeds,
  goodies,
}

/// 먹을 수 있는 모든 아이템
abstract class Food extends Item {
  const Food(super.name, super.assetName, this.type);

  final FoodType type;
}

enum OldFood {
  asparagus(
    name: 'Asparagus',
    assetName: 'asparagus',
    type: FoodType.veggie,
  ),
  cookedAsparagus(
    name: 'Cooked Asparagus',
    assetName: 'cooked_asparagus',
    type: FoodType.veggie,
  ),
  barnacles(
    name: 'Barnacles',
    assetName: 'barnacles',
    type: FoodType.veggie,
  ),
  cookedBarnacles(
    name: 'Cooked Barnacles',
    assetName: 'cooked_barnacles',
    type: FoodType.veggie,
  ),
  batiliskWing(
    name: 'Batilisk Wing',
    assetName: 'batilisk_wing',
    type: FoodType.veggie,
  ),
  cookedBatiliskWing(
    name: 'Cooked Batilisk Wing',
    assetName: 'cooked_batilisk_wing',
    type: FoodType.veggie,
  ),
  berries(
    name: 'Berries',
    assetName: 'berries',
    type: FoodType.veggie,
  ),
  roastedBerries(
    name: 'Roasted Berries',
    assetName: 'roasted_berries',
    type: FoodType.veggie,
  ),
  roastedBirchnut(
    name: 'Roasted Birchnut',
    assetName: 'roasted_birchnut',
    type: FoodType.veggie,
  ),
  butter(
    name: 'Butter',
    assetName: 'butter',
    type: FoodType.veggie,
  ),
  butterflyWings(
    name: 'Butterfly Wings',
    assetName: 'butterfly_wings',
    type: FoodType.veggie,
  ),
  cactusFlesh(
    name: 'Cactus Flesh',
    assetName: 'cactus_flesh',
    type: FoodType.veggie,
  ),
  cookedCactusFlesh(
    name: 'Cooked Cactus Flesh',
    assetName: 'cooked_cactus_flesh',
    type: FoodType.veggie,
  ),
  cactusFlower(
    name: 'Cactus Flower',
    assetName: 'cactus_flower',
    type: FoodType.veggie,
  ),
  carrot(
    name: 'Carrot',
    assetName: 'carrot',
    type: FoodType.veggie,
  ),
  roastedCarrot(
    name: 'Roasted Carrot',
    assetName: 'roasted_carrot',
    type: FoodType.veggie,
  ),
  banana(
    name: 'Banana',
    assetName: 'banana',
    type: FoodType.veggie,
  ),
  cookedBanana(
    name: 'Cooked Banana',
    assetName: 'cooked_banana',
    type: FoodType.veggie,
  ),
  corn(
    name: 'Corn',
    assetName: 'corn',
    type: FoodType.veggie,
  ),
  popcorn(
    name: 'Popcorn',
    assetName: 'popcorn',
    type: FoodType.veggie,
  ),
  deadWobster(
    name: 'Dead Wobster',
    assetName: 'dead_wobster',
    type: FoodType.veggie,
  ),
  deliciousWobster(
    name: 'Delicious Wobster',
    assetName: 'delicious_wobster',
    type: FoodType.veggie,
  ),
  deerclopsEyeball(
    name: 'Deerclops Eyeball',
    assetName: 'deerclops_eyeball',
    type: FoodType.veggie,
  ),
  dragonFruit(
    name: 'Dragon Fruit',
    assetName: 'dragon_fruit',
    type: FoodType.veggie,
  ),
  preparedDragonFruit(
    name: 'Prepared Dragon Fruit',
    assetName: 'prepared_dragon_fruit',
    type: FoodType.veggie,
  ),
  drumstick(
    name: 'Drumstick',
    assetName: 'drumstick',
    type: FoodType.veggie,
  ),
  friedDrumstick(
    name: 'Fried Drumstick',
    assetName: 'fried_drumstick',
    type: FoodType.veggie,
  ),
  durian(
    name: 'Durian',
    assetName: 'durian',
    type: FoodType.veggie,
  ),
  extraSmellyDurian(
    name: 'Extra Smelly Durian',
    assetName: 'extra_smelly_durian',
    type: FoodType.veggie,
  ),
  eel(
    name: 'Eel',
    assetName: 'eel',
    type: FoodType.veggie,
  ),
  cookedEel(
    name: 'Cooked Eel',
    assetName: 'cooked_eel',
    type: FoodType.veggie,
  ),
  electricMilk(
    name: 'Electric Milk',
    assetName: 'electric_milk',
    type: FoodType.veggie,
  ),
  egg(
    name: 'Egg',
    assetName: 'egg',
    type: FoodType.veggie,
  ),
  cookedEgg(
    name: 'Cooked Egg',
    assetName: 'cooked_egg',
    type: FoodType.veggie,
  ),
  eggplant(
    name: 'Eggplant',
    assetName: 'eggplant',
    type: FoodType.veggie,
  ),
  braisedEggplant(
    name: 'Braised Eggplant',
    assetName: 'braised_eggplant',
    type: FoodType.veggie,
  ),
  fig(
    name: 'Fig',
    assetName: 'fig',
    type: FoodType.veggie,
  ),
  cookedFig(
    name: 'Cooked Fig',
    assetName: 'cooked_fig',
    type: FoodType.veggie,
  ),
  fireNettleFronds(
    name: 'Fire Nettle Fronds',
    assetName: 'fire_nettle_fronds',
    type: FoodType.veggie,
  ),
  fish(
    name: 'Fish',
    assetName: 'fish',
    type: FoodType.veggie,
  ),
  cookedFish(
    name: 'Cooked Fish',
    assetName: 'cooked_fish',
    type: FoodType.veggie,
  ),
  fishMorsel(
    name: 'Fish Morsel',
    assetName: 'fish_morsel',
    type: FoodType.veggie,
  ),
  cookedFishMorsel(
    name: 'Cooked Fish Morsel',
    assetName: 'cooked_fish_morsel',
    type: FoodType.veggie,
  ),
  foliage(
    name: 'Foliage',
    assetName: 'foliage',
    type: FoodType.veggie,
  ),
  forgetMeLots(
    name: 'ForgetMeLots',
    assetName: 'forget_me_lots',
    type: FoodType.veggie,
  ),
  frogLegs(
    name: 'Frog Legs',
    assetName: 'frog_legs',
    type: FoodType.veggie,
  ),
  cookedFrogLegs(
    name: 'Cooked Frog Legs',
    assetName: 'cooked_frog_legs',
    type: FoodType.veggie,
  ),
  garlic(
    name: 'Garlic',
    assetName: 'garlic',
    type: FoodType.veggie,
  ),
  roastedGarlic(
    name: 'Roasted Garlic',
    assetName: 'roasted_garlic',
    type: FoodType.veggie,
  ),
  glowBerry(
    name: 'Glow Berry',
    assetName: 'glow_berry',
    type: FoodType.veggie,
  ),
  lesserGlowBerry(
    name: 'Lesser Glow Berry',
    assetName: 'lesser_glow_berry',
    type: FoodType.veggie,
  ),
  honey(
    name: 'Honey',
    assetName: 'honey',
    type: FoodType.veggie,
  ),
  ice(
    name: 'Ice',
    assetName: 'ice',
    type: FoodType.veggie,
  ),
  juicyBerries(
    name: 'Juicy Berries',
    assetName: 'juicy_berries',
    type: FoodType.veggie,
  ),
  roastedJuicyBerries(
    name: 'Roasted Juicy Berries',
    assetName: 'roasted_juicy_berries',
    type: FoodType.veggie,
  ),
  kelpFronds(
    name: 'Kelp Fronds',
    assetName: 'kelp_fronds',
    type: FoodType.veggie,
  ),
  cookedKelpFronds(
    name: 'Cooked Kelp Fronds',
    assetName: 'cooked_kelp_fronds',
    type: FoodType.veggie,
  ),
  driedKelpFronds(
    name: 'Dried Kelp Fronds',
    assetName: 'dried_kelp_fronds',
    type: FoodType.veggie,
  ),
  koalefantTrunk(
    name: 'Koalefant Trunk',
    assetName: 'koalefant_trunk',
    type: FoodType.veggie,
  ),
  winterKoalefantTrunk(
    name: 'Winter Koalefant Trunk',
    assetName: 'winter_koalefant_trunk',
    type: FoodType.veggie,
  ),
  koalefantTrunkSteak(
    name: 'Koalefant Trunk Steak',
    assetName: 'koalefant_trunk_steak',
    type: FoodType.veggie,
  ),
  leafyMeat(
    name: 'Leafy Meat',
    assetName: 'leafy_meat',
    type: FoodType.veggie,
  ),
  cookedLeafyMeat(
    name: 'Cooked Leafy Meat',
    assetName: 'cooked_leafy_meat',
    type: FoodType.veggie,
  ),
  lichen(
    name: 'Lichen',
    assetName: 'lichen',
    type: FoodType.veggie,
  ),
  lightBulb(
    name: 'Light Bulb',
    assetName: 'light_bulb',
    type: FoodType.veggie,
  ),
  luneTreeBlossom(
    name: 'Lune Tree Blossom',
    assetName: 'lune_tree_blossom',
    type: FoodType.veggie,
  ),
  mandrake(
    name: 'Mandrake',
    assetName: 'mandrake',
    type: FoodType.veggie,
  ),
  cookedMandrake(
    name: 'Cooked Mandrake',
    assetName: 'cooked_mandrake',
    type: FoodType.veggie,
  ),
  meat(
    name: 'Meat',
    assetName: 'meat',
    type: FoodType.veggie,
  ),
  cookedMeat(
    name: 'Cooked Meat',
    assetName: 'cooked_meat',
    type: FoodType.veggie,
  ),
  jerky(
    name: 'Jerky',
    assetName: 'Jerky',
    type: FoodType.veggie,
  ),
  milkyWhites(
    name: 'Milky Whites',
    assetName: 'milky_whites',
    type: FoodType.veggie,
  ),
  monsterMeat(
    name: 'Monster Meat',
    assetName: 'monster_meat',
    type: FoodType.veggie,
  ),
  cookedMonsterMeat(
    name: 'Cooked Monster Meat',
    assetName: 'cooked_monster_meat',
    type: FoodType.veggie,
  ),
  monsterJerky(
    name: 'Monster Jerky',
    assetName: 'monster_jerky',
    type: FoodType.veggie,
  ),
  moonShroom(
    name: 'Moon Shroom',
    assetName: 'moon_shroom',
    type: FoodType.veggie,
  ),
  cookedMoonShroom(
    name: 'Cooked Moon Shroom',
    assetName: 'cooked_moon_shroom',
    type: FoodType.veggie,
  ),
  moonMothWings(
    name: 'Moon Moth Wings',
    assetName: 'moon_moth_wings',
    type: FoodType.veggie,
  ),
  morsel(
    name: 'Morsel',
    assetName: 'morsel',
    type: FoodType.veggie,
  ),
  cookedMorsel(
    name: 'Cooked Morsel',
    assetName: 'cooked_morsel',
    type: FoodType.veggie,
  ),
  smallJerky(
    name: 'Small Jerky',
    assetName: 'small_jerky',
    type: FoodType.veggie,
  ),
  blueCap(
    name: 'Blue Cap',
    assetName: 'blue_cap',
    type: FoodType.veggie,
  ),
  cookedBlueCap(
    name: 'Cooked Blue Cap',
    assetName: 'cooked_blue_cap',
    type: FoodType.veggie,
  ),
  greenCap(
    name: 'Green Cap',
    assetName: 'green_cap',
    type: FoodType.veggie,
  ),
  cookedGreenCap(
    name: 'Cooked Green Cap',
    assetName: 'cooked_green_cap',
    type: FoodType.veggie,
  ),
  redCap(
    name: 'Red Cap',
    assetName: 'red_cap',
    type: FoodType.veggie,
  ),
  cookedRedCap(
    name: 'Cooked Red Cap',
    assetName: 'cooked_red_cap',
    type: FoodType.veggie,
  ),
  nakedNostrils(
    name: 'Naked Nostrils',
    assetName: 'naked_nostrils',
    type: FoodType.veggie,
  ),
  charredNostrils(
    name: 'Charred Nostrils',
    assetName: 'charred_nostrils',
    type: FoodType.veggie,
  ),
  onion(
    name: 'Onion',
    assetName: 'onion',
    type: FoodType.veggie,
  ),
  roastedOnion(
    name: 'Roasted Onion',
    assetName: 'roasted_onion',
    type: FoodType.veggie,
  ),
  pepper(
    name: 'Pepper',
    assetName: 'pepper',
    type: FoodType.veggie,
  ),
  roastedPepper(
    name: 'Roasted Pepper',
    assetName: 'roasted_pepper',
    type: FoodType.veggie,
  ),
  petals(
    name: 'Petals',
    assetName: 'petals',
    type: FoodType.veggie,
  ),
  darkPetals(
    name: 'Dark Petals',
    assetName: 'dark_petals',
    type: FoodType.veggie,
  ),
  phlegm(
    name: 'Phlegm',
    assetName: 'phlegm',
    type: FoodType.veggie,
  ),
  pomegranate(
    name: 'Pomegranate',
    assetName: 'pomegranate',
    type: FoodType.veggie,
  ),
  slicedPomegranate(
    name: 'Sliced Pomegranate',
    assetName: 'sliced_pomegranate',
    type: FoodType.veggie,
  ),
  potato(
    name: 'Potato',
    assetName: 'potato',
    type: FoodType.veggie,
  ),
  roastedPotato(
    name: 'Roasted Potato',
    assetName: 'roasted_potato',
    type: FoodType.veggie,
  ),
  pumpkin(
    name: 'Pumpkin',
    assetName: 'pumpkin',
    type: FoodType.veggie,
  ),
  hotPumpkin(
    name: 'Hot Pumpkin',
    assetName: 'hot_pumpkin',
    type: FoodType.veggie,
  ),
  rawFish(
    name: 'Raw Fish',
    assetName: 'raw_fish',
    type: FoodType.veggie,
  ),
  fishSteak(
    name: 'Fish Steak',
    assetName: 'fish_steak',
    type: FoodType.veggie,
  ),
  rot(
    name: 'Rot',
    assetName: 'rot',
    type: FoodType.veggie,
  ),
  rottenEgg(
    name: 'Rotten Egg',
    assetName: 'rotten_egg',
    type: FoodType.veggie,
  ),
  royalJelly(
    name: 'Royal Jelly',
    assetName: 'royal_jelly',
    type: FoodType.veggie,
  ),
  seeds(
    name: 'Seeds',
    assetName: 'seeds',
    type: FoodType.veggie,
  ),
  toastedSeeds(
    name: 'Toasted Seeds',
    assetName: 'toasted_seeds',
    type: FoodType.veggie,
  ),
  cropSeeds(
    name: 'Crop Seeds',
    assetName: 'crop_seeds',
    type: FoodType.veggie,
  ),
  ripeStoneFruit(
    name: 'Ripe Stone Fruit',
    assetName: 'ripe_stone_fruit',
    type: FoodType.veggie,
  ),
  cookedStoneFruit(
    name: 'Cooked Stone Fruit',
    assetName: 'cooked_stone_fruit',
    type: FoodType.veggie,
  ),
  succulent(
    name: 'Succulent',
    assetName: 'succulent',
    type: FoodType.veggie,
  ),
  tallbirdEgg(
    name: 'Tallbird Egg',
    assetName: 'tallbird_egg',
    type: FoodType.veggie,
  ),
  hatchingTallbirdEgg(
    name: 'Hatching Tallbird Egg',
    assetName: 'hatching_tallbird_egg',
    type: FoodType.veggie,
  ),
  friedTallbirdEgg(
    name: 'Fried Tallbird Egg',
    assetName: 'fried_tallbird_egg',
    type: FoodType.veggie,
  ),
  tillweeds(
    name: 'Tillweeds',
    assetName: 'tillweeds',
    type: FoodType.veggie,
  ),
  tomaRoot(
    name: 'Toma Root',
    assetName: 'toma_root',
    type: FoodType.veggie,
  ),
  roastedTomaRoot(
    name: 'Roasted Toma Root',
    assetName: 'roasted_toma_root',
    type: FoodType.veggie,
  ),
  watermelon(
    name: 'Watermelon',
    assetName: 'watermelon',
    type: FoodType.veggie,
  ),
  grilledWatermelon(
    name: 'Grilled Watermelon',
    assetName: 'grilled_watermelon',
    type: FoodType.veggie,
  ),
  stuffedNightCap(
    name: 'Stuffed Night Cap',
    assetName: 'stuffed_night_cap',
    type: FoodType.veggie,
  );

// Glommer's Goop
// minotaurhorn: Guardian's Horn

  const OldFood({
    required this.name,
    required this.assetName,
    required this.type,
  });

  @override
  final String name;
  @override
  final String assetName;
  final FoodType type;
}
