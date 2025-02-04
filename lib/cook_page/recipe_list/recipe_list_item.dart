import 'package:dst_helper/cook_page/recipe_list/recipe_list_notifier.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/categories_extension.dart';
import 'package:flutter/material.dart';

class DraggableRecipeListItem extends StatelessWidget {
  const DraggableRecipeListItem({
    super.key,
    required this.recipe,
    required this.recipeListKey,
    required this.recipeListNotifier,
  });

  final Recipe recipe;
  final GlobalKey recipeListKey;
  final RecipeListNotifier recipeListNotifier;

  @override
  Widget build(BuildContext context) {
    const Offset draggingOffset = Offset(40, 40);

    return Draggable(
      dragAnchorStrategy: (draggable, context, position) => draggingOffset,
      onDragEnd: (details) {
        final recipeListBox = _recipeListBox();
        if (_isPoint(details.offset + draggingOffset, inside: recipeListBox)) return;
        recipeListNotifier.removeRecipe(recipe);
      },
      feedback: Opacity(
        opacity: 0.85,
        child: this,
      ),
      child: _RecipeListItem(recipe: recipe),
    );
  }

  Rect _recipeListBox() {
    final renderBox = recipeListKey.currentContext?.findRenderObject() as RenderBox;
    final globalOffset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(
      globalOffset.dx,
      globalOffset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
  }

  bool _isPoint(Offset point, {required Rect inside}) {
    return inside.left <= point.dx && point.dx <= inside.right && inside.top <= point.dy && point.dy <= inside.bottom;
  }
}

class _RecipeListItem extends StatelessWidget {
  const _RecipeListItem({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: <Widget>[
        _RecipeListItemImage(assetName: recipe.assetName),
        _RecipeListItemIngredients(recipe: recipe),
      ],
    );
  }
}

class _RecipeListItemImage extends StatelessWidget {
  const _RecipeListItemImage({
    required this.assetName,
  });

  final String assetName;

  static const double recipeFrameSize = 80;
  static const double recipeImageSize = 64;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/frame_1.png'),
          fit: BoxFit.fill,
          width: recipeFrameSize,
          height: recipeFrameSize,
        ),
        Image(
          image: AssetImage('assets/images/items/$assetName.png'),
          fit: BoxFit.fill,
          width: recipeImageSize,
          height: recipeImageSize,
        ),
      ],
    );
  }
}

class _RecipeListItemIngredients extends StatelessWidget {
  const _RecipeListItemIngredients({
    required this.recipe,
  });

  final Recipe recipe;

  static const double ingredientFrameSize = 62;
  static const double ingredientImageSize = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: <Widget>[
            ...recipe.ingredientListAssetNames.map((assetName) => Stack(
                  alignment: Alignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/frame_2_thick.png'),
                      fit: BoxFit.contain,
                      width: ingredientFrameSize,
                      height: ingredientFrameSize,
                    ),
                    Image(
                      image: AssetImage('assets/images/items/$assetName.png'),
                      fit: BoxFit.fill,
                      width: ingredientImageSize,
                      height: ingredientImageSize,
                    ),
                  ],
                )),
          ],
        ),
        // SizedBox(
        //   width: 24,
        //   height: 24,
        //   child: Icon(
        //     Icons.menu_rounded,
        //     color: Color(0xff8F8F8F),
        //   ),
        // ), // For ordering feature
      ],
    );
  }
}
