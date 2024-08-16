import 'package:dst_helper/cook_page/favorite_recipe_list.dart';
import 'package:dst_helper/models/dst_object.dart' show Recipes;
import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12.0),
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[2],
          ),
          child: const FavoriteRecipeList(),
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            children: [
              ...Recipes.recipes.map((recipe) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'items/${recipe.assetName}.png',
                      width: 50,
                      height: 50,
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
