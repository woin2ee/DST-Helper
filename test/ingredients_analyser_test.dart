import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:dst_helper/models/v1/item/ingredients_analyser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('containEgg', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const TallbirdEgg(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containEgg, true);
  });

  test('containInedible', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containInedible, true);
  });

  test('containTwigs', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containTwigs, true);
  });

  test('containMeet', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containMeet, true);
  });

  test('containVeggie', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const TomaRoot(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containVeggie, true);
  });

  test('containFruit', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containFruit, true);
  });

  test('containSweetener', () {
    final List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
      const Honey(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.containSweetener, true);
  });

  test('meatValue', () {
    final List<IngredientObject> ingredients = [
      const Barnacles(),
      const FrogLegs(),
      const Morsel(),
      const Meat(),
      const MonsterMeat(),
    ];
    final subject = IngredientsAnalyser(ingredients);
    expect(subject.meatValue, 3.25);
  });
}
