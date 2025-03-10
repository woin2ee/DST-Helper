import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../l10n/l10ns.dart';
import '../../../../models/v2/item/categories.dart';
import '../../../../utils/font_family.dart';
import '../../../farm_grid/farm_group/farm_group_model.dart';
import '../../../farm_grid/farm_view/farm_view_model.dart';
import 'family_condition.dart';

part 'family_condition_box.freezed.dart';

class FamilyConditionBox extends StatelessWidget {
  const FamilyConditionBox({
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
    required this.hintTextColor,
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
  final Color hintTextColor;
  final Color unsatisfiedBoxColor;
  final Color satisfiedBoxColor;

  final FamilyConditionBoxController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value.isSatisfying) {
          return child ?? _buildSatisfiedBox(context);
        } else {
          return _buildUnsatisfiedBox(value, context);
        }
      },
      child: _buildSatisfiedBox(context),
    );
  }

  Widget _buildUnsatisfiedBox(FamilyConditionBoxModel value, BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: horizontalTextPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: textSpacing,
          children: [
            FittedBox(
              child: Text(
                // TODO: Utilize issue crops. (value.issueCrops)
                // '일부 작물(감자)이 가족 조건을 만족하지 않습니다!',
                L10ns.of(context).localized('family_condition_unsatisfying_first_text'),
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: mainTextSize,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                L10ns.of(context).localized('family_condition_unsatisfying_secondary_text'),
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

  Widget _buildSatisfiedBox(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: horizontalTextPadding),
        child: FittedBox(
          child: Text(
            L10ns.of(context).localized('family_condition_satisfying_text'),
            style: const TextStyle(
              fontFamily: FontFamily.pretendard,
              fontSize: 17,
              fontVariations: [FontVariation.weight(500)],
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class FamilyConditionBoxController extends ValueNotifier<FamilyConditionBoxModel> {
  FamilyConditionBoxController.init()
      : _farmGroupModel = FarmGroupModel.single(farmViewModel: FarmViewModel.empty(FarmType.basic)),
        super(
          const FamilyConditionBoxModel(
            isSatisfying: false,
            issueCrops: {},
          ),
        );

  factory FamilyConditionBoxController.withModel(FarmGroupModel model) {
    final self = FamilyConditionBoxController.init();
    self._farmGroupModel = model;
    self._updateValue();
    return self;
  }

  FarmGroupModel _farmGroupModel;

  void updateFarmGroupModel(FarmGroupModel farmGroupModel) {
    _farmGroupModel = farmGroupModel;
    _updateValue();
  }

  void _updateValue() {
    final condition = FamilyCondition.withModel(_farmGroupModel);
    if (condition.isSatisfied) {
      _satisfy();
    } else {
      _dissatisfyWith({});
    }
  }

  void _satisfy() {
    value = value.copyWith(isSatisfying: true, issueCrops: {});
  }

  void _dissatisfyWith(Set<Crop> crops) {
    value = value.copyWith(isSatisfying: false, issueCrops: crops);
  }
}

@freezed
class FamilyConditionBoxModel with _$FamilyConditionBoxModel {
  const factory FamilyConditionBoxModel({
    required bool isSatisfying,
    required Set<Crop?> issueCrops,
  }) = _FamilyConditionBoxModel;
}
