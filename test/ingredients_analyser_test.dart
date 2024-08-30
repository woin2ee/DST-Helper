import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:dst_helper/models/v1/item/ingredients_analyser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('containEgg', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const TallbirdEgg(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containEgg, true);
  });

  test('containInedible', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containInedible, true);
  });

  test('containTwigs', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containTwigs, true);
  });

  test('containMeet', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containMeet, true);
  });

  test('containVeggie', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const TomaRoot(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containVeggie, true);
  });

  test('containFruit', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containFruit, true);
  });

  test('containSweetener', () {
    List<IngredientObject> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
      const Honey(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containSweetener, true);
  });

  test('meatValue', () {
    List<IngredientObject> ingredients = [
      const Barnacles(),
      const FrogLegs(),
      const Morsel(),
      const Meat(),
      const MonsterMeat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.meatValue, 3.25);
  });
}
