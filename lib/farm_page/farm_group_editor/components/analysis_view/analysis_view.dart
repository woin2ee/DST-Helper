import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/l10ns.dart';
import '../../../../utils/font_family.dart';
import '../../farm_group_editor_model.dart';
import 'family_condition_box.dart';
import 'nutrient_condition_box.dart';
import 'season_condition_box.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const BorderRadius conditionGroupBorderRadius = BorderRadius.all(Radius.circular(12));
    final controller = context.read<FarmGroupEditorModel>().analysisViewController;

    return SizedBox(
      width: 400,
      height: 356,
      child: ValueListenableBuilder(
        valueListenable: controller.isSatisfying,
        builder: (context, isSatisfying, child) {
          return Card(
            color: const Color(0xffFBFBFB),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                color: isSatisfying ? const Color(0xff1CD44A) : const Color(0xffCECECE),
                width: 2.5,
              ),
            ),
            elevation: 6,
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 21, left: 12.7, right: 12.7, bottom: 15),
          child: Column(
            spacing: 19,
            children: [
              const _Title(),
              Expanded(
                child: Stack(
                  children: [
                    _ConditionGroup(
                      controller.seasonConditionBoxController,
                      controller.nutrientConditionBoxController,
                      controller.familyConditionBoxController,
                      borderRadius: conditionGroupBorderRadius,
                    ),
                    ValueListenableBuilder(
                      valueListenable: controller.isPlacedAnyPlant,
                      builder: (context, isPlacedAnyPlant, child) {
                        return Visibility(
                          visible: !isPlacedAnyPlant,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: conditionGroupBorderRadius,
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 3,
                                    sigmaY: 3,
                                  ),
                                  child: Container(color: Colors.white.withOpacity(0.8)),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xffD8D8D8), width: 1.5),
                                  borderRadius: conditionGroupBorderRadius,
                                ),
                              ),
                              Text(
                                L10ns.of(context).localized('no_crops_message'),
                                style: const TextStyle(
                                  fontFamily: FontFamily.pretendard,
                                  fontSize: 26,
                                  fontVariations: [FontVariation.weight(600)],
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    const double imageWidth = 60;

    return Column(
      spacing: 4,
      children: [
        SizedBox(
          height: 73,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            spacing: 14,
            children: [
              const SizedBox(
                width: imageWidth,
                child: Image(
                  image: AssetImage('assets/images/giant_carrots.png'),
                ),
              ),
              SizedBox(
                width: 190,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      L10ns.of(context).localized('giant_crop'),
                      style: const TextStyle(
                        fontFamily: FontFamily.pretendard,
                        fontSize: 36,
                        fontVariations: [FontVariation.weight(700)],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: imageWidth,
                child: Image(
                  image: AssetImage('assets/images/giant_dragon_fruit.png'),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffCFCFCF),
          height: 1,
          thickness: 1,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}

class _ConditionGroup extends StatelessWidget {
  const _ConditionGroup(
    this.seasonConditionBoxController,
    this.nutrientConditionBoxController,
    this.familyConditionBoxController, {
    required this.borderRadius,
  });

  final SeasonConditionBoxController seasonConditionBoxController;
  final NutrientConditionBoxNotifier nutrientConditionBoxController;
  final FamilyConditionBoxController familyConditionBoxController;

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    const Color unsatisfiedBorderColor = Color(0xffD8D8D8);
    const Color satisfiedBorderColor = Color(0xff34C759);
    const double borderWidth = 1.5;
    const double boxHeight = 64;
    const double textSpacing = 4;
    const double horizontalTextPadding = 12;
    const Color hintTextColor = Color(0xff767676);
    const double hintTextSize = 13;
    const double mainTextSize = 15;
    const Color unsatisfiedBoxColor = Colors.white;
    const Color satisfiedBoxColor = Color(0xffECFFF1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SeasonConditionBox(
          unsatisfiedBorderColor: unsatisfiedBorderColor,
          satisfiedBorderColor: satisfiedBorderColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          boxHeight: boxHeight,
          horizontalTextPadding: horizontalTextPadding,
          textSpacing: textSpacing,
          mainTextSize: mainTextSize,
          hintTextSize: hintTextSize,
          hintTextColor: hintTextColor,
          unsatisfiedBoxColor: unsatisfiedBoxColor,
          satisfiedBoxColor: satisfiedBoxColor,
          controller: seasonConditionBoxController,
        ),
        NutrientConditionBox(
          unsatisfiedBorderColor: unsatisfiedBorderColor,
          satisfiedBorderColor: satisfiedBorderColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          boxHeight: boxHeight,
          horizontalTextPadding: horizontalTextPadding,
          textSpacing: textSpacing,
          mainTextSize: mainTextSize,
          hintTextSize: hintTextSize,
          secondaryTextColor: hintTextColor,
          unsatisfiedBoxColor: unsatisfiedBoxColor,
          satisfiedBoxColor: satisfiedBoxColor,
          viewModel: nutrientConditionBoxController,
        ),
        FamilyConditionBox(
          unsatisfiedBorderColor: unsatisfiedBorderColor,
          satisfiedBorderColor: satisfiedBorderColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          boxHeight: boxHeight,
          horizontalTextPadding: horizontalTextPadding,
          textSpacing: textSpacing,
          mainTextSize: mainTextSize,
          hintTextSize: hintTextSize,
          hintTextColor: hintTextColor,
          unsatisfiedBoxColor: unsatisfiedBoxColor,
          satisfiedBoxColor: satisfiedBoxColor,
          controller: familyConditionBoxController,
        ),
      ],
    );
  }
}
