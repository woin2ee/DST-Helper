import 'package:freezed_annotation/freezed_annotation.dart';

import '../../v1/season.dart';
import '../status_value.dart';
import 'category_mixins.dart';
import 'food_value.dart';
import 'nutrient.dart';
import 'requirement.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';

@freezed
class Food with _$Food, Item, Edible {
  const factory Food({
    required String code,
    required String assetName,
    required FoodType type,
  }) = _Food;

  @With<Cookable>()
  const factory Food.cookable({
    required String code,
    required String assetName,
    required FoodType type,
    required String cookedAssetName,
    required String? compositeAssetName,
  }) = CookableFood;
}

@freezed
class Ingredient with _$Ingredient, Item, UsingInCrockPot {
  const factory Ingredient({
    required String code,
    required String assetName,
    required FoodValues? foodValues,
  }) = _Ingredient;

  @With<Edible>()
  const factory Ingredient.edible({
    required String code,
    required String assetName,
    required FoodType type,
    required FoodValues? foodValues,
  }) = EdibleIngredient;
}

@freezed
class Plant with _$Plant, Item, Plantable {
  const factory Plant({
    required String code,
    required String assetName,
    required Set<Season> seasons,
    required Nutrient nutrient,
  }) = _Plant;

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

  const factory Plant.weed({
    required String code,
    required String assetName,
    required Nutrient nutrient,
    required Set<Season> seasons,
  }) = Weed;

  @With<Edible>()
  @With<UsingInCrockPot>()
  const factory Plant.forgetMeLots({
    required String code,
    required String assetName,
    required Nutrient nutrient,
    required Set<Season> seasons,
    required FoodType type,
    required FoodValues? foodValues,
  }) = ForgetMeLots;

  @With<Edible>()
  const factory Plant.edibleWeed({
    required String code,
    required String assetName,
    required Nutrient nutrient,
    required Set<Season> seasons,
    required FoodType type,
  }) = EdibleWeed;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}

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

@freezed
class Recipe with _$Recipe, Item, CookableWithCrockPot {
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
