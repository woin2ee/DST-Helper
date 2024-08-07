import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';

abstract class Recipe implements Food {
  const Recipe(this.priority);

  final int priority;

  bool canCookWith(Ingredients ingredients);
}

enum RecipeList {
  butterMuffin,
  froggleBunwich,
  taffy,
  pumpkinCookie,
  stuffedEggplant,
  fishsticks,
  honeyNuggets,
  honeyHam,
  dragonpie,
  kabobs,
  mandrakeSoup,
  baconAndEggs,
  meatballs,
  meatyStew,
  pierogi,
  turkeyDinner,
  ratatouille,
  fistFullOfJam,
  fruitMedley,
  fishTacos,
  waffles,
  monsterLasagna,
  powdercake,
  unagi,
  wetGoop,
  flowerSalad,
  iceCream,
  melonsicle,
  trailMix,
  spicyChili,
  guacamole,
  bananaPop,
  californiaRoll,
  ceviche,
  wobsterBisque,
  wobsterDinner,
  seafoodGumbo,
  surfAndTurf,
  jellybeans,
  vegetableStinger,
  asparagusSoup,
  stuffedPepperPoppers,
  creamyPotatoPuree,
  salsaFresca,
  fancySpiralledTubers,
  barnaclePita,
  barnacleNigiri,
  barnacleLinguine,
  stuffedFishHeads,
  mushyCake,
  soothingTea,
  figStuffedTrunk,
  figatoni,
  figkabab,
  figgyFrogwich,
  frozenBananaDaiquiri,
  bunnyStew,
  bananaShake,
  plainOmelette,
  breakfastSkillet,
  tallScotchEggs,
  steamedTwigs,
  beefaloTreats,
  leafyMeatloaf,
  veggieBurger,
  jellySalad,
  beefyGreens,
  milkmadeHat,
  amberosia,
  grimGalette,
  voltGoatChaudFroid,
  glowBerryMousse,
  fishCordonBleu,
  hotDragonChiliSalad,
  asparagazpacho,
  puffedPotatoSouffle,
  monsterTartare,
  freshFruitCrepes,
  boneBouillon,
  moqueca;

  // String get name {
  //   switch (this) {
  //     case Recipe.butterMuffin:
  //       return 'Butter Muffin';
  //     case Recipe.froggleBunwich:
  //       return 'Froggle Bunwich';
  //     case Recipe.taffy:
  //       return 'Taffy';
  //     case Recipe.pumpkinCookie:
  //       return 'Pumpkin Cookie';
  //     case Recipe.stuffedEggplant:
  //       return 'Stuffed Eggplant';
  //     case Recipe.fishsticks:
  //       return 'Fishsticks';
  //     case Recipe.honeyNuggets:
  //       return 'Honey Nuggets';
  //     case Recipe.honeyHam:
  //       return 'Honey Ham';
  //     case Recipe.dragonpie:
  //       return 'Dragonpie';
  //     case Recipe.kabobs:
  //       return 'Kabobs';
  //     case Recipe.mandrakeSoup:
  //       return 'Mandrake Soup';
  //     case Recipe.baconAndEggs:
  //       return 'Bacon and Eggs';
  //     case Recipe.meatballs:
  //       return 'Meatballs';
  //     case Recipe.meatyStew:
  //       return 'Meaty Stew';
  //     case Recipe.pierogi:
  //       return 'Pierogi';
  //     case Recipe.turkeyDinner:
  //       return 'Turkey Dinner';
  //     case Recipe.ratatouille:
  //       return 'Ratatouille';
  //     case Recipe.fistFullOfJam:
  //       return 'Fist Full of Jam';
  //     case Recipe.fruitMedley:
  //       return 'Fruit Medley';
  //     case Recipe.fishTacos:
  //       return 'Fish Tacos';
  //     case Recipe.waffles:
  //       return 'Waffles';
  //     case Recipe.monsterLasagna:
  //       return 'Monster Lasagna';
  //     case Recipe.powdercake:
  //       return 'Powdercake';
  //     case Recipe.unagi:
  //       return 'Unagi';
  //     case Recipe.wetGoop:
  //       return 'Wet Goop';
  //     case Recipe.flowerSalad:
  //       return 'Flower Salad';
  //     case Recipe.iceCream:
  //       return 'Ice Cream';
  //     case Recipe.melonsicle:
  //       return 'Melonsicle';
  //     case Recipe.trailMix:
  //       return 'Trail Mix';
  //     case Recipe.spicyChili:
  //       return 'Spicy Chili';
  //     case Recipe.guacamole:
  //       return 'Guacamole';
  //     case Recipe.bananaPop:
  //       return 'Banana Pop';
  //     case Recipe.californiaRoll:
  //       return 'California Roll';
  //     case Recipe.ceviche:
  //       return 'Ceviche';
  //     case Recipe.wobsterBisque:
  //       return 'Wobster Bisque';
  //     case Recipe.wobsterDinner:
  //       return 'Wobster Dinner';
  //     case Recipe.seafoodGumbo:
  //       return 'Seafood Gumbo';
  //     case Recipe.surfAndTurf:
  //       return 'Surf \'n\' Turf';
  //     case Recipe.jellybeans:
  //       return 'Jellybeans';
  //     case Recipe.vegetableStinger:
  //       return 'Vegetable Stinger';
  //     case Recipe.asparagusSoup:
  //       return 'Asparagus Soup';
  //     case Recipe.stuffedPepperPoppers:
  //       return 'Stuffed Pepper Poppers';
  //     case Recipe.creamyPotatoPuree:
  //       return 'Creamy Potato Purée';
  //     case Recipe.salsaFresca:
  //       return 'Salsa Fresca';
  //     case Recipe.fancySpiralledTubers:
  //       return 'Fancy Spiralled Tubers';
  //     case Recipe.barnaclePita:
  //       return 'Barnacle Pita';
  //     case Recipe.barnacleNigiri:
  //       return 'Barnacle Nigiri';
  //     case Recipe.barnacleLinguine:
  //       return 'Barnacle Linguine';
  //     case Recipe.stuffedFishHeads:
  //       return 'Stuffed Fish Heads';
  //     case Recipe.mushyCake:
  //       return 'Mushy Cake';
  //     case Recipe.soothingTea:
  //       return 'Soothing Tea';
  //     case Recipe.figStuffedTrunk:
  //       return 'Fig-Stuffed Trunk';
  //     case Recipe.figatoni:
  //       return 'Figatoni';
  //     case Recipe.figkabab:
  //       return 'Figkabab';
  //     case Recipe.figgyFrogwich:
  //       return 'Figgy Frogwich';
  //     case Recipe.frozenBananaDaiquiri:
  //       return 'Frozen Banana Daiquiri';
  //     case Recipe.bunnyStew:
  //       return 'Bunny Stew';
  //     case Recipe.bananaShake:
  //       return 'Banana Shake';
  //     case Recipe.plainOmelette:
  //       return 'Plain Omelette';
  //     case Recipe.breakfastSkillet:
  //       return 'Breakfast Skillet';
  //     case Recipe.tallScotchEggs:
  //       return 'Tall Scotch Eggs';
  //     case Recipe.steamedTwigs:
  //       return 'Steamed Twigs';
  //     case Recipe.beefaloTreats:
  //       return 'Beefalo Treats';
  //     case Recipe.leafyMeatloaf:
  //       return 'Leafy Meatloaf';
  //     case Recipe.veggieBurger:
  //       return 'Veggie Burger';
  //     case Recipe.jellySalad:
  //       return 'Jelly Salad';
  //     case Recipe.beefyGreens:
  //       return 'Beefy Greens';
  //     case Recipe.milkmadeHat:
  //       return 'Milkmade Hat';
  //     case Recipe.amberosia:
  //       return 'Amberosia';
  //     case Recipe.grimGalette:
  //       return 'Grim Galette';
  //     case Recipe.voltGoatChaudFroid:
  //       return 'Volt Goat Chaud Froid';
  //     case Recipe.glowBerryMousse:
  //       return 'Glow Berry Mousse';
  //     case Recipe.fishCordonBleu:
  //       return 'Fish Cordon Bleu';
  //     case Recipe.hotDragonChiliSalad:
  //       return 'Hot Dragon Chili Salad';
  //     case Recipe.asparagazpacho:
  //       return 'Asparagazpacho';
  //     case Recipe.puffedPotatoSouffle:
  //       return 'Puffed Potato Souffle';
  //     case Recipe.monsterTartare:
  //       return 'Monster Tartare';
  //     case Recipe.freshFruitCrepes:
  //       return 'Fresh Fruit Crepes';
  //     case Recipe.boneBouillon:
  //       return 'Bone Bouillon';
  //     case Recipe.moqueca:
  //       return 'Moqueca';
  //   }
  // }

