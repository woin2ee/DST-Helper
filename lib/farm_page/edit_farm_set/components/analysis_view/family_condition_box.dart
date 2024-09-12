import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_condition_box.freezed.dart';

class FamilyConditionBox extends StatelessWidget {
  const FamilyConditionBox({
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

  final FamilyConditionBoxController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
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
                      '일부 작물(감자)이 가족 조건을 만족하지 않습니다!',
                      style: TextStyle(
                        fontFamily: FontFamily.pretendard,
                        fontSize: mainTextSize,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      '최소 4개 작물이 인접해 있어야 합니다.',
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
        });
  }
}

class FamilyConditionBoxController extends ValueNotifier<FamilyConditionBoxModel> {
  FamilyConditionBoxController()
      : super(const FamilyConditionBoxModel(
          isSatisfying: false,
          issueCrops: {},
        ));

  void satisfy() {
    value = value.copyWith(isSatisfying: true, issueCrops: {});
  }

  void dissatisfyWith(Set<Crop> crops) {
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
