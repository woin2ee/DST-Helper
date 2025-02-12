import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10ns.dart';
import '../../../../models/v2/item/categories.dart';
import '../../../../models/v2/item/nutrient.dart';
import '../../../../utils/font_family.dart';
import '../../../farm_list/farm_group/farm_group_model.dart';
import '../../../farm_list/farm_plant/farm_view_model.dart';
import '../../../farm_list/farm_plant_card/farm_card_model.dart';

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

  final NutrientConditionBoxNotifier controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value.isSatisfying) {
          return _buildSatisfiedBox(value, context);
        } else {
          return child ?? _buildUnsatisfiedBox(context);
        }
      },
      child: _buildUnsatisfiedBox(context),
    );
  }

  Container _buildUnsatisfiedBox(BuildContext context) {
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
                L10ns.of(context).localized('nutrient_condition_unsatisfying_first_text'),
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: mainTextSize,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                L10ns.of(context).localized('nutrient_condition_unsatisfying_secondary_text'),
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
          L10ns.of(context).localized('nutrient_condition_satisfying_first_text'),
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

class NutrientConditionBoxNotifier extends ValueNotifier<NutrientConditionBoxModel> {
  NutrientConditionBoxNotifier.init()
      : _farmGroupModel = FarmGroupModel.single(farmViewModel: FarmViewModel.empty(FarmType.basic)),
        super(
          const NutrientConditionBoxModel(
            isSatisfying: false,
            neededFertilizer: null,
            countOfNeededFertilizer: 0,
          ),
        );

  factory NutrientConditionBoxNotifier.withModel(FarmCardModel model) {
    final controller = NutrientConditionBoxNotifier.init();
    controller._farmGroupModel = model.farmGroupModel;
    controller._selectedFertilizer = model.linkedFertilizer;
    controller._updateValue();
    return controller;
  }

  BuiltList<Nutrient> get _nutrientsByFarm => _farmGroupModel.farmViewModels.map((e) => e.totalNutrient).toBuiltList();
  Fertilizer? _selectedFertilizer;
  FarmGroupModel _farmGroupModel;

  void selectFertilizer(Fertilizer? fertilizer) {
    _selectedFertilizer = fertilizer;
    _updateValue();
  }

  void updateFarmGroupModel(FarmGroupModel farmGroupModel) {
    _farmGroupModel = farmGroupModel;
    _updateValue();
  }

  void _updateValue() {
    const unsatisfiedModel = NutrientConditionBoxModel(
      isSatisfying: false,
      neededFertilizer: null,
      countOfNeededFertilizer: 0,
    );

    if (!_farmGroupModel.hasAnyPlant) {
      value = unsatisfiedModel;
      return;
    }

    final bool isSatisfying = _verifyNutrientsBalance(nutrientsByFarm: _nutrientsByFarm);
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

  bool _verifyNutrientsBalance({required BuiltList<Nutrient> nutrientsByFarm}) {
    return nutrientsByFarm
        .every((nutrient) => nutrient.compost >= 0 && nutrient.growthFormula >= 0 && nutrient.manure >= 0);
  }

  /// 영양소 균형을 이루기 위해 필요한 비료 갯수를 반환합니다.
  ///
  /// 선택한 비료로 영양소 균형을 이루지 못할 경우 null 을 반환합니다.
  int? _calculateCountOfNeededFertilizer(Fertilizer selectedFertilizer) {
    if (_verifyNutrientsBalance(nutrientsByFarm: _nutrientsByFarm)) {
      return 0;
    }

    var adjustedNutrientsByFarm = List.of(_nutrientsByFarm.map((e) => e.copyWith()));

    // The max count is 10, because a farm can have a maximum of 10 plants thus its maximum negative value is -80.
    // And a minimum positive value out of nutrients is 8 so, it is.
    for (var i = 0; i < 10; i++) {
      adjustedNutrientsByFarm =
          adjustedNutrientsByFarm.map((nutrient) => nutrient + selectedFertilizer.nutrient).toList();
      if (_verifyNutrientsBalance(nutrientsByFarm: adjustedNutrientsByFarm.toBuiltList())) {
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
