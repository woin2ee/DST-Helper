import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_condition_box.freezed.dart';

class NutrientConditionBox extends StatelessWidget {
  const NutrientConditionBox({
    super.key,
    required this.unsatisfiedBorderColor,
    required this.satisfiedBorderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.boxHeight,
    required this.horizontalTextPadding,
    required this.textSpacing,
    required this.mainTextSize,
    required this.hintTextSize,
    required this.secondaryTextColor,
    required this.unsatisfiedBoxColor,
    required this.satisfiedBoxColor,
    required this.controller,
  });

  final Color unsatisfiedBorderColor;
  final Color satisfiedBorderColor;
  final double borderWidth;
  final BorderRadius borderRadius;
  final double boxHeight;
  final double horizontalTextPadding;
  final double textSpacing;
  final double mainTextSize;
  final double hintTextSize;
  final Color secondaryTextColor;
  final Color unsatisfiedBoxColor;
  final Color satisfiedBoxColor;

  final NutrientConditionBoxController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value.isSatisfying) {
          return _buildSatisfiedBox(value, context);
        } else {
          return child ?? _buildUnsatisfiedBox();
        }
      },
      child: _buildUnsatisfiedBox(),
    );
  }

  Container _buildUnsatisfiedBox() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: unsatisfiedBoxColor,
        border: Border.all(
          color: unsatisfiedBorderColor,
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
                  color: secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSatisfiedBox(NutrientConditionBoxModel value, BuildContext context) {
    final neededFertilizer = value.neededFertilizer;
    final countOfNeededFertilizer = value.countOfNeededFertilizer;

    var phrases = [
      FittedBox(
        child: Text(
          '${TextLocalizations.of(context)!.localized('balanced_nutrients')}!',
          style: const TextStyle(
            fontFamily: FontFamily.pretendard,
            fontSize: 17,
            fontVariations: [FontVariation.weight(500)],
          ),
        ),
      ),
    ];
    if (neededFertilizer != null && countOfNeededFertilizer != 0) {
      phrases += [
        FittedBox(
          child: Text(
            '각 성장마다 선택한 비료를 $countOfNeededFertilizer번 사용해야 합니다.',
            style: TextStyle(
              fontFamily: FontFamily.pretendard,
              fontSize: 14,
              color: secondaryTextColor,
            ),
          ),
        ),
      ];
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: satisfiedBoxColor,
        border: Border.all(
          color: satisfiedBorderColor,
          width: borderWidth,
        ),
        borderRadius: borderRadius,
      ),
      height: boxHeight,
      child: Padding(
        padding: EdgeInsets.only(left: horizontalTextPadding, right: horizontalTextPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: phrases,
        ),
      ),
    );
  }
}

class NutrientConditionBoxController extends ValueNotifier<NutrientConditionBoxModel> {
  NutrientConditionBoxController.init()
      : _farmPlantSetModel = FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(FarmPlantStyle.basic)),
        super(
          const NutrientConditionBoxModel(
            isSatisfying: false,
            neededFertilizer: null,
            countOfNeededFertilizer: 0,
          ),
        );

  factory NutrientConditionBoxController.withModel(FarmPlantCardModel model) {
    final controller = NutrientConditionBoxController.init();
    controller._farmPlantSetModel = model.farmPlantSetModel;
    controller._selectedFertilizer = model.fertilizer;
    controller._updateValue();
    return controller;
  }

  BuiltList<Nutrient> get _nutrientsByFarmPlant =>
      _farmPlantSetModel.farmPlantModelList.map((e) => e.totalNutrient).toBuiltList();
  Fertilizer? _selectedFertilizer;
  FarmPlantSetModel _farmPlantSetModel;

  void selectFertilizer(Fertilizer? fertilizer) {
    _selectedFertilizer = fertilizer;
    _updateValue();
  }

  void updateFarmPlantSetModel(FarmPlantSetModel farmPlantSetModel) {
    _farmPlantSetModel = farmPlantSetModel;
    _updateValue();
  }

  void _updateValue() {
    const unsatisfiedModel = NutrientConditionBoxModel(
      isSatisfying: false,
      neededFertilizer: null,
      countOfNeededFertilizer: 0,
    );

    if (!_farmPlantSetModel.hasAnyPlant) {
      value = unsatisfiedModel;
      return;
    }

    final bool isSatisfying = _verifyNutrientsBalance(nutrientsByFarmPlant: _nutrientsByFarmPlant);
    if (isSatisfying) {
      value = value.copyWith(
        isSatisfying: true,
        neededFertilizer: null,
        countOfNeededFertilizer: 0,
      );
      return;
    }

    final selectedFertilizer = _selectedFertilizer;
    if (selectedFertilizer == null) {
      value = unsatisfiedModel;
      return;
    }

    final neededCount = _calculateCountOfNeededFertilizer(selectedFertilizer);
    if (neededCount == null) {
      value = unsatisfiedModel;
      return;
    }

    value = value.copyWith(
      isSatisfying: true,
      neededFertilizer: selectedFertilizer,
      countOfNeededFertilizer: neededCount,
    );
    return;
  }

  bool _verifyNutrientsBalance({required BuiltList<Nutrient> nutrientsByFarmPlant}) {
    return nutrientsByFarmPlant
        .every((nutrient) => nutrient.compost >= 0 && nutrient.growthFormula >= 0 && nutrient.manure >= 0);
  }

  /// 영양소 균형을 이루기 위해 필요한 비료 갯수를 반환합니다.
  ///
  /// 선택한 비료로 영양소 균형을 이루지 못할 경우 null 을 반환합니다.
  int? _calculateCountOfNeededFertilizer(Fertilizer selectedFertilizer) {
    if (_verifyNutrientsBalance(nutrientsByFarmPlant: _nutrientsByFarmPlant)) {
      return 0;
    }

    var adjustedNutrientsByFarmPlant = List.of(_nutrientsByFarmPlant.map((e) => e.copyWith()));

    // The max count is 10, because a farm can have a maximum of 10 plants thus its maximum negative value is -80.
    // And a minimum positive value out of nutrients is 8 so, it is.
    for (var i = 0; i < 10; i++) {
      adjustedNutrientsByFarmPlant =
          adjustedNutrientsByFarmPlant.map((nutrient) => nutrient + selectedFertilizer.nutrient).toList();
      if (_verifyNutrientsBalance(nutrientsByFarmPlant: adjustedNutrientsByFarmPlant.toBuiltList())) {
        return i + 1;
      }
    }

    return null;
  }
}

@freezed
class NutrientConditionBoxModel with _$NutrientConditionBoxModel {
  const factory NutrientConditionBoxModel({
    required bool isSatisfying,
    required Fertilizer? neededFertilizer,
    required int countOfNeededFertilizer,
  }) = _NutrientConditionBoxModel;
}
