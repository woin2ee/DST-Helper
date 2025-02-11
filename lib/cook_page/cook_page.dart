import 'package:flutter/material.dart';

import '../models/v2/item/item.dart';
import 'recipe_card_table.dart';
import 'recipe_list/recipe_list.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _prefetchImagesToNeed(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        spacing: 10,
        children: [
          const Expanded(
            child: RecipeCardTable(),
          ),
          RecipeList(),
        ],
      ),
    );
  }

  void _prefetchImagesToNeed(BuildContext context) {
    precacheImage(const AssetImage('assets/images/frame_1.png'), context);
    precacheImage(const AssetImage('assets/images/frame_2_thick.png'), context);

    for (final ingredient in Items.ingredients) {
      _prefetchIngredientImage(ingredient, context);
    }

    for (final category in FoodValueCategory.values) {
      precacheImage(AssetImage('assets/images/items/${category.assetName}.png'), context);
    }
  }

  void _prefetchIngredientImage(Item ingredient, BuildContext context) {
    if (ingredient is CookableFood) {
      precacheImage(
        AssetImage('assets/images/items/${ingredient.compositeAssetName}.png'),
        context,
      );
      return;
    }
    precacheImage(
      AssetImage('assets/images/items/${ingredient.assetName}.png'),
      context,
    );
  }
}
