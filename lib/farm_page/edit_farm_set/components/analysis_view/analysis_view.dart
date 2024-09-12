import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/family_condition_box.dart';
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
          child: const Card(
            color: Color(0xffFAFAFA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                side: BorderSide(
                  color: Color(0xffCECECE),
                  width: 1,
                )),
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 21, left: 12.7, right: 12.7, bottom: 15),
              child: Column(
                spacing: 19,
                children: [
                  _Title(),
                  _ConditionGroup(),
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
  const _ConditionGroup();

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0xffD8D8D8);
    const double borderWidth = 1.5;
    final BorderRadius borderRadius = BorderRadius.circular(12);
    const double boxHeight = 64;
    const double textSpacing = 4;
    const double horizontalTextPadding = 12;
    const Color hintTextColor = Color(0xff767676);
    const double hintTextSize = 13;
    const double mainTextSize = 15;
    const Color boxColor = Colors.white;

    final familyConditionBoxController = FamilyConditionBoxController();
    
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SeasonConditionBox(
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            boxHeight: boxHeight,
            horizontalTextPadding: horizontalTextPadding,
            textSpacing: textSpacing,
            mainTextSize: mainTextSize,
            hintTextSize: hintTextSize,
            hintTextColor: hintTextColor,
            boxColor: boxColor,
          ),
          _NutrientConditionBox(
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            boxHeight: boxHeight,
            horizontalTextPadding: horizontalTextPadding,
            textSpacing: textSpacing,
            mainTextSize: mainTextSize,
            hintTextSize: hintTextSize,
            hintTextColor: hintTextColor,
            boxColor: boxColor,
          ),
          FamilyConditionBox(
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            boxHeight: boxHeight,
            horizontalTextPadding: horizontalTextPadding,
            textSpacing: textSpacing,
            mainTextSize: mainTextSize,
            hintTextSize: hintTextSize,
            hintTextColor: hintTextColor,
            boxColor: boxColor,
            controller: familyConditionBoxController,
          ),
        ],
      ),
    );
  }
}

class _SeasonConditionBox extends StatelessWidget {
  const _SeasonConditionBox({
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

class _NutrientConditionBox extends StatelessWidget {
  const _NutrientConditionBox({
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
