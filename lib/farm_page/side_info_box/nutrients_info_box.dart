import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NutrientsInfoBox extends StatelessWidget {
  const NutrientsInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FittedBox(
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 40),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/nutrients_compost_icon.png'),
                      width: 30,
                      height: 30,
                    ),
                    Text('Compost'),
                    // Text(AppLocalizations.of(context)!.compost),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/nutrients_growth_formula_icon.png'),
                      width: 30,
                      height: 30,
                    ),
                    Text('Growth Formula'),
                    // Text(AppLocalizations.of(context)!.growthFormula),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/nutrients_manure_icon.png'),
                      width: 30,
                      height: 30,
                    ),
                    Text('Manure'),
                    // Text(AppLocalizations.of(context)!.manure),
                  ],
                ),
              ],
            ),
            ...Plants.crops.map((crop) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image(
                        image: AssetImage('assets/images/items/${crop.assetName}.png'),
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 30),
                    Row(
                      spacing: 80,
                      children: [
                        Text(
                          crop.nutrient.compost > 0
                              ? '+${crop.nutrient.compost.toString()}'
                              : crop.nutrient.compost.toString(),
                          style: TextStyle(
                            color: crop.nutrient.compost > 0 ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                          crop.nutrient.growthFormula > 0
                              ? '+${crop.nutrient.growthFormula.toString()}'
                              : crop.nutrient.growthFormula.toString(),
                          style: TextStyle(
                            color: crop.nutrient.growthFormula > 0 ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                          crop.nutrient.manure > 0
                              ? '+${crop.nutrient.manure.toString()}'
                              : crop.nutrient.manure.toString(),
                          style: TextStyle(
                            color: crop.nutrient.manure > 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
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
