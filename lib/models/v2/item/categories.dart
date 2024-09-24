import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/models/v2/item/category_mixins.dart';
import 'package:dst_helper/models/v2/item/food_value.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:dst_helper/models/v2/item/requirement.dart';
import 'package:dst_helper/models/v2/status_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';

@freezed
class Food with _$Food, Item, Edible {
  const factory Food({
    required String code,
    required String assetName,
    required FoodType type,
  }) = _Food;
}

@freezed
class CookableFood with _$CookableFood, Item, Edible, Cookable {
  const factory CookableFood({
    required String code,
    required String assetName,
    required FoodType type,
    required String cookedAssetName,
    required String? compositeAssetName,
  }) = _CookableFood;
}

@freezed
class Ingredient with _$Ingredient, Item, UsingInCrockPot {
  const factory Ingredient({
    required String code,
    required String assetName,
    required FoodValues? foodValues,
  }) = _Ingredient;
}

@freezed
class EdibleIngredient with _$EdibleIngredient, Item, Edible, UsingInCrockPot {
  const factory EdibleIngredient({
    required String code,
    required String assetName,
    required FoodType type,
    required FoodValues? foodValues,
  }) = _EdibleIngredient;
}

@freezed
class Plant with _$Plant, Item, Plantable {
  const factory Plant({
    required String code,
    required String assetName,
    required Set<Season> seasons,
    required Nutrient nutrient,
  }) = _Plant;

  @With<Item>()
  @With<Edible>()
  @With<UsingInCrockPot>()
  const factory Plant.crop({
    required String code,
    required String assetName,
    required FoodValues? foodValues,
    required Nutrient nutrient,
    required Set<Season> seasons,
    required FoodType type,
    required Seed seed,
  }) = Crop;

  @With<Item>()
  const factory Plant.weed({
    required String code,
    required String assetName,
    required Nutrient nutrient,
    required Set<Season> seasons,
  }) = Weed;

  @With<Item>()
  @With<UsingInCrockPot>()
  const factory Plant.forgetMeLots({
    required String code,
    required String assetName,
    required Nutrient nutrient,
    required Set<Season> seasons,
    required FoodValues? foodValues,
  }) = ForgetMeLots;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}

// @freezed
// class Crop with _$Crop, Item, Plantable, Edible, UsingInCrockPot {
//   const factory Crop({
//     required String code,
//     required String assetName,
//     required FoodValues? foodValues,
//     required Nutrient nutrient,
//     required Set<Season> seasons,
//     required FoodType type,
//     required Seed seed,
//   }) = _Crop;
// }

@freezed
class Seed with _$Seed, Item, Edible, Cookable {
  const factory Seed({
    required String code,
    required String assetName,
    required FoodType type,
    required String? compositeAssetName,
  }) = _Seed;
  const Seed._();

  @override
  String get cookedAssetName => 'toasted_seeds';

  factory Seed.fromJson(Map<String, Object?> json) => _$SeedFromJson(json);
}

// @freezed
// class Weed with _$Weed, Item, Plantable {
//   const factory Weed({
//     required String code,
//     required String assetName,
//     required Nutrient nutrient,
//     required Set<Season> seasons,
//   }) = _Weed;

//   // This is for `Forget-Me-Lots` only.
//   @With<UsingInCrockPot>()
//   const factory Weed.forgetMeLots({
//     required String code,
//     required String assetName,
//     required Nutrient nutrient,
//     required Set<Season> seasons,
//     required FoodValues? foodValues,
//   }) = ForgetMeLots;

//   const factory Weed.fireNettleFronds({
//     required String code,
//     required String assetName,
//     required Nutrient nutrient,
//     required Set<Season> seasons,
//   }) = FireNettleFronds;
// }

@freezed
class Recipe with _$Recipe, Item, CookableInCrockPot {
  const factory Recipe({
    required String code,
    required String assetName,
    required int priority,
    required Requirements requirements,
    required StatusValue hungerValue,
    required StatusValue healthValue,
    required StatusValue sanityValue,
    required StatusValue maxPerishTimeValue,
    required StatusValue cookTimeValue,
  }) = _Recipe;

  @With<Item>()
  @With<Edible>()
  const factory Recipe.edible({
    required String code,
    required String assetName,
    required int priority,
    required Requirements requirements,
    required FoodType type,
    required StatusValue hungerValue,
    required StatusValue healthValue,
    required StatusValue sanityValue,
    required StatusValue maxPerishTimeValue,
    required StatusValue cookTimeValue,
  }) = EdibleRecipe;
}

@freezed
class Fertilizer with _$Fertilizer, Item {
  const factory Fertilizer({
    required String code,
    required String assetName,
    required Nutrient nutrient,
  }) = _Fertilizer;

  factory Fertilizer.fromJson(Map<String, dynamic> json) => _$FertilizerFromJson(json);
}
