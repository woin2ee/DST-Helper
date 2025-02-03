import 'package:dst_helper/cook_page/recipe_card/recipe_card.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 36, left: 56, right: 42, bottom: 36),
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    ...Items.recipes.map((recipe) => SimpleRecipeCard(recipe: recipe)),
                  ],
                ),
              ),
            ),
          ),
          RecipeList(),
        ],
      ),
    );
  }
}
