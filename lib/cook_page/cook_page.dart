import 'package:dst_helper/cook_page/recipe_card.dart';
import 'package:dst_helper/cook_page/recipe_list_item.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  static List<Recipe> recipes = [
    Recipes.meatballs,
    Recipes.creamyPotatoPuree,
    Recipes.fancySpiralledTubers,
    Recipes.veggieBurger,
    Recipes.honeyHam,
    Recipes.iceCream,
    Recipes.jellySalad,
    Recipes.kabobs,
    Recipes.pierogi,
    Recipes.salsaFresca,
    Recipes.vegetableStinger,
    Recipes.taffy,
    Recipes.baconAndEggs,
    Recipes.figatoni,
    Recipes.figkabab,
    Recipes.soothingTea,
    Recipes.trailMix,
  ];

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
                padding: const EdgeInsets.only(top: 36, left: 56, right: 56, bottom: 36),
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  children: [
                    ...Recipes.recipes.map((recipe) => RecipeCard(recipe: recipe)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 480,
            // height: 830,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(-2, 4),
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 24),
              itemCount: recipes.length,
              itemBuilder: (context, index) => RecipeListItem(recipe: recipes[index]),
              separatorBuilder: (context, index) => const Divider(color: Color(0xffBEBEBE)),
            ),
          ),
        ],
      ),
    );
  }
}
