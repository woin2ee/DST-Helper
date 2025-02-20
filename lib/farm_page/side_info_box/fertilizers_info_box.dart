import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/item.dart';
import '../../utils/font_family.dart';

enum _NutrientType {
  /// 퇴비
  compost,

  /// 성장 촉진제
  growthFormula,

  /// 거름
  manure,

  /// 복합
  mix;

  String name(BuildContext context) {
    switch (this) {
      case _NutrientType.compost:
        return L10ns.of(context).localized('compost');
      case _NutrientType.growthFormula:
        return L10ns.of(context).localized('growthFormula');
      case _NutrientType.manure:
        return L10ns.of(context).localized('manure');
      case _NutrientType.mix:
        return L10ns.of(context).localized('mix');
    }
  }

  String get assetName {
    switch (this) {
      case _NutrientType.compost:
        return 'compost_overlay_full';
      case _NutrientType.growthFormula:
        return 'growth_formula_overlay_full';
      case _NutrientType.manure:
        return 'manure_overlay_full';
      case _NutrientType.mix:
        return '';
    }
  }
}

class _NutrientTypeTitle extends StatelessWidget {
  const _NutrientTypeTitle({required this.type});

  final _NutrientType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        spacing: 4.0,
        children: [
          _imageForType(type),
          FittedBox(
            child: Text(
              type.name(context),
              style: const TextStyle(
                fontFamily: FontFamily.pretendard,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageForType(_NutrientType type) {
    switch (type) {
      case _NutrientType.compost:
      case _NutrientType.growthFormula:
      case _NutrientType.manure:
        return Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: OverflowBox(
            maxWidth: 180,
            maxHeight: 180,
            child: Image.asset('assets/images/${type.assetName}.png'),
          ),
        );
      case _NutrientType.mix:
        return Stack(
          alignment: Alignment.center,
          children: [
            _imageForType(_NutrientType.compost),
            _imageForType(_NutrientType.growthFormula),
            _imageForType(_NutrientType.manure),
          ],
        );
    }
  }
}

class FertilizersInfoBox extends StatelessWidget {
  const FertilizersInfoBox({super.key});

  final List<(_NutrientType, List<Fertilizer>)> _nutrientList = const [
    (_NutrientType.compost, Items.compostList),
    (_NutrientType.growthFormula, Items.growthFormulaList),
    (_NutrientType.manure, Items.manureList),
    (_NutrientType.mix, Items.mixList),
  ];

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: ListTile.divideTiles(
          context: context,
          color: Colors.white30,
          tiles: [
            ..._nutrientList.map((nutrient) => Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: _NutrientTypeTitle(type: nutrient.$1),
                      ),
                      ...nutrient.$2.map((fertilizer) => SizedBox(
                            width: 110,
                            height: 100,
                            child: Column(
                              spacing: 6.0,
                              children: [
                                Image.asset(
                                  'assets/images/items/${fertilizer.assetName}.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        L10ns.of(context).localized(fertilizer.code),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: FontFamily.pretendard,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    RichText(text: _nutrientAmountText(fertilizer, type: nutrient.$1)),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
          ],
        ).toList(),
      ),
    );
  }

  TextSpan _nutrientAmountText(Fertilizer fertilizer, {required _NutrientType type}) {
    const compostColor = Colors.yellow;
    const growthFormulaColor = Colors.blueAccent;
    const manureColor = Colors.purple;

    const basicTextStyle = TextStyle(
      fontSize: 13,
      color: Colors.black45,
      fontWeight: FontWeight.w400,
    );

    switch (type) {
      case _NutrientType.compost:
        return TextSpan(
          text: '${fertilizer.nutrient.compost}',
          style: basicTextStyle.copyWith(color: compostColor),
        );
      case _NutrientType.growthFormula:
        if (fertilizer.code == 'soil_amender') {
          return TextSpan(
            text: '8/16/32',
            style: basicTextStyle.copyWith(color: growthFormulaColor),
          );
        }
        return TextSpan(
          text: '${fertilizer.nutrient.growthFormula}',
          style: basicTextStyle.copyWith(color: growthFormulaColor),
        );
      case _NutrientType.manure:
        return TextSpan(
          text: '${fertilizer.nutrient.manure}',
          style: basicTextStyle.copyWith(color: manureColor),
        );
      case _NutrientType.mix:
        return TextSpan(
          children: [
            _nutrientAmountText(fertilizer, type: _NutrientType.compost),
            const TextSpan(text: ' ', style: basicTextStyle),
            _nutrientAmountText(fertilizer, type: _NutrientType.growthFormula),
            const TextSpan(text: ' ', style: basicTextStyle),
            _nutrientAmountText(fertilizer, type: _NutrientType.manure),
          ],
        );
    }
  }
}
