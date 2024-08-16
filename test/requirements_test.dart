import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/food_value.dart';
import 'package:dst_helper/models/ingredients_analyser.dart';
import 'package:dst_helper/models/requirement.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MeetRequirement', () {
    test('The same values', () {
      // Given
      const subject = MeetRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 1.0)}));
      const ingredientsAnalyser = IngredientsAnalyser([Meat()]);

      // When & Then
      expect(subject.isMetFor(ingredientsAnalyser), true);
    });

    test('The lacked value', () {
      // Given
      const subject = MeetRequirement(FoodValues({FoodValue(FoodValueCategory.meat, 1.0)}));
      const ingredientsAnalyser = IngredientsAnalyser([Morsel()]);

      // When & Then
      expect(subject.isMetFor(ingredientsAnalyser), false);
    });

    test('The abounded value', () {
      // Given
      const subject = MeetRequirement(FoodValues({FoodValue(FoodValueCategory.egg, 1.0)}));
      const ingredientsAnalyser = IngredientsAnalyser([TallbirdEgg()]);

      // When & Then
      expect(subject.isMetFor(ingredientsAnalyser), true);
    });
  });
}