  // @override
  // String get assetName {
  //   switch (this) {
  //     case Recipe.butterMuffin:
  //       return 'butter_muffin';
  //     case Recipe.froggleBunwich:
  //       return 'froggle_bunwich';
  //     case Recipe.taffy:
  //       return 'taffy';
  //     case Recipe.pumpkinCookie:
  //       return 'pumpkin_cookie';
  //     case Recipe.stuffedEggplant:
  //       return 'stuffed_eggplant';
  //     case Recipe.fishsticks:
  //       return 'fishsticks';
  //     case Recipe.honeyNuggets:
  //       return 'honey_nuggets';
  //     case Recipe.honeyHam:
  //       return 'honey_ham';
  //     case Recipe.dragonpie:
  //       return 'dragonpie';
  //     case Recipe.kabobs:
  //       return 'kabobs';
  //     case Recipe.mandrakeSoup:
  //       return 'mandrake_soup';
  //     case Recipe.baconAndEggs:
  //       return 'bacon_and_eggs';
  //     case Recipe.meatballs:
  //       return 'meatballs';
  //     case Recipe.meatyStew:
  //       return 'meaty_stew';
  //     case Recipe.pierogi:
  //       return 'pierogi';
  //     case Recipe.turkeyDinner:
  //       return 'turkey_dinner';
  //     case Recipe.ratatouille:
  //       return 'ratatouille';
  //     case Recipe.fistFullOfJam:
  //       return 'fist_full_of_jam';
  //     case Recipe.fruitMedley:
  //       return 'fruit_medley';
  //     case Recipe.fishTacos:
  //       return 'fish_tacos';
  //     case Recipe.waffles:
  //       return 'waffles';
  //     case Recipe.monsterLasagna:
  //       return 'monster_lasagna';
  //     case Recipe.powdercake:
  //       return 'powdercake';
  //     case Recipe.unagi:
  //       return 'unagi';
  //     case Recipe.wetGoop:
  //       return 'wet_goop';
  //     case Recipe.flowerSalad:
  //       return 'flower_salad';
  //     case Recipe.iceCream:
  //       return 'ice_cream';
  //     case Recipe.melonsicle:
  //       return 'melonsicle';
  //     case Recipe.trailMix:
  //       return 'trail_mix';
  //     case Recipe.spicyChili:
  //       return 'spicy_chili';
  //     case Recipe.guacamole:
  //       return 'guacamole';
  //     case Recipe.bananaPop:
  //       return 'banana_pop';
  //     case Recipe.californiaRoll:
  //       return 'california_roll';
  //     case Recipe.ceviche:
  //       return 'ceviche';
  //     case Recipe.wobsterBisque:
  //       return 'wobster_bisque';
  //     case Recipe.wobsterDinner:
  //       return 'wobster_dinner';
  //     case Recipe.seafoodGumbo:
  //       return 'seafood_gumbo';
  //     case Recipe.surfAndTurf:
  //       return 'surf_n_turf';
  //     case Recipe.jellybeans:
  //       return 'jellybeans';
  //     case Recipe.vegetableStinger:
  //       return 'vegetable_stinger';
  //     case Recipe.asparagusSoup:
  //       return 'asparagus_soup';
  //     case Recipe.stuffedPepperPoppers:
  //       return 'stuffed_pepper_poppers';
  //     case Recipe.creamyPotatoPuree:
  //       return 'mashedpotatoes';
  //     case Recipe.salsaFresca:
  //       return 'salsa_fresca';
  //     case Recipe.fancySpiralledTubers:
  //       return 'fancy_spiralled_tubers';
  //     case Recipe.barnaclePita:
  //       return 'barnacle_pita';
  //     case Recipe.barnacleNigiri:
  //       return 'barnacle_nigiri';
  //     case Recipe.barnacleLinguine:
  //       return 'barnacle_linguine';
  //     case Recipe.stuffedFishHeads:
  //       return 'stuffed_fish_heads';
  //     case Recipe.mushyCake:
  //       return 'mushy_cake';
  //     case Recipe.soothingTea:
  //       return 'soothing_tea';
  //     case Recipe.figStuffedTrunk:
  //       return 'fig_stuffed_trunk';
  //     case Recipe.figatoni:
  //       return 'figatoni';
  //     case Recipe.figkabab:
  //       return 'figkabab';
  //     case Recipe.figgyFrogwich:
  //       return 'figgy_frogwich';
  //     case Recipe.frozenBananaDaiquiri:
  //       return 'frozen_banana_daiquiri';
  //     case Recipe.bunnyStew:
  //       return 'bunny_stew';
  //     case Recipe.bananaShake:
  //       return 'banana_shake';
  //     case Recipe.plainOmelette:
  //       return 'plain_omelette';
  //     case Recipe.breakfastSkillet:
  //       return 'breakfast_skillet';
  //     case Recipe.tallScotchEggs:
  //       return 'tall_scotch_eggs';
  //     case Recipe.steamedTwigs:
  //       return 'steamed_twigs';
  //     case Recipe.beefaloTreats:
  //       return 'beefalo_treats';
  //     case Recipe.leafyMeatloaf:
  //       return 'leafy_meatloaf';
  //     case Recipe.veggieBurger:
  //       return 'veggie_burger';
  //     case Recipe.jellySalad:
  //       return 'jelly_salad';
  //     case Recipe.beefyGreens:
  //       return 'beefy_greens';
  //     case Recipe.milkmadeHat:
  //       return 'milkmade_hat';
  //     case Recipe.amberosia:
  //       return 'amberosia';
  //     case Recipe.grimGalette:
  //       return 'grim_galette';
  //     case Recipe.voltGoatChaudFroid:
  //       return 'volt_goat_chaud_froid';
  //     case Recipe.glowBerryMousse:
  //       return 'glow_berry_mousse';
  //     case Recipe.fishCordonBleu:
  //       return 'fish_cordon_bleu';
  //     case Recipe.hotDragonChiliSalad:
  //       return 'hot_dragon_chili_salad';
  //     case Recipe.asparagazpacho:
  //       return 'asparagazpacho';
  //     case Recipe.puffedPotatoSouffle:
  //       return 'puffed_potato_souffle';
  //     case Recipe.monsterTartare:
  //       return 'monster_tartare';
  //     case Recipe.freshFruitCrepes:
  //       return 'fresh_fruit_crepes';
  //     case Recipe.boneBouillon:
  //       return 'bone_bouillon';
  //     case Recipe.moqueca:
  //       return 'moqueca';
  //   }
  // }
}

