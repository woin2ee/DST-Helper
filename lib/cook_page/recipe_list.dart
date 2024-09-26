import 'package:dst_helper/cook_page/recipe_list_item.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final List<Recipe> _recipes = [
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
    return DragTarget<Recipe>(
      onAcceptWithDetails: (details) {
        if (_recipes.contains(details.data)) return;
        setState(() {
          _recipes.add(details.data);
        });
      },
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          width: 410,
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
            itemCount: _recipes.length,
            itemBuilder: (context, index) => FittedBox(child: RecipeListItem(recipe: _recipes[index])),
            separatorBuilder: (context, index) => const Divider(color: Color(0xffBEBEBE)),
          ),
        );
      },
    );
  }
}
