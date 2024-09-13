import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class SeasonConditionBox extends StatelessWidget {
  const SeasonConditionBox({
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

  final SeasonConditionBoxController controller;

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
                '거대 작물이 될 수 있는 계절이 없습니다!',
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: mainTextSize,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                '같은 계절의 작물들로 밭을 구성하세요.',
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

class SeasonConditionBoxController extends ValueNotifier<BuiltSet<Season>> {
  SeasonConditionBoxController({required BuiltSet<Season> suitableSeasons}) : super(suitableSeasons);

  SeasonConditionBoxController.init() : super(BuiltSet());

  set suitableSeasons(BuiltSet<Season> newValue) {
    if (value == newValue) {
      return;
    }
    value = newValue;
  }
}
