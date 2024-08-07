import 'package:dst_helper/models/recipes.dart';
import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 16,
      ),
      children: [
        ...Recipes.recipes.map(
          (recipe) => Image.asset(
            'items/${recipe.assetName}.png',
            errorBuilder: (context, error, stackTrace) => Text(recipe.name),
          ),
        ),
      ],
    );
  }
}