// butterflymuffin_dst: {
//   name: 'Butter Muffin',
//   test: (cooker, names, tags) => {
//     return (names.butterflywings_dst || names.moonbutterflywings) && !tags.meat && tags.veggie && tags.veggie >= 0.5;
//   },
//   requires: 'Butterfly Wings, veggie',
//   requirements: [OR(NAME('butterflywings'), NAME('moonbutterflywings')), NOT(TAG('meat')), TAG('veggie', COMPARE('>=', 0.5))],
//   priority: 1,
//   weight: 1,
//   foodtype: 'veggie',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   mode: 'together'
// },
// frogglebunwich_dst: {
//   name: 'Froggle Bunwich',
//   test: (cooker, names, tags) => {
//     return (names.froglegs_dst || names.froglegs_cooked_dst) && tags.veggie && tags.veggie >= 0.5;
//   },
//   requirements: [NAME('froglegs'), TAG('veggie', COMPARE('>=', 0.5))],
//   priority: 1,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   mode: 'together'
// },
// taffy_dst: {
//   name: 'Taffy',
//   test: (cooker, names, tags) => {
//     return tags.sweetener && tags.sweetener >= 3 && !tags.meat;
//   },
//   requirements: [TAG('sweetener', COMPARE('>=', 3)), NOT(TAG('meat'))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: -healing_small,
//   hunger: calories_small * 2,
//   perish: perish_slow,
//   sanity: sanity_med,
//   cooktime: 2,
//   tags: ['honeyed'],
//   mode: 'together'
// },
// pumpkincookie_dst: {
//   name: 'Pumpkin Cookie',
//   test: (cooker, names, tags) => {
//     return (names.pumpkin_dst || names.pumpkin_cooked_dst) && tags.sweetener && tags.sweetener >= 2;
//   },
//   requirements: [NAME('pumpkin'), TAG('sweetener', COMPARE('>=', 2))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: 0,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: sanity_med,
//   cooktime: 2,
//   tags: ['honeyed'],
//   mode: 'together'
// },
// stuffedeggplant_dst: {
//   name: 'Stuffed Eggplant',
//   test: (cooker, names, tags) => {
//     return (names.eggplant_dst || names.eggplant_cooked_dst) && tags.veggie && tags.veggie > 1;
//   },
//   requirements: [NAME('eggplant'), TAG('veggie', COMPARE('>', 1))],
//   priority: 1,
//   foodtype: 'veggie',
//   health: healing_small,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_brief,
//   cooktime: 2,
//   mode: 'together'
// },
// fishsticks_dst: {
//   name: 'Fishsticks',
//   test: (cooker, names, tags) => {
//     return tags.fish && names.twigs_dst && (tags.inedible && tags.inedible <= 1);
//   },
//   requirements: [TAG('fish'), SPECIFIC('twigs_dst'), TAG('inedible'), TAG('inedible', COMPARE('<=', 1))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_large,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   mode: 'together'
// },
// honeynuggets_dst: {
//   name: 'Honey Nuggets',
//   test: (cooker, names, tags) => {
//     return names.honey_dst && tags.meat && tags.meat <= 1.5 && !tags.inedible;
//   },
//   requirements: [SPECIFIC('honey_dst'), TAG('meat', COMPARE('<=', 1.5)), NOT(TAG('inedible'))],
//   priority: 2,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   tags: ['honeyed'],
//   mode: 'together'
// },
// honeyham_dst: {
//   name: 'Honey Ham',
//   test: (cooker, names, tags) => {
//     return names.honey_dst && tags.meat && tags.meat > 1.5 && !tags.inedible;
//   },
//   requirements: [SPECIFIC('honey_dst'), TAG('meat', COMPARE('>', 1.5)), NOT(TAG('inedible'))],
//   priority: 2,
//   foodtype: 'meat',
//   health: healing_medlarge,
//   hunger: calories_huge,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 2,
//   tags: ['honeyed'],
//   mode: 'together'
// },
// dragonpie_dst: {
//   name: 'Dragonpie',
//   test: (cooker, names, tags) => {
//     return (names.dragonfruit_dst || names.dragonfruit_cooked_dst) && !tags.meat;
//   },
//   requirements: [NAME('dragonfruit'), NOT(TAG('meat'))],
//   priority: 1,
//   foodtype: 'veggie',
//   health: healing_large,
//   hunger: calories_huge,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 2,
//   mode: 'together'
// },
// kabobs_dst: {
//   name: 'Kabobs',
//   test: (cooker, names, tags) => {
//     return tags.meat && names.twigs_dst && (!tags.monster || tags.monster <= 1) && (tags.inedible && tags.inedible <= 1);
//   },
//   requirements: [TAG('meat'), SPECIFIC('twigs_dst'), OR(NOT(TAG('monster')), TAG('monster', COMPARE('<=', 1))), TAG('inedible'), TAG('inedible', COMPARE('<=', 1))],
//   priority: 5,
//   foodtype: 'meat',
//   health: healing_small,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   mode: 'together'
// },
// mandrakesoup_dst: {
//   name: 'Mandrake Soup',
//   test: (cooker, names, tags) => {
//     return names.mandrake_dst;
//   },
//   requirements: [SPECIFIC('mandrake_dst')],
//   priority: 10,
//   foodtype: 'veggie',
//   health: healing_superhuge,
//   hunger: calories_superhuge,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   cooktime: 3,
//   mode: 'together'
// },
// baconeggs_dst: {
//   name: 'Bacon and Eggs',
//   test: (cooker, names, tags) => {
//     return tags.egg && tags.egg > 1 && tags.meat && tags.meat > 1 && !tags.veggie;
//   },
//   requirements: [TAG('egg', COMPARE('>', 1)), TAG('meat', COMPARE('>', 1)), NOT(TAG('veggie'))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_huge,
//   perish: perish_preserved,
//   sanity: sanity_tiny,
//   cooktime: 2,
//   mode: 'together'
// },
// meatballs_dst: {
//   name: 'Meatballs',
//   test: (cooker, names, tags) => {
//     return tags.meat && !tags.inedible;
//   },
//   requirements: [TAG('meat'), NOT(TAG('inedible'))],
//   priority: -1,
//   foodtype: 'meat',
//   health: healing_small,
//   hunger: calories_small * 5,
//   perish: perish_med,
//   sanity: sanity_tiny,
//   cooktime: 0.75,
//   mode: 'together'
// },
// bonestew_dst: {
//   name: 'Meaty Stew',
//   test: (cooker, names, tags) => {
//     return tags.meat && tags.meat >= 3 && !tags.inedible;
//   },
//   requirements: [TAG('meat', COMPARE('>=', 3)), NOT(TAG('inedible'))],
//   priority: 0,
//   foodtype: 'meat',
//   health: healing_small * 4,
//   hunger: calories_large * 4,
//   perish: perish_med,
//   sanity: sanity_tiny,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_long,
//   cooktime: 0.75,
//   mode: 'together'
// },
// perogies_dst: {
//   name: 'Pierogi',
//   test: (cooker, names, tags) => {
//     return tags.egg && tags.meat && tags.veggie && tags.veggie >= 0.5 && !tags.inedible;
//   },
//   requirements: [TAG('egg'), TAG('meat'), TAG('veggie', COMPARE('>', 0.5)), NOT(TAG('inedible'))],
//   priority: 5,
//   foodtype: 'meat',
//   health: healing_large,
//   hunger: calories_large,
//   perish: perish_preserved,
//   sanity: sanity_tiny,
//   cooktime: 1,
//   mode: 'together'
// },
// turkeydinner_dst: {
//   name: 'Turkey Dinner',
//   test: (cooker, names, tags) => {
//     return names.drumstick_dst && names.drumstick_dst > 1 && tags.meat && tags.meat > 1 && ((tags.veggie && tags. veggie >= 0.5) || tags.fruit);
//   },
//   requirements: [SPECIFIC('drumstick_dst', COMPARE('>', 1)), TAG('meat', COMPARE('>', 1)), OR(TAG('veggie', COMPARE('>=', 0.5)), TAG('fruit'))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_huge,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 3,
//   mode: 'together'
// },
// ratatouille_dst: {
//   name: 'Ratatouille',
//   test: (cooker, names, tags) => {
//     return !tags.meat && tags.veggie && tags.veggie >= 0.5 && !tags.inedible;
//   },
//   requirements: [NOT(TAG('meat')), TAG('veggie', COMPARE('>=', 0.5)), NOT(TAG('inedible'))],
//   priority: 0,
//   foodtype: 'veggie',
//   health: healing_small,
//   hunger: calories_med,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 1,
//   mode: 'together'
// },
// jammypreserves_dst: {
//   name: 'Fist Full of Jam',
//   test: (cooker, names, tags) => {
//     return tags.fruit && !tags.meat && !tags.veggie && !tags.inedible;
//   },
//   requirements: [TAG('fruit'), NOT(TAG('meat')), NOT(TAG('veggie')), NOT(TAG('inedible'))],
//   priority: 0,
//   foodtype: 'veggie',
//   health: healing_small,
//   hunger: calories_small * 3,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   mode: 'together'
// },
// fruitmedley_dst: {
//   name: 'Fruit Medley',
//   test: (cooker, names, tags) => {
//     return tags.fruit && tags.fruit >= 3 && !tags.meat && !tags.veggie;
//   },
//   requirements: [TAG('fruit', COMPARE('>=', 3)), NOT(TAG('meat')), NOT(TAG('veggie'))],
//   priority: 0,
//   foodtype: 'veggie',
//   health: healing_med,
//   hunger: calories_med,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   temperature: cold_food_bonus_temp,
//   temperatureduration: food_temp_brief,
//   cooktime: 0.5,
//   mode: 'together'
// },



