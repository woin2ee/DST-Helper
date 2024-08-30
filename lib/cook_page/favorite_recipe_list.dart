import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:flutter/material.dart';

class FavoriteRecipeList extends StatefulWidget {
  const FavoriteRecipeList({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteRecipeListState();
}

class _FavoriteRecipeListState extends State<FavoriteRecipeList> {
  List<RecipeObject> recipes = [
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
    final theme = Theme.of(context);
    const double listWidth = 340.0;
    return Container(
      constraints: const BoxConstraints(maxWidth: listWidth),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: listWidth,
            child: ListView(
              children: [
                ...recipes.asMap().entries.map((entry) => Container(
                      color: entry.key.isEven
                          ? theme.colorScheme.surfaceContainerLow
                          : theme.colorScheme.surfaceContainerHighest,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 4),
                              child: Image.asset(
                                'assets/images/items/${entry.value.assetName}.png',
                                width: 60,
                                height: 60,
                              ),
                            ),
                            ...entry.value.ingredientListAssetNames.map((assetName) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(border: Border.all()),
                                    child: Image.asset(
                                      'assets/images/items/$assetName.png',
                                      width: 45,
                                      height: 45,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
