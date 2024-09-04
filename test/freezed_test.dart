import 'dart:convert';

import 'package:dst_helper/models/v1/item/requirement.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/category_mixins.dart';
import 'package:dst_helper/models/v2/item/food_value.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('freezed_equals', () {
    const potatoSeeds = Seed(
      code: 'potato_seeds',
      assetName: 'potato_seeds',
      type: FoodType.seeds,
      compositeAssetName: 'cooked_potato_seeds',
    );
    final potato1 = Crop(
      code: 'potato',
      assetName: 'potato',
      foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
      nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
      seasons: {Season.spring, Season.autumn, Season.winter},
      type: FoodType.veggie,
      seed: potatoSeeds,
    );
    final potato2 = Crop(
      code: 'potato',
      assetName: 'potato',
      foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
      nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
      seasons: {Season.spring, Season.autumn, Season.winter},
      type: FoodType.veggie,
      seed: potatoSeeds,
    );

    expect(potatoSeeds.code, 'potato_seeds');
    expect(potatoSeeds.assetName, 'potato_seeds');
    expect(potatoSeeds.type, FoodType.seeds);
    expect(potatoSeeds.compositeAssetName, 'cooked_potato_seeds');

    expect(potato1.code, 'potato');
    expect(potato1.assetName, 'potato');
    expect(potato1.foodValues, FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}));
    expect(potato1.nutrient, const Nutrient(compost: 2, growthFormula: 2, manure: -4));
    expect(potato1.seasons, const {Season.spring, Season.autumn, Season.winter});
    expect(potato1.type, FoodType.veggie);
    expect(potato1.seed, potatoSeeds);

    expect(potato1, potato2);
  });

  test('freezed_serialization', () async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences pref = await SharedPreferences.getInstance();

    const potatoSeeds = Seed(
      code: 'potato_seeds',
      assetName: 'potato_seeds',
      type: FoodType.seeds,
      compositeAssetName: 'cooked_potato_seeds',
    );
    final potato = Crop(
      code: 'potato',
      assetName: 'potato',
      foodValues: FoodValues({const FoodValue(FoodValueCategory.vegetable, 1.0)}),
      nutrient: const Nutrient(compost: 2, growthFormula: 2, manure: -4),
      seasons: {Season.spring, Season.autumn, Season.winter},
      type: FoodType.veggie,
      seed: potatoSeeds,
    );

    final jsonString = jsonEncode(potato.toJson());
    expect(jsonString,
        '{"code":"potato","assetName":"potato","foodValues":{"rawValues":[{"category":"vegetable","quantifiedValue":1.0}]},"nutrient":{"compost":2,"growthFormula":2,"manure":-4},"seasons":["spring","autumn","winter"],"type":"veggie","seeds":{"code":"potato_seeds","assetName":"potato_seeds","type":"seeds","compositeAssetName":"cooked_potato_seeds"}}');
    await pref.setString('crop', jsonString);

    final gotJsonString = pref.getString('crop');
    if (gotJsonString == null) fail('null');
    final json = jsonDecode(gotJsonString);
    final decodedPotato = Crop.fromJson(json);
    expect(potato, decodedPotato);
  });

  test('nutrient_zero', () {
    final nutrient = Nutrient.zero();
    expect(nutrient.compost, 0);
    expect(nutrient.growthFormula, 0);
    expect(nutrient.manure, 0);
  });

  test('union', () {
    const steamedTwigs = Recipe(
      code: 'beefalofeed',
      assetName: 'steamed_twigs',
      priority: -5,
      requirements: Requirements({}),
    );
    const meatballs = EdibleRecipe(
      code: 'meatballs',
      assetName: 'meatballs',
      type: FoodType.meat,
      priority: -1,
      requirements: Requirements({}),
    );

    List<Recipe> recipes = [steamedTwigs, meatballs];
    recipes[0].priority;
  });
}
