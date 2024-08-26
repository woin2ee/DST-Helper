import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: const FittedBox(child: Text('Season')),
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
                AppLocalizations.of(context)!.compost,
              ),
            ),
          ),
        ),
        SizedBox(
          width: amountWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                AppLocalizations.of(context)!.growthFormula,
              ),
            ),
          ),
        ),
        SizedBox(
          width: amountWidth,
          child: Center(
            child: FittedBox(
              child: Text(
                AppLocalizations.of(context)!.manure,
              ),
            ),
          ),
        ),
        SizedBox(
          width: seasonWidth,
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
                ...Plants.crops.map((crop) => Row(
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

class CropsInfoBoxTag extends StatelessWidget {
  const CropsInfoBoxTag({
    super.key,
    this.onPressed,
    this.size = const Size(50, 50),
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
        icon: Image.asset("assets/images/nutrients_manure_icon.png"),
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
