import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:styled_text/styled_text.dart';

import '../../../../l10n/l10ns.dart';
import '../../../../models/v1/season.dart';
import '../../../../utils/font_family.dart';

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
          return child ?? _buildUnsatisfiedBox(context);
        } else {
          return _buildSatisfiedBox(value, context);
        }
      },
      child: _buildUnsatisfiedBox(context),
    );
  }

  Container _buildSatisfiedBox(BuiltSet<Season> value, BuildContext context) {
    final String seasonsText = value
        .map((season) => '<${season.name}>${L10ns.of(context).localized(season.name)}</${season.name}>')
        .intersperse(', ')
        .fold('', (text, element) => text += element);
    final localizedText = L10ns.of(context).seasonConditionSatisfyingText(seasonsText);
    final seasonConditionSatisfyingText = StyledText(
      text: localizedText,
      tags: {
        for (final season in Season.values) season.name: StyledTextTag(style: TextStyle(color: season.personalColor)),
      },
      style: const TextStyle(
        fontFamily: FontFamily.pretendard,
        color: Colors.black,
        fontSize: 17,
        fontVariations: [FontVariation.weight(500)],
      ),
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
      child: Padding(
        padding: EdgeInsets.only(left: horizontalTextPadding, right: horizontalTextPadding),
        child: FittedBox(
          child: seasonConditionSatisfyingText,
        ),
      ),
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
                L10ns.of(context).localized('season_condition_unsatisfying_first_text'),
                style: TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontSize: mainTextSize,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                L10ns.of(context).localized('season_condition_unsatisfying_secondary_text'),
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

  BuiltSet<Season> get suitableSeasons => value;
  set suitableSeasons(BuiltSet<Season> newValue) {
    if (value == newValue) {
      return;
    }
    value = newValue;
  }
}