// fishtacos_dst: {
//   name: 'Fish Tacos',
//   test: (cooker, names, tags) => {
//     return tags.fish && (names.corn_dst || names.corn_cooked_dst || names.oceanfish_small_5_inv || names.oceanfish_medium_5_inv);
//   },
//   requirements: [TAG('fish'), OR(NAME('corn_dst'), OR(NAME('oceanfish_small_5_inv'), NAME('oceanfish_medium_5_inv')))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   tags: ['monstermeat'],
//   mode: 'together'
// },
// waffles_dst: {
//   name: 'Waffles',
//   test: (cooker, names, tags) => {
//     return names.butter_dst && (names.berries_dst || names.berries_cooked_dst || names.berries_juicy || names.berries_juicy_cooked) && tags.egg;
//   },
//   requirements: [SPECIFIC('butter_dst'), NAME('berries'), TAG('egg')],
//   priority: 10,
//   foodtype: 'veggie',
//   health: healing_huge,
//   hunger: calories_large,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   mode: 'together'
// },
// monsterlasagna_dst: {
//   name: 'Monster Lasagna',
//   test: (cooker, names, tags) => {
//     return tags.monster && tags.monster >= 2 && !tags.inedible;
//   },
//   requirements: [TAG('monster', COMPARE('>=', 2)), NOT(TAG('inedible'))],
//   priority: 10,
//   foodtype: 'meat',
//   health: -healing_med,
//   hunger: calories_large,
//   perish: perish_fast,
//   sanity: -sanity_medlarge,
//   cooktime: 0.5,
//   mode: 'together'
// },
// powcake_dst: {
//   name: 'Powdercake',
//   test: (cooker, names, tags) => {
//     return names.twigs_dst && names.honey_dst && (names.corn_dst || names.corn_cooked_dst || names.oceanfish_small_5_inv || names.oceanfish_medium_5_inv);
//   },
//   requirements: [SPECIFIC('twigs_dst'), SPECIFIC('honey_dst'), OR(NAME('corn'), OR(NAME('oceanfish_small_5_inv'), NAME('oceanfish_medium_5_inv')))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: -healing_small,
//   hunger: 0,
//   perish: 9000000,
//   sanity: 0,
//   cooktime: 0.5,
//   tags: ['honeyed'],
//   mode: 'together'
// },
// unagi_dst: {
//   name: 'Unagi',
//   test: (cooker, names, tags) => {
//     return (names.cutlichen_dst || names.kelp || names.kelp_cooked || names.kelp_dried) && (names.eel_dst || names.eel_cooked_dst || names.pondeel);
//   },
//   requirements: [OR(NAME('cutlichen'),NAME('kelp')), OR(NAME('eel'), NAME('pondeel'))],
//   priority: 20,
//   foodtype: 'veggie',
//   health: healing_med,
//   hunger: calories_medsmall,
//   perish: perish_med,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   mode: 'together'
// },
// wetgoop_dst: {
//   name: 'Wet Goop',
//   test: (cooker, names, tags) => {
//     return true;
//   },
//   requirements: [],
//   trash: true,
//   priority: -2,
//   health: 0,
//   hunger: 0,
//   perish: perish_fast,
//   sanity: 0,
//   cooktime: 0.25,
//   mode: 'together'
// },
// flowersalad_dst: {
//   name: 'Flower Salad',
//   test: (cooker, names, tags) => {
//     return names.cactusflower_dst && tags.veggie && tags.veggie >= 2 && !tags.meat && !tags.inedible && !tags.egg && !tags.sweetener && !tags.fruit;
//   },
//   requirements: [SPECIFIC('cactusflower_dst'), TAG('veggie', COMPARE('>=', 2)), NOT(TAG('meat')), NOT(TAG('inedible')), NOT(TAG('egg')), NOT(TAG('sweetener')), NOT(TAG('fruit'))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: healing_large,
//   hunger: calories_small,
//   perish: perish_fast,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   mode: 'together'
// },
// icecream_dst: {
//   name: 'Ice Cream',
//   test: (cooker, names, tags) => {
//     return tags.frozen && tags.dairy && tags.sweetener && !tags.meat && !tags.veggie && !tags.inedible && !tags.egg;
//   },
//   requirements: [TAG('frozen'), TAG('dairy'), TAG('sweetener'), NOT(TAG('meat')), NOT(TAG('veggie')), NOT(TAG('inedible')), NOT(TAG('egg'))],
//   priority: 10,
//   foodtype: 'goodies',
//   health: 0,
//   hunger: calories_med,
//   perish: perish_superfast,
//   sanity: sanity_huge,
//   temperature: cold_food_bonus_temp,
//   temperatureduration: food_temp_long,
//   cooktime: 0.5,
//   mode: 'together'
// },
// watermelonicle_dst: {
//   name: 'Melonsicle',
//   test: (cooker, names, tags) => {
//     return names.watermelon_dst && tags.frozen && names.twigs_dst && !tags.meat && !tags.veggie && !tags.egg;
//   },
//   requirements: [SPECIFIC('watermelon_dst'), TAG('frozen'), SPECIFIC('twigs_dst'), NOT(TAG('meat')), NOT(TAG('veggie')), NOT(TAG('egg'))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: healing_small,
//   hunger: calories_small,
//   perish: perish_superfast,
//   sanity: sanity_medlarge,
//   temperature: cold_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 0.5,
//   mode: 'together'
// },		
// trailmix_dst: {
//   name: 'Trail Mix',
//   test: (cooker, names, tags) => {
//     return (names.acorn_dst || names.acorn_cooked) && tags.seed && tags.seed >= 1 && (names.berries_dst || names.berries_cooked_dst || names.berries_juicy || names.berries_juicy_cooked) && tags.fruit && tags.fruit >= 1 && !tags.meat && !tags.veggie && !tags.egg && !tags.dairy;
    
//   },
//   requirements: [NAME('acorn'), TAG('seed', COMPARE('>=', 1)), NAME('berries'), TAG('fruit', COMPARE('>=', 1)), NOT(TAG('meat')), NOT(TAG('veggie')), NOT(TAG('egg')), NOT(TAG('dairy'))],
//   priority: 10,
//   foodtype: 'veggie',
//   health: healing_medlarge,
//   hunger: calories_small,
//   perish: perish_slow,
//   sanity: sanity_tiny,
//   cooktime: 0.5,
//   mode: 'together'
// },
// hotchili_dst: {
//   name: 'Spicy Chili',
//   test: (cooker, names, tags) => {
//     return tags.meat && tags.veggie && tags.meat >= 1.5 && tags.veggie >= 1.5;
//   },
//   requirements: [TAG('meat', COMPARE('>=', 1.5)), TAG('veggie', COMPARE('>=', 1.5))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: 0,
//   temperature: hot_food_bonus_temp,
//   temperatureduration: food_temp_long,
//   cooktime: 0.5,
//   mode: 'together'
// },

