import 'package:dst_helper/cook_page/recipe_card/dragging_recipe_card.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:flutter/material.dart';

class OnlyImageRecipeCard extends StatelessWidget {
  const OnlyImageRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  static const double imageSize = 64;
  static const double padding = 14;

  @override
  Widget build(BuildContext context) {
    return Draggable<Recipe>(
      data: recipe,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingRecipeCard(imageAssetName: recipe.assetName),
      child: _DropShadowedContainer(
        padding: const EdgeInsets.all(padding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Image.asset(
          'assets/images/items/${recipe.assetName}.png',
          width: imageSize,
          height: imageSize,
        ),
      ),
    );
  }
}

class _DropShadowedContainer extends StatelessWidget {
  const _DropShadowedContainer({
    this.padding,
    this.borderRadius,
    required this.child,
  });

  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  static const ambientShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 6,
    offset: Offset(0, 0.5),
  );
  static const keyShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 2,
    offset: Offset(0, 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: const [
          ambientShadow,
          keyShadow,
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}
