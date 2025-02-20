import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v1/season.dart';
import '../../models/v2/item/item.dart';
import '../../utils/font_family.dart';

class CropsInfoBox extends StatelessWidget {
  const CropsInfoBox({super.key});

  final double horizontalSpacing = 4;
  final double imageWidth = 40;
  final double amountWidth = 70;
  final double seasonWidth = 50;

  @override
  Widget build(BuildContext context) {
    final nutrientsImageRow = SizedBox(
      height: 30,
      child: Row(
        spacing: horizontalSpacing,
        children: [
          SizedBox(width: imageWidth),
          SizedBox(
            width: amountWidth,
            child: const Image(image: AssetImage('assets/images/nutrients_compost_icon.png')),
          ),
          SizedBox(
            width: amountWidth,
            child: const Image(image: AssetImage('assets/images/nutrients_growth_formula_icon.png')),
          ),
          SizedBox(
            width: amountWidth,
            child: const Image(image: AssetImage('assets/images/nutrients_manure_icon.png')),
          ),
          SizedBox(
            width: seasonWidth,
            child: const Image(image: AssetImage('assets/images/season_table.png')),
          ),
        ],
      ),
    );
    final nutrientsNameRow = Row(
      spacing: horizontalSpacing,
      children: <Widget>[
        SizedBox(width: imageWidth),
        SizedBox(
          width: amountWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                L10ns.of(context).localized('compost'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: amountWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                L10ns.of(context).localized('growthFormula'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: amountWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                L10ns.of(context).localized('manure'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: seasonWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                L10ns.of(context).localized('season'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return FittedBox(
      child: Column(
        children: [
          nutrientsImageRow,
          nutrientsNameRow,
          Column(
            spacing: 2,
            children: ListTile.divideTiles(
              context: context,
              color: Colors.transparent,
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
                          child: SeasonIndicator(seasonSet: crop.seasons),
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

class SeasonIndicator extends StatelessWidget {
  const SeasonIndicator({
    super.key,
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