// guacamole_dst: {
//   name: 'Guacamole',
//   test: (cooker, names, tags) => {
//     return names.mole_dst && (names.rock_avocado_fruit_ripe || names.cactusmeat_dst) && !tags.fruit;
//   },
//   requirements: [SPECIFIC('mole_dst'), OR(SPECIFIC('rock_avocado_fruit_ripe'), SPECIFIC('cactusmeat_dst') ), NOT(TAG('fruit'))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: 0,
//   cooktime: 0.5,
//   mode: 'together'
// },
// bananapop_dst: {
//   name: 'Banana Pop',
//   test: (cooker, names, tags) => {
//     return (names.cave_banana_dst || names.cave_banana_cooked_dst) && tags.frozen && names.twigs_dst && !tags.meat && !tags.fish;
//   },
//   requirements: [NAME('cave_banana'), TAG('frozen'), SPECIFIC('twigs_dst'), NOT(TAG('meat')), NOT(TAG('fish'))],
//   priority: 20,
//   foodtype: 'veggie',
//   health: healing_med,
//   hunger: calories_small,
//   perish: perish_superfast,
//   sanity: sanity_large,
//   temperature: cold_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 0.5,
//   mode: 'together'
// },
// californiaroll_dst: {
//   name: 'California Roll',
//   test: (cooker, names, tags) => {
//     return ((names.kelp || 0) + (names.kelp_cooked || 0) + (names.kelp_dried ||0)) == 2 && tags.fish && tags.fish >= 1;
//   },
//   requirements: [NAME('kelp', COMPARE('=', 2)), TAG('fish', COMPARE('>=', 1))],
//   priority: 20,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: sanity_small,
//   cooktime: 0.5,
//   mode: 'together'
// },
// ceviche_dst: {
//   name: 'Ceviche',
//   test: (cooker, names, tags) => {
//     return tags.fish && tags.fish >= 2 && tags.frozen;
//   },
//   requirements: [TAG('fish', COMPARE('>=', 2)), TAG('frozen')],
//   priority: 20,
//   foodtype: 'meat',
//   health: healing_med,
//   hunger: calories_med,
//   perish: perish_med,
//   sanity: sanity_tiny,
//   temperature: cold_food_bonus_temp,
//   temperatureduration: food_temp_average,
//   cooktime: 0.5,
//   mode: 'together'
// },
// lobsterbisque_dst: {
//   name: 'Wobster Bisque',
//   test: (cooker, names, tags) => {
//     return names.wobster && tags.frozen;
//   },
//   requirements: [SPECIFIC('wobster'), TAG('frozen')],
//   priority: 30,
//   foodtype: 'meat',
//   health: healing_huge,
//   hunger: calories_med,
//   perish: perish_med,
//   sanity: sanity_small,
//   cooktime: 0.5,
//   mode: 'together'
// },
// lobsterdinner_dst: {
//   name: 'Wobster Dinner',
//   test: (cooker, names, tags) => {
//     return names.wobster && names.butter_dst && (tags.meat && tags.meat >= 1) && (tags.fish && tags.fish >= 1) && !tags.frozen;
//   },
//   requirements: [SPECIFIC('wobster'), SPECIFIC('butter_dst'), TAG('meat', COMPARE('>=', 1)), TAG('fish', COMPARE('>=', 1)), NOT(TAG('frozen'))],
//   priority: 25,
//   foodtype: 'meat',
//   health: healing_huge,
//   hunger: calories_large,
//   perish: perish_slow,
//   sanity: sanity_huge,
//   cooktime: 1,
//   mode: 'together'
// },
// seafoodgumbo_dst: {
//   name: 'Seafood Gumbo',
//   test: (cooker, names, tags) => {
//     return tags.fish && tags.fish > 2;
//   },
//   requirements: [TAG('fish', COMPARE('>', 2))],
//   priority: 10,
//   foodtype: 'meat',
//   health: healing_large,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: sanity_medlarge,
//   cooktime: 1,
//   mode: 'together'
// },
// surfnturf_dst: {
//   name: 'Surf \'n\' Turf',
//   test: (cooker, names, tags) => {
//     return tags.meat && tags.meat >= 2.5 && tags.fish && tags.fish >= 1.5 && !tags.frozen;
//   },
//   requirements: [TAG('meat', COMPARE('>=', 2.5)), TAG('fish', COMPARE('>=', 1.5)), NOT(TAG('frozen'))],
//   priority: 30,
//   foodtype: 'meat',
//   health: healing_huge,
//   hunger: calories_large,
//   perish: perish_med,
//   sanity: sanity_large,
//   cooktime: 1,
//   mode: 'together'
// },




