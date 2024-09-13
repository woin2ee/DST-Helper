import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_condition_box.freezed.dart';

class NutrientConditionBox extends StatelessWidget {
  const NutrientConditionBox({
    super.key,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.boxHeight,
    required this.horizontalTextPadding,
    required this.textSpacing,
    required this.mainTextSize,
    required this.hintTextSize,
    required this.hintTextColor,
    required this.boxColor,
    required this.controller,
  });

  final Color borderColor;
  final double borderWidth;
  final BorderRadius borderRadius;
  final double boxHeight;
  final double horizontalTextPadding;
  final double textSpacing;
  final double mainTextSize;
  final double hintTextSize;
  final Color hintTextColor;
  final Color boxColor;

  final NutrientConditionBoxController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: boxColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: borderRadius,
      ),
      height: boxHeight,
      child: Padding(
        padding: EdgeInsets.only(left: horizontalTextPadding, right: horizontalTextPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: textSpacing,
          children: [
            FittedBox(
              child: Text(
                '영양소가 불균형 합니다!',
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: mainTextSize,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                '보완되는 영양소를 가진 작물을 선택하거나, 비료를 선택하세요.',
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: hintTextSize,
                  color: hintTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NutrientConditionBoxController extends ValueNotifier<NutrientConditionBoxModel> {
  NutrientConditionBoxController.init()
      : _nutrientsByFarmPlant = [Nutrient.zero()].toBuiltList(),
        super(
          const NutrientConditionBoxModel(
            isSatisfied: false,
            neededFertilizer: null,
            countOfNeededFertilizer: 0,
          ),
        );

  factory NutrientConditionBoxController.withModel(FarmPlantCardModel model) {
    final controller = NutrientConditionBoxController.init();
    controller._nutrientsByFarmPlant =
        model.farmPlantSetModel.farmPlantModelList.map((e) => e.totalNutrient).toBuiltList();
    controller._selectedFertilizer = model.fertilizer;
    controller._updateValue();
    return controller;
  }

  BuiltList<Nutrient> _nutrientsByFarmPlant;
  Fertilizer? _selectedFertilizer;

  void selectFertilizer(Fertilizer fertilizer) {
    _selectedFertilizer = fertilizer;
    _updateValue();
  }

  void updateTotalNutrientByFarmPlant(BuiltList<Nutrient> nutrientsByFarmPlant) {
    _nutrientsByFarmPlant = nutrientsByFarmPlant;
    _updateValue();
  }

  void _updateValue() {
    final bool isSatisfied = _verifyNutrientsBalance();
    if (isSatisfied) {
      value = value.copyWith(
        isSatisfied: true,
        neededFertilizer: null,
        countOfNeededFertilizer: 0,
      );
      return;
    }

    final selectedFertilizer = _selectedFertilizer;
    if (selectedFertilizer == null) {
      value = value.copyWith(
        isSatisfied: false,
        neededFertilizer: null,
        countOfNeededFertilizer: 0,
      );
      return;
    }

    final neededCount = _calculateCountOfNeededFertilizer(selectedFertilizer);
    if (neededCount == null) {
      value = value.copyWith(
        isSatisfied: false,
        neededFertilizer: null,
        countOfNeededFertilizer: 0,
      );
      return;
    }

    value = value.copyWith(
      isSatisfied: true,
      neededFertilizer: selectedFertilizer,
      countOfNeededFertilizer: neededCount,
    );
    return;
  }

  bool _verifyNutrientsBalance() {
    return _nutrientsByFarmPlant
        .every((nutrient) => nutrient.compost >= 0 && nutrient.growthFormula >= 0 && nutrient.manure >= 0);
  }

  /// 영양소 균형을 이루기 위해 필요한 비료 갯수를 반환합니다.
  ///
  /// 선택한 비료로 영양소 균형을 이루지 못할 경우 null 을 반환합니다.
  int? _calculateCountOfNeededFertilizer(Fertilizer selectedFertilizer) {
    if (_verifyNutrientsBalance()) {
      return 0;
    }

    var adjustedNutrientsByFarmPlant = List.of(_nutrientsByFarmPlant.map((e) => e.copyWith()));

    // The max count is 10, because a farm can have a maximum of 10 plants thus its maximum negative value is -80.
    // And a minimum positive value out of nutrients is 8 so, it is.
    for (var i = 0; i < 10; i++) {
      adjustedNutrientsByFarmPlant =
          adjustedNutrientsByFarmPlant.map((nutrient) => nutrient + selectedFertilizer.nutrient).toList();
      if (_verifyNutrientsBalance()) {
        return i + 1;
      }
    }

    return null;
  }
}

@freezed
class NutrientConditionBoxModel with _$NutrientConditionBoxModel {
  const factory NutrientConditionBoxModel({
    required bool isSatisfied,
    required Fertilizer? neededFertilizer,
    required int countOfNeededFertilizer,
  }) = _NutrientConditionBoxModel;
}
