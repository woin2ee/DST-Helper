import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        return AppLocalizations.of(context)!.compost;
      case _NutrientType.growthFormula:
        return AppLocalizations.of(context)!.growthFormula;
      case _NutrientType.manure:
        return AppLocalizations.of(context)!.manure;
      case _NutrientType.mix:
        return AppLocalizations.of(context)!.mix;
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

class FertilizerInfoBox extends StatelessWidget {
  const FertilizerInfoBox({
    super.key,
    required this.color,
  });

  final Color color;
  final List<(_NutrientType, List<FertilizerObject>)> _nutrientList = const [
    (_NutrientType.compost, Fertilizers.compostList),
    (_NutrientType.growthFormula, Fertilizers.growthFormulaList),
    (_NutrientType.manure, Fertilizers.manureList),
    (_NutrientType.mix, Fertilizers.mixList),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        boxShadow: kElevationToShadow[2],
      ),
      child: FittedBox(
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            color: Colors.white30,
            tiles: [
              ..._nutrientList.map((nutrient) => Padding(
                    padding: const EdgeInsets.only(top: 12.0),
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
                                          fertilizer.localizedName(context),
                                          style: const TextStyle(
                                            fontSize: 13,
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
      ),
    );
  }

  TextSpan _nutrientAmountText(FertilizerObject fertilizer, {required _NutrientType type}) {
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
        if (fertilizer is GrowthFormulaStarter) {
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

class FertilizerInfoBoxTag extends StatelessWidget {
  const FertilizerInfoBoxTag({
    super.key,
    this.onPressed,
    required this.size,
    required this.color,
  });

  final Color color;
  final Size size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child: IconButton(
        padding: const EdgeInsets.only(top: 4, bottom: 2),
        onPressed: onPressed,
        icon: Image.asset("assets/images/items/${const Fertilizer().assetName}.png"),
      ),
    );
  }
}
