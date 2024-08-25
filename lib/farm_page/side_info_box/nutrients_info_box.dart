import 'package:dst_helper/models/dst_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NutrientsInfoBox extends StatelessWidget {
  const NutrientsInfoBox({super.key});

  final double horizontalSpacing = 4;
  final double imageWidth = 40;
  final double amountWidth = 70;

  @override
  Widget build(BuildContext context) {
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
      ],
    );
    final nutrientsImageRow = SizedBox(
      height: 34,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
    return FittedBox(
      child: Column(
        children: [
          nutrientsImageRow,
          nutrientsNameRow,
          Column(
            spacing: 4,
            children: <Widget>[
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
                                    color: nutrient > 0 ? Colors.green : Colors.red,
                                  ),
                                ),
                              )),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class NutrientsInfoBoxTag extends StatelessWidget {
  const NutrientsInfoBoxTag({
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
