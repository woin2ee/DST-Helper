import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/models/v1/localization/season_localization.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

class SeasonConditionBox extends StatelessWidget {
  const SeasonConditionBox({
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

  final SeasonConditionBoxController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        if (value.isEmpty) {
          return child ?? _buildUnsatisfiedBox();
        } else {
          return _buildSatisfiedBox(value, context);
        }
      },
      child: _buildUnsatisfiedBox(),
    );
  }

  Container _buildSatisfiedBox(BuiltSet<Season> value, BuildContext context) {
    const defaultTextStyle = TextStyle(
      fontFamily: FontFamily.pretendard,
      color: Colors.black,
      fontSize: 17,
      fontVariations: [FontVariation.weight(500)],
    );
    final partialSeasonTextSpans = value.map((season) => TextSpan(
          text: season.localizedName(context),
          style: defaultTextStyle.copyWith(color: season.personalColor),
        ));
    final seasonTextSpan = partialSeasonTextSpans.intersperse(
      const TextSpan(
        text: ', ',
        style: defaultTextStyle,
      ),
    );
    const remainingTextSpan = TextSpan(
      text: '에 거대 작물이 됩니다!',
      style: defaultTextStyle,
    );
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
      child: FittedBox(
        child: RichText(
          text: TextSpan(
            children: [
              ...seasonTextSpan,
              remainingTextSpan,
            ],
          ),
        ),
      ),
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
