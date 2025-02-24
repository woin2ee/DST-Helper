import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v1/season.dart';
import '../../models/v2/item/item.dart';
import '../../utils/font_family.dart';

class CropsInfoBox extends StatelessWidget {
  const CropsInfoBox({super.key});

  static const double horizontalSpacing = 4;
  static const double imageWidth = 40;
  static const double amountWidth = 70;
  static const double seasonWidth = 50;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          const _Header(),
          Column(
            spacing: 2,
            children: ListTile.divideTiles(
              context: context,
              color: Colors.grey.shade300,
              tiles: <Widget>[
                ...Items.crops.map((crop) => Row(
                      spacing: horizontalSpacing,
                      children: [
                        Image(
                          image: AssetImage('assets/images/items/${crop.assetName}.png'),
                          width: imageWidth,
                        ),
                        ...[crop.nutrient.compost, crop.nutrient.growthFormula, crop.nutrient.manure]
                            .map((nutrient) => SizedBox(
                                  width: amountWidth,
                                  child: Text(
                                    nutrient > 0 ? '+${nutrient.toString()}' : nutrient.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontFamily.pretendard,
                                      fontVariations: const [FontVariation.weight(550)],
                                      fontSize: 15,
                                      color: nutrient > 0 ? Colors.green.shade700 : Colors.red,
                                    ),
                                  ),
                                )),
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: seasonWidth,
                          height: seasonWidth,
                          child: _SeasonColumn(seasonSet: crop.seasons),
                        ),
                      ],
                    )),
              ],
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  final _textStyle = const TextStyle(
    fontFamily: FontFamily.pretendard,
    fontSize: 12,
  );

  static const double _imageSize = 30;
  static const double _textHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: CropsInfoBox.imageWidth),
      child: Column(
        children: [
          const SizedBox(
            height: _imageSize,
            child: Row(
              spacing: CropsInfoBox.horizontalSpacing,
              children: [
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: Image(
                    image: AssetImage('assets/images/nutrients_compost_icon.png'),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: Image(
                    image: AssetImage('assets/images/nutrients_growth_formula_icon.png'),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: Image(
                    image: AssetImage('assets/images/nutrients_manure_icon.png'),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.seasonWidth,
                  child: Image(
                    image: AssetImage('assets/images/season_table.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _textHeight,
            child: Row(
              spacing: CropsInfoBox.horizontalSpacing,
              children: [
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      L10ns.of(context).localized('compost'),
                      style: _textStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      L10ns.of(context).localized('growthFormula'),
                      style: _textStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.amountWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      L10ns.of(context).localized('manure'),
                      style: _textStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: CropsInfoBox.seasonWidth,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      L10ns.of(context).localized('season'),
                      style: _textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // f() {
  //   SizedBox(
  //     width: amountWidth,
  //     child: const Image(image: AssetImage('assets/images/nutrients_compost_icon.png')),
  //   );;,
  //   SizedBox(
  //     width: amountWidth,
  //     child: const Image(image: AssetImage('assets/images/nutrients_growth_formula_icon.png')),
  //   );,
  //   SizedBox(
  //     width: amountWidth,
  //     child: const Image(image: AssetImage('assets/images/nutrients_manure_icon.png')),
  //   );,
  //   SizedBox(
  //     width: seasonWidth,
  //     child: const Image(image: AssetImage('assets/images/season_table.png')),
  //   );,
  // }

  // l() {
  //   SizedBox(
  //     width: amountWidth,
  //     child: Center(
  //       child: FittedBox(
  //         child: Text(
  //           L10ns.of(context).localized('compost'),
  //           style: const TextStyle(
  //             fontFamily: FontFamily.pretendard,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );,
  //   SizedBox(
  //     width: amountWidth,
  //     child: Center(
  //       child: FittedBox(
  //         child: Text(
  //           L10ns.of(context).localized('growthFormula'),
  //           style: const TextStyle(
  //             fontFamily: FontFamily.pretendard,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );,
  //   SizedBox(
  //     width: amountWidth,
  //     child: Center(
  //       child: FittedBox(
  //         child: Text(
  //           L10ns.of(context).localized('manure'),
  //           style: const TextStyle(
  //             fontFamily: FontFamily.pretendard,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );,
  //   SizedBox(
  //     width: seasonWidth,
  //     child: Center(
  //       child: FittedBox(
  //         child: Text(
  //           L10ns.of(context).localized('season'),
  //           style: const TextStyle(
  //             fontFamily: FontFamily.pretendard,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );,
  // }
}

class _SeasonColumn extends StatelessWidget {
  const _SeasonColumn({
    required this.seasonSet,
  });

  final Set<Season> seasonSet;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: seasonSet.contains(Season.summer) ? Season.summer.personalColor : Colors.transparent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: seasonSet.contains(Season.autumn) ? Season.autumn.personalColor : Colors.transparent,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: seasonSet.contains(Season.spring) ? Season.spring.personalColor : Colors.transparent,
                  width: 50,
                  height: 50,
                ),
                Container(
                  color: seasonSet.contains(Season.winter) ? Season.winter.personalColor : Colors.transparent,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
