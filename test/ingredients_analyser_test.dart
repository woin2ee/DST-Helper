import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/ingredients_analyser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('containEgg', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
      const TallbirdEgg(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containEgg, true);
  });

  test('containInedible', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containInedible, true);
  });

  test('containTwigs', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containTwigs, true);
  });

  test('containMeet', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containMeet, true);
  });

  test('containVeggie', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
      const TomaRoot(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containVeggie, true);
  });

  test('containFruit', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containFruit, true);
  });

  test('containSweetener', () {
    List<Ingredient> ingredients = [
      const Twigs(),
      const Meat(),
      const Watermelon(),
      const Honey(),
    ];
    var subject = IngredientsAnalyser(ingredients);
    expect(subject.containSweetener, true);
  });

  test('meatValue', () {
    List<Ingredient> ingredients = [
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
