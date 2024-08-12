import 'package:dst_helper/cook_page/favorite_recipes_widget.dart';
import 'package:dst_helper/models/plants.dart';
import 'package:dst_helper/models/recipes.dart';
import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 400,
          child: FavoriteRecipesWidget(),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            children: [
              ...Recipes.recipes.map((recipe) => Image.asset(
                    'items/${recipe.assetName}.png',
                    width: 40,
                    height: 40,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
