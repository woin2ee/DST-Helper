import 'package:flutter/material.dart';

import 'family_condition/family_condition_box.dart';
import 'nutrient_condition_box.dart';
import 'season_condition_box.dart';

class AnalysisViewController {
  AnalysisViewController._({
    required this.isSatisfying,
    required this.isPlacedAnyPlant,
    required this.seasonConditionBoxController,
    required this.nutrientConditionBoxController,
    required this.familyConditionBoxController,
  });

  factory AnalysisViewController.create({
    required SeasonConditionBoxController seasonConditionBoxController,
    required NutrientConditionBoxNotifier nutrientConditionBoxController,
    required FamilyConditionBoxController familyConditionBoxController,
    required bool isPlacedAnyPlant,
  }) {
    bool isSatisfying() {
      return seasonConditionBoxController.suitableSeasons.isNotEmpty &&
          nutrientConditionBoxController.value.isSatisfying &&
          familyConditionBoxController.value.isSatisfying;
    }

    final analysisViewController = AnalysisViewController._(
      seasonConditionBoxController: seasonConditionBoxController,
      nutrientConditionBoxController: nutrientConditionBoxController,
      familyConditionBoxController: familyConditionBoxController,
      isSatisfying: ValueNotifier(isSatisfying()),
      isPlacedAnyPlant: ValueNotifier(isPlacedAnyPlant),
    );

    seasonConditionBoxController.addListener(() {
      analysisViewController.isSatisfying.value = isSatisfying();
    });
    nutrientConditionBoxController.addListener(() {
      analysisViewController.isSatisfying.value = isSatisfying();
    });
    familyConditionBoxController.addListener(() {
      analysisViewController.isSatisfying.value = isSatisfying();
    });
    return analysisViewController;
  }

  final SeasonConditionBoxController seasonConditionBoxController;
  final NutrientConditionBoxNotifier nutrientConditionBoxController;
  final FamilyConditionBoxController familyConditionBoxController;

  ValueNotifier<bool> isSatisfying;
  ValueNotifier<bool> isPlacedAnyPlant;
}
