import 'package:dst_helper/models/plants.dart';
import 'package:dst_helper/models/recipe.dart';
import 'package:dst_helper/models/recipes.dart';
import 'package:flutter/widgets.dart';

class FavoriteRecipesWidget extends StatefulWidget {
  const FavoriteRecipesWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteRecipesWidgetState();
}

class _FavoriteRecipesWidgetState extends State<FavoriteRecipesWidget> {
  List<Recipe> recipes = [
    const Meatballs(),
    const MashedPotatoes(),
    const FancySpiralledTubers(),
    const VeggieBurger(),
    const HoneyHam(),
    const IceCream(),
    const JellySalad(),
    const Kabobs(),
    const Pierogi(),
    const SalsaFresca(),
    const VegetableStinger(),
    const Taffy(),
    const BaconAndEggs(),
    const Figatoni(),
    const Figkabab(),
    const SoothingTea(),
    const TrailMix(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...recipes.map((recipe) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
                children: [
                  Image.asset(
                    'items/${recipe.assetName}.png',
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(width: 30),
                  ...recipe.ingredientListAssetNames.map((assetName) => Image.asset(
                        'items/$assetName.png',
                        width: 40,
                        height: 40,
                      )),
                ],
              ),
        )),
      ],
    );
  }
}
