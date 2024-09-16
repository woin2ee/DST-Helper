import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/family_condition_box.dart';
import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/nutrient_condition_box.dart';
import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/season_condition_box.dart';
import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set_controller.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  final EditFarmSetController controller;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller.farmPlantSetModel,
      builder: (context, child) {
        return SizedBox(
          width: width,
          height: height,
          child: Card(
            color: const Color(0xffFAFAFA),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(
                  color: Color(0xffCECECE),
                  width: 1,
                )),
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 21, left: 12.7, right: 12.7, bottom: 15),
              child: Column(
                spacing: 19,
                children: [
                  const _Title(),
                  _ConditionGroup(
                    controller.seasonConditionBoxController,
                    controller.nutrientConditionBoxController,
                    controller.familyConditionBoxController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // return ListenableBuilder(
    //   listenable: controller.farmPlantSetModel,
    //   builder: (context, child) {
    //     return Column(
    //       spacing: 12,
    //       children: [
    //         if (controller.farmPlantSetModel.hasAnyPlant)
    //           Text(
    //             '${TextLocalizations.of(context)!.localized('suitable_seasons')}: ${controller.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}',
    //             style: const TextStyle(
    //               fontFamily: FontFamily.pretendard,
    //             ),
    //           ),
    //         Builder(
    //           builder: (context) {
    //             if (controller.farmPlantSetModel.hasBalancedNutrients && controller.farmPlantSetModel.hasAnyPlant) {
    //               return Text(
    //                 '${TextLocalizations.of(context)!.localized('balanced_nutrients')}!',
    //                 style: const TextStyle(
    //                   fontFamily: FontFamily.pretendard,
    //                 ),
    //               );
    //             }
    //             final countOfFertilizerNeeded = controller.calculateCountOfFertilizerNeeded();
    //             if (countOfFertilizerNeeded != null) {
    //               return Text(
    //                 '영양소 충족! (성장 단계 마다 각 밭에 $countOfFertilizerNeeded번 비료를 줘야합니다.)',
    //                 style: const TextStyle(
    //                   fontFamily: FontFamily.pretendard,
    //                 ),
    //               );
    //             }
    //             return const SizedBox.shrink();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
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
                      TextLocalizations.of(context)!.localized('giant_crop'),
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
    this.familyConditionBoxController,
  );

  final SeasonConditionBoxController seasonConditionBoxController;
  final NutrientConditionBoxController nutrientConditionBoxController;
  final FamilyConditionBoxController familyConditionBoxController;

  @override
  Widget build(BuildContext context) {
    const Color unsatisfiedBorderColor = Color(0xffD8D8D8);
    const Color satisfiedBorderColor = Color(0xff34C759);
    const double borderWidth = 1.5;
    final BorderRadius borderRadius = BorderRadius.circular(12);
    const double boxHeight = 64;
    const double textSpacing = 4;
    const double horizontalTextPadding = 12;
    const Color hintTextColor = Color(0xff767676);
    const double hintTextSize = 13;
    const double mainTextSize = 15;
    const Color unsatisfiedBoxColor = Colors.white;
    const Color satisfiedBoxColor = Color(0xffECFFF1);

    return Expanded(
      child: Column(
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
            controller: nutrientConditionBoxController,
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
      ),
    );
  }
}