// 	jellybean: {
// 		name: 'Jellybeans',
// 		test: (cooker, names, tags) => {
// 			return names.royal_jelly && !tags.inedible && !tags.monster;
// 		},
// 		requirements: [SPECIFIC('royal_jelly'), NOT(TAG('inedible')), NOT(TAG('monster'))],
// 		priority: 12,
// 		foodtype: 'goodies',
// 		health: 2,
// 		hunger: 0,
// 		sanity: sanity_tiny,
// 		cooktime: 2.5,
// 		note: 'Recipe produces 3; heals 120 health over 2 minutes',
// 		mode: 'together'
// 	},
// 	vegstinger: {
// 		name: 'Vegetable Stinger',
// 		test: (cooker, names, tags) => {
// 			return (names.asparagus_dst || names.asparagus_cooked_dst || names.tomato || names.tomato_cooked)
// 				&& tags.veggie && tags.veggie > 2 && tags.frozen && !tags.meat && !tags.inedible && !tags.egg;
// 		},
// 		requirements: [OR(NAME('asparagus'), NAME('tomato')), TAG('veggie', COMPARE('>', 2)), TAG('frozen'), NOT(TAG('meat')), NOT(TAG('inedible')), NOT(TAG('egg'))],
// 		priority: 15,
// 		foodtype: 'veggie',
// 		health: healing_small,
// 		hunger: calories_med,
// 		perish: perish_slow,
// 		sanity: sanity_large,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	asparagussoup_dst: {
// 		name: 'Asparagus Soup',
// 		test: (cooker, names, tags) => {
// 			return (names.asparagus_dst || names.asparagus_cooked_dst) && tags.veggie && tags.veggie > 2 && !tags.meat && !tags.inedible;
// 		},
// 		requirements: [NAME('asparagus'), TAG('veggie', COMPARE('>', 2)), NOT(TAG('meat')), NOT(TAG('inedible'))],
// 		priority: 10,
// 		foodtype: 'veggie',
// 		health: healing_med,
// 		hunger: calories_medsmall,
// 		perish: perish_slow,
// 		sanity: sanity_tiny,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	pepperpopper: {
// 		name: 'Stuffed Pepper Poppers',
// 		test: (cooker, names, tags) => {
// 			return (names.pepper || names.pepper_cooked) && tags.meat && tags.meat <= 1.5 && !tags.inedible;
// 		},
// 		requirements: [NAME('pepper'), TAG('meat', COMPARE('<=', 1.5)), NOT(TAG('inedible'))],
// 		priority: 20,
// 		foodtype: 'meat',
// 		health: healing_medlarge,
// 		hunger: calories_med,
// 		perish: perish_slow,
// 		sanity: -sanity_tiny,
// 		cooktime: 2,
// 		temperature: hot_food_bonus_temp,
// 		temperatureduration: food_temp_long,
// 		note: 'Increases temperature by 40 degrees in 15 seconds.',
// 		mode: 'together'
// 	},
// 	mashedpotatoes: {
// 		name: 'Creamy Potato Purée',
// 		test: (cooker, names, tags) => {
// 			return ((names.potato && names.potato > 1) || (names.potato_cooked && names.potato_cooked > 1) || (names.potato && names.potato_cooked)) && (names.garlic || names.garlic_cooked) && !tags.meat && !tags.inedible;
// 		},
// 		requirements: [NAME('potato', COMPARE('>', 1)), NAME('garlic'), NOT(TAG('meat')), NOT(TAG('inedible'))],
// 		priority: 20,
// 		foodtype: 'veggie',
// 		health: healing_med,
// 		hunger: calories_large,
// 		perish: perish_slow,
// 		sanity: sanity_large,
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	salsa: {
// 		name: 'Salsa Fresca',
// 		test: (cooker, names, tags) => {
// 			return (names.tomato || names.tomato_cooked) && (names.onion || names.onion_cooked) && !tags.meat && !tags.egg && !tags.inedible;
// 		},
// 		requirements: [NAME('tomato'), NAME('onion'), NOT(TAG('meat')), NOT(TAG('egg')), NOT(TAG('inedible'))],
// 		priority: 20,
// 		foodtype: 'veggie',
// 		health: healing_medlarge,
// 		hunger: calories_med,
// 		perish: perish_slow,
// 		sanity: sanity_large,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	potatotornado: {
// 		name: 'Fancy Spiralled Tubers',
// 		test: (cooker, names, tags) => {
// 			return (names.potato || names.potato_cooked) && names.twigs_dst && (!tags.monster || tags.monster <= 1) && !tags.meat && (tags.inedible && tags.inedible <= 2);
// 		},
// 		requirements: [NAME('potato'), NAME('twigs'), OR(NOT(TAG('monster')), TAG('monster', COMPARE('<=', 1))), NOT(TAG('meat')), TAG('inedible', COMPARE('<=', 2))],
// 		priority: 10,
// 		foodtype: 'veggie',
// 		health: healing_small,
// 		hunger: calories_large,
// 		perish: perish_med,
// 		sanity: sanity_med,
// 		cooktime: 0.75,
// 		mode: 'together'
// 	},
// 	barnaclepita: {
// 		name: 'Barnacle Pita',
// 		test: (cooker, names, tags) => {
// 			return (names.barnacle || names.barnacle_cooked) && tags.veggie && tags.veggie >= 0.5;
// 		},
// 		requirements: [NAME('barnacle'), TAG('veggie', COMPARE('>=', 0.5))],
// 		priority: 25,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_large,
// 		perish: perish_slow,
// 		sanity: sanity_tiny,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	barnaclesushi: {
// 		name: 'Barnacle Nigiri',
// 		test: (cooker, names, tags) => {
// 			return (names.barnacle || names.barnacle_cooked) && (names.kelp || names.kelp_cooked) && tags.egg && tags.egg >= 1;
// 		},
// 		requirements: [NAME('barnacle'), NAME('kelp'), TAG('egg', COMPARE('>=', 1))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_large,
// 		hunger: calories_large,
// 		perish: perish_med,
// 		sanity: sanity_tiny,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	barnaclinguine: {
// 		name: 'Barnacle Linguine',
// 		test: (cooker, names, tags) => {
// 			return ((names.barnacle || 0) + (names.barnacle_cooked || 0) >= 2 ) && tags.veggie && tags.veggie >= 2;
// 		},
// 		requirements: [NAME('barnacle', COMPARE('>=', 2)), TAG('veggie', COMPARE('>=', 2))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_med / 2,
// 		hunger: calories_large * 2,
// 		perish: perish_fast,
// 		sanity: healing_med,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	barnaclestuffedfishhead: {
// 		name: 'Stuffed Fish Heads',
// 		test: (cooker, names, tags) => {
// 			return (names.barnacle || names.barnacle_cooked) && tags.fish && tags.fish >= 1.25;
// 		},
// 		requirements: [NAME('barnacle'), TAG('fish', COMPARE('>=', 1.25))],
// 		priority: 26,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_large * 2,
// 		perish: perish_superfast,
// 		sanity: 0,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	shroomcake: {
// 		name: 'Mushy Cake',
// 		test: (cooker, names, tags) => {
// 			return names.moon_mushroom && names.red_mushroom_dst && names.blue_mushroom_dst && names.green_mushroom_dst;
// 		},
// 		requirements: [SPECIFIC('moon_mushroom'), SPECIFIC('red_mushroom_dst'), SPECIFIC('blue_mushroom_dst'), SPECIFIC('green_mushroom_dst')],
// 		priority: 30,
// 		foodtype: 'goodies',
// 		health: 0,
// 		hunger: calories_med,
// 		sanity: sanity_small,
// 		perish: perish_slow,
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	sweettea: {
// 		name: 'Soothing Tea',
// 		test: (cooker, names, tags) => {
// 			return names.forgetmelots && tags.sweetener && tags.frozen && !tags.monster && !tags.veggie && !tags.meat && !tags.fish && !tags.egg && !tags.fat && !tags.dairy && !tags.inedible;
// 		},
// 		requirements: [NAME('forgetmelots'), TAG('sweetener'), TAG('frozen'), NOT(TAG('monster')), NOT(TAG('veggie')), NOT(TAG('meat')), NOT(TAG('fish')), NOT(TAG('egg')), NOT(TAG('fat')), NOT(TAG('dairy')), NOT(TAG('inedible'))],
// 		priority: 1,
// 		foodtype: 'goodies',
// 		health: healing_small,
// 		hunger: 0,
// 		sanity: sanity_med,
// 		perish: perish_superfast,
// 		temperature: hot_food_bonus_temp,
// 		temperatureduration: food_temp_brief,
// 		cooktime: 1,
// 		note: 'Restores 30 sanity over 1 minute',
// 		mode: 'together'
// 	},
// 	koalefig_trunk: {
// 		name: 'Fig-Stuffed Trunk',
// 		test: (cooker, names, tags) => {
// 			return (names.trunk_summer_dst || names.trunk_cooked_dst || names.trunk_winter_dst) && (names.fig || names.fig_cooked);
// 		},
// 		requirements: [OR(NAME('trunk_summer'), NAME('trunk_winter')), NAME('fig')],
// 		priority: 40,
// 		foodtype: 'meat',
// 		health: healing_huge,
// 		hunger: calories_large + calories_medsmall,
// 		sanity: 0,
// 		perish: perish_med,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	figatoni: {
// 		name: 'Figatoni',
// 		test: (cooker, names, tags) => {
// 			return (names.fig || names.fig_cooked) && tags.veggie && tags.veggie >= 2 && !tags.meat;
// 		},
// 		requirements: [NAME('fig'), TAG('veggie', COMPARE('>=', 2)), NOT(TAG('meat'))],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_medlarge,
// 		hunger: calories_large + calories_medsmall,
// 		sanity: sanity_med,
// 		perish: perish_fast,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	figkabab: {
// 		name: 'Figkabab',
// 		test: (cooker, names, tags) => {
// 			return (names.fig || names.fig_cooked) && names.twigs_dst && tags.meat && tags.meat >= 1 && (!tags.monster || tags.monster <= 1);
// 		},
// 		requirements: [NAME('fig'), SPECIFIC('twigs_dst'), TAG('meat', COMPARE('>=', 1)), OR(NOT(TAG('monster')), TAG('monster', COMPARE('<=', 1)))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_med,
// 		sanity: sanity_med,
// 		perish: perish_slow,
// 		temperature: hot_food_bonus_temp,
// 		temperatureduration: food_temp_long,
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	frognewton: {
// 		name: 'Figgy Frogwich',
// 		test: (cooker, names, tags) => {
// 			return (names.fig || names.fig_cooked) && (names.froglegs_dst || names.froglegs_cooked_dst);
// 		},
// 		requirements: [NAME('fig'), NAME('froglegs')],
// 		priority: 1,
// 		foodtype: 'meat',
// 		health: healing_medsmall,
// 		hunger: calories_medsmall,
// 		sanity: sanity_small,
// 		perish: perish_slow,
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	frozenbananadaiquiri: {
// 		name: 'Frozen Banana Daiquiri',
// 		test: (cooker, names, tags) => {
// 			return (names.cave_banana_dst || names.cave_banana_cooked_dst) && (tags.frozen && tags.frozen >=1) && !tags.meat && !tags.fish;
// 		},
// 		requirements: [NAME('cave_banana'), TAG('frozen', COMPARE('>=', 1)), NOT(TAG('meat')), NOT(TAG('meat'))],
// 		priority: 2,
// 		foodtype: 'goodies',
// 		health: healing_medlarge,
// 		hunger: calories_medsmall,
// 		sanity: sanity_med,
// 		perish: perish_slow,
// 		temperature: cold_food_bonus_temp,
// 		temperatureduration: food_temp_long,
// 		note: 'Lowers temperature by 15 degrees over 15 seconds',
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	bunnystew: {
// 		name: 'Bunny Stew',
// 		test: (cooker, names, tags) => {
// 			return (tags.meat && tags.meat < 1) && (tags.frozen && tags.frozen >= 2) && !tags.inedible;
// 		},
// 		requirements: [TAG('meat', COMPARE('<', 1)), TAG('frozen', COMPARE('>=', 2)), NOT(TAG('inedible'))],
// 		priority: 1,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_large,
// 		sanity: sanity_tiny,
// 		perish: perish_med,
// 		temperature: hot_food_bonus_temp,
// 		temperatureduration: food_temp_brief,
// 		note: 'Raises temperature by 5 degrees over 5 seconds',
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	bananajuice: {
// 		name: 'Banana Shake',
// 		test: (cooker, names, tags) => {
// 			return ((names.cave_banana_dst || 0) + (names.cave_banana_cooked_dst || 0) >= 2) && !tags.meat && !tags.fish && !tags.monster;
// 		},
// 		requirements: [NAME('cave_banana', COMPARE('>=', 2)), NOT(TAG('meat')), NOT(TAG('fish')), NOT(TAG('monster'))],
// 		priority: 1,
// 		foodtype: 'veggie',
// 		health: healing_medsmall,
// 		hunger: calories_med,
// 		sanity: sanity_large,
// 		perish: perish_slow,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	// A Little Drama update
// 	justeggs: {
// 		name: 'Plain Omelette',
// 		test: (cooker, names, tags) => {
// 			return tags.egg && tags.egg >= 3;
// 		},
// 		requirements: [TAG('egg', COMPARE('>=', 3))],
// 		priority: 0,
// 		foodtype: 'meat',
// 		health: healing_small,
// 		hunger: calories_small * 4,
// 		perish: perish_med,
// 		sanity: sanity_tiny,
// 		cooktime: 0.5,
// 		mode: 'together'
// 	},
// 	veggieomlet: {
// 		name: 'Breakfast Skillet',
// 		test: (cooker, names, tags) => {
// 			return (tags.egg && tags.egg >= 1) && (tags.veggie && tags.veggie >= 1) && !tags.meat && !tags.dairy;
// 		},
// 		requirements: [TAG('egg', COMPARE('>=', 1)), TAG('veggie', COMPARE('>=', 1)), NOT(TAG('meat')), NOT(TAG('dairy'))],
// 		priority: 1,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_large,
// 		perish: perish_preserved,
// 		sanity: sanity_tiny,
// 		cooktime: 1,
// 		mode: 'together'
// 	},
// 	talleggs: {
// 		name: 'Tall Scotch Eggs',
// 		test: (cooker, names, tags) => {
// 			return names.tallbirdegg_dst && tags.veggie && tags.veggie >=1;
// 		},
// 		requirements: [SPECIFIC('tallbirdegg_dst'), TAG('veggie', COMPARE('>=', 1))],
// 		priority: 10,
// 		foodtype: 'meat',
// 		health: healing_huge,
// 		hunger: calories_superhuge,
// 		perish: perish_slow,
// 		sanity: sanity_tiny,
// 		cooktime: 2,
// 		note: 'Requires uncooked Tallbird Egg',
// 		mode: 'together'
// 	},
// 	// food for Beefalo
// 	beefalofeed: {
// 		name: 'Steamed Twigs',
// 		test: (cooker, names, tags) => {
// 			return tags.inedible && !tags.monster && !tags.meat && !tags.fish && !tags.egg && !tags.fat && !tags.dairy && !tags.magic;
// 		},
// 		requirements: [TAG('inedible'), NOT(TAG('monster')), NOT(TAG('meat')), NOT(TAG('fish')), NOT(TAG('egg')), NOT(TAG('fat')), NOT(TAG('dairy')), NOT(TAG('magic'))],
// 		priority: -5,
// 		foodtype: 'roughage',
// 		// secondaryfoodtype: 'wood',
// 		health: healing_medlarge / 2,
// 		hunger: calories_morehuge,
// 		perish: perish_preserved,
// 		sanity: 0,
// 		cooktime: 0.5,
// 		note: 'Cannot be eaten by the player, only given to Beefalo',
// 		mode: 'together'
// 	},
// 	beefalotreat: {
// 		name: 'Beefalo Treats',
// 		test: (cooker, names, tags) => {
// 			return tags.inedible && tags.seed && names.forgetmelots && !tags.monster && !tags.meat && !tags.fish && !tags.egg && !tags.fat && !tags.dairy && !tags.magic;
// 		},
// 		requirements: [TAG('inedible'), TAG('seed'), NAME('forgetmelots'), NOT(TAG('monster')), NOT(TAG('meat')), NOT(TAG('fish')), NOT(TAG('egg')), NOT(TAG('fat')), NOT(TAG('dairy')), NOT(TAG('magic'))],
// 		priority: -4,
// 		foodtype: 'roughage',
// 		health: healing_morehuge,
// 		hunger: calories_med,
// 		perish: perish_preserved,
// 		sanity: 0,
// 		cooktime: 2,
// 		note: 'Cannot be eaten by the player, only given to Beefalo',
// 		mode: 'together'
// 	},
// 	leafloaf: {
// 		name: 'Leafy Meatloaf',
// 		test: (cooker, names, tags) => {
// 			return ((names.plantmeat_dst || 0) + (names.plantmeat_cooked_dst || 0) >= 2 );
// 		},
// 		requirements: [NAME('plantmeat', COMPARE('>=',2))],
// 		priority: 25,
// 		foodtype: 'meat',
// 		health: healing_medsmall,
// 		hunger: calories_large,
// 		perish: perish_preserved,
// 		sanity: sanity_tiny,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	leafymeatburger: {
// 		name: 'Veggie Burger',
// 		test: (cooker, names, tags) => {
// 			return (names.plantmeat_dst || names.plantmeat_cooked_dst) && (names.onion || names.onion_cooked) && tags.veggie && tags.veggie >= 2;
// 		},
// 		requirements: [NAME('plantmeat'), NAME('onion'), TAG('veggie', COMPARE('>=', 2))],
// 		priority: 26,
// 		foodtype: 'meat',
// 		health: healing_medlarge,
// 		hunger: calories_large,
// 		perish: perish_fast,
// 		sanity: sanity_large,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	leafymeatsouffle: {
// 		name: 'Jelly Salad',
// 		test: (cooker, names, tags) => {
// 			return ((names.plantmeat_dst || 0) + (names.plantmeat_cooked_dst || 0) >= 2 ) && tags.sweetener && tags.sweetener >= 2;
// 		},
// 		requirements: [NAME('plantmeat', COMPARE('>=', 2)), TAG('sweetener', COMPARE('>=',2))],
// 		priority: 50,
// 		foodtype: 'meat',
// 		health: 0,
// 		hunger: calories_large,
// 		perish: perish_fast,
// 		sanity: sanity_huge,
// 		cooktime: 2,
// 		mode: 'together'
// 	},
// 	meatysalad: {
// 		name: 'Beefy Greens',
// 		test: (cooker, names, tags) => {
// 			return (names.plantmeat_dst || names.plantmeat_cooked_dst) && tags.veggie && tags.veggie >= 3;
// 		},
// 		requirements: [NAME('plantmeat'), TAG('veggie', COMPARE('>=', 3))],
// 		priority: 25,
// 		foodtype: 'meat',
// 		health: healing_large,
// 		hunger: calories_large * 2,
// 		perish: perish_fast,
// 		sanity: sanity_tiny,
// 		cooktime: 2,
// 		mode: 'together'
// 	},

// 	// preparednonfoods – not dishes, but made in crock pot
// 	batnosehat: {
// 		name: 'Milkmade Hat',
// 		test: (cooker, names, tags) => {
// 			return names.batnose && names.kelp && (tags.dairy && tags.dairy >= 1);
// 		},
// 		requirements: [NAME('batnose'), NAME('kelp'), TAG('dairy', COMPARE ('>=', 1))],
// 		priority: 55,
// 		health: 0,
// 		hunger: 187.5,
// 		sanity: -5.32,
// 		perish: perish_slow,
// 		cooktime: 2,
// 		note: 'While worn, restores 3.9 Hunger every 5 seconds (187.5 in total, over 4 minutes), while reducing Sanity by 1.33 per minute (Wurt gains +1.33 sanity/min, Wigfrid refuses to wear this)',
// 		mode: 'together'
// 	},
// 	dustmeringue: {
// 	 	name: 'Amberosia',
// 	 	test: (cooker, names, tags) => {
// 	 		return names.refined_dust;
// 	 	},
// 	 	requirements: [NAME('refined_dust')],
// 	 	priority: 100,
// 	 	cooktime: 2,
// 	 	note: 'Used to feed Dust Moths, cannot be eaten by the player',
// 	 	mode: 'together'
// 	 },



//    // 왈리
//    	nightmarepie: {
// 		name: 'Grim Galette',
// 		test: (cooker, names, tags) => {
// 			return (names.nightmarefuel && names.nightmarefuel == 2) && (names.potato || names.potato_cooked) && (names.onion || names.onion_cooked);
// 		},
// 		requirements: [NAME('nightmarefuel', COMPARE('=', 2)), NAME('potato'), NAME('onion')],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_tiny,
// 		hunger: calories_med,
// 		perish: perish_med,
// 		sanity: sanity_tiny,
// 		cooktime: 2,
// 		note: 'The player\'s health and sanity percentage values are swapped',
// 		mode: 'warlydst'
// 	},	
// 	voltgoatjelly: {
// 		name: 'Volt Goat Chaud Froid',
// 		test: (cooker, names, tags) => {
// 			return (names.lightninggoathorn) && (tags.sweetener && tags.sweetener >= 2) && !tags.meat;
// 		},
// 		requirements: [NAME('lightninggoathorn'), TAG('sweetener', COMPARE('>=', 2)), NOT(TAG('meat'))],
// 		priority: 30,
// 		foodtype: 'goodies',
// 		health: healing_small,
// 		hunger: calories_large,
// 		perish: perish_med,
// 		sanity: sanity_small,
// 		cooktime: 2,
// 		note: 'Gain the electrical damage modifier. Deal 1.5x more damage to non-wet mobs; deal 2.5x more damage to wet mobs. Doesn\'t apply to existing electrical weapons.',
// 		mode: 'warlydst'
// 	},
// 	glowberrymousse: {
// 		name: 'Glow Berry Mousse',
// 		test: (cooker, names, tags) => {
// 			return (names.wormlight_dst || (names.wormlight_lesser && names.wormlight_lesser >= 2)) && (tags.fruit && tags.fruit >= 2) && !tags.meat && !tags.inedible;
// 		},
// 		requirements: [OR(SPECIFIC('wormlight_dst'),SPECIFIC('wormlight_lesser', COMPARE('>=', 2))), TAG('fruit', COMPARE('>=', 2)), NOT(TAG('meat')), NOT(TAG('inedible'))],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_small,
// 		hunger: calories_large,
// 		perish: perish_fastish,
// 		sanity: sanity_small,
// 		cooktime: 1,
// 		note: 'Gives those that eat this 16 minutes of light that fades in a similar fashion after eating a glowberry',
// 		mode: 'warlydst'
// 	},
// 	frogfishbowl: {
// 		name: 'Fish Cordon Bleu',
// 		test: (cooker, names, tags) => {
// 			return ((names.froglegs_dst || 0) + (names.froglegs_cooked_dst || 0) >=2) && (tags.fish && tags.fish >= 1) && !tags.inedible;
// 		},
// 		requirements: [NAME('froglegs', COMPARE('>=',2)), TAG('fish', COMPARE('>=', 1)), NOT(TAG('inedible'))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_med,
// 		hunger: calories_large,
// 		sanity: -sanity_small,
// 		perish: perish_fastish,
// 		cooktime: 2,
// 		note: 'Sets the player\s wetness to 0 and grants the player wetness immunity for 5 minutes',
// 		mode: 'warlydst'
// 	},
// 	dragonchilisalad: {
// 		name: 'Hot Dragon Chili Salad',
// 		test: (cooker, names, tags) => {
// 			return (names.dragonfruit_dst || names.dragonfruit_cooked_dst) && (names.pepper || names.pepper_cooked) && !tags.meat && !tags.inedible && !tags.egg;
// 		},
// 		requirements: [NAME('dragonfruit'), NAME('pepper'), NOT(TAG('meat')), NOT(TAG('inedible')), NOT(TAG('egg'))],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: -healing_small,
// 		hunger: calories_med,
// 		sanity: sanity_small,
// 		temperature: hot_food_bonus_temp,
// 		perish: perish_slow,
// 		cooktime: 0.75,
// 		note: 'Increases and keeps the player\'s temperature to 40 below ambient for 5 minutes',
// 		mode: 'warlydst'
// 	},
// 	gazpacho: {
// 		name: 'Asparagazpacho',
// 		test: (cooker, names, tags) => {
// 			return ((names.asparagus_dst || 0) + (names.asparagus_cooked_dst || 0) >=2) && (tags.frozen && tags.frozen >=2);
// 		},
// 		requirements: [NAME('asparagus', COMPARE('>=', 2)), TAG('frozen', COMPARE('>=', 2))],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_small,
// 		hunger: calories_med,
// 		sanity: sanity_small,
// 		temperature: cold_food_bonus_temp,
// 		perish: perish_slow,
// 		cooktime: 0.5,
// 		note: 'Decreases and keeps the player\'s temperature to 20 below ambient for 5 minutes',
// 		mode: 'warlydst'
// 	},
// 	potatosouffle: {
// 		name: 'Puffed Potato Souffle',
// 		test: (cooker, names, tags) => {
// 			return ((names.potato && names.potato >= 2) || (names.potato_cooked && names.potato_cooked >= 2) || (names.potato && names.potato_cooked)) && tags.egg && !tags.meat && !tags.inedible;
// 		},
// 		requirements: [NAME('potato', COMPARE('>=', 2)), TAG('egg'), NOT(TAG('meat')), NOT(TAG('inedible'))],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_med,
// 		hunger: calories_large,
// 		perish: perish_med,
// 		sanity: sanity_med,
// 		cooktime: 2,
// 		mode: 'warlydst'
// 	},
// 	monstertartare: {
// 		name: 'Monster Tartare',
// 		test: (cooker, names, tags) => {
// 			return tags.monster && tags.monster >= 2 && !tags.inedible;
// 		},
// 		requirements: [TAG('monster', COMPARE('>=', 2)), NOT(TAG('inedible'))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: -healing_med,
// 		hunger: calories_small*5,
// 		perish: perish_med,
// 		sanity: -sanity_medlarge,
// 		cooktime: 0.5,
// 		mode: 'warlydst'
// 	},
// 	freshfruitcrepes: {
// 		name: 'Fresh Fruit Crepes',
// 		test: (cooker, names, tags) => {
// 			return tags.fruit && tags.fruit >= 1.5 && names.butter_dst && names.honey_dst;
// 		},
// 		requirements: [TAG('fruit', COMPARE('>=', 1.5)), SPECIFIC('butter_dst'), SPECIFIC('honey_dst')],
// 		priority: 30,
// 		foodtype: 'veggie',
// 		health: healing_huge,
// 		hunger: calories_superhuge,
// 		perish: perish_med,
// 		sanity: sanity_med,
// 		cooktime: 2,
// 		mode: 'warlydst'
// 	},
// 	bonesoup: {
// 		name: 'Bone Bouillon',
// 		test: (cooker, names, tags) => {
// 			return names.boneshard && names.boneshard == 2 && (names.onion || names.onion_cooked) && (tags.inedible && tags.inedible < 3);
// 		},
// 		requirements: [NAME('boneshard', COMPARE('=', 2)), NAME('onion'), TAG('inedible', COMPARE('<', 3))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_medsmall * 4,
// 		hunger: calories_large * 4,
// 		sanity: sanity_tiny,
// 		perish: perish_med,
// 		cooktime: 2,
// 		mode: 'warlydst'
// 	},
// 	moqueca: {
// 		name: 'Moqueca',
// 		test: (cooker, names, tags) => {
// 			return tags.fish && (names.onion || names.onion_cooked) && (names.tomato || names.tomato_cooked) && !tags.inedible;
// 		},
// 		requirements: [TAG('fish'), NAME('onion'), NAME('tomato'), NOT(TAG('inedible'))],
// 		priority: 30,
// 		foodtype: 'meat',
// 		health: healing_med * 3,
// 		hunger: calories_large * 3,
// 		perish: perish_fastish,
// 		sanity: sanity_large,
// 		cooktime: 2,
// 		mode: 'warlydst'
// 	},
  