import 'package:flutter/material.dart';

import '../../models/v2/item/categories.dart';
import '../../models/v2/item/categories_extension.dart';
import 'recipe_list_notifier.dart';

class DraggableRecipeListItem extends StatelessWidget {
  const DraggableRecipeListItem({
    super.key,
    required this.recipe,
    required this.recipeListWidgetKey,
    required this.recipeListNotifier,
  });

  final Recipe recipe;
  final GlobalKey recipeListWidgetKey;
  final RecipeListNotifier recipeListNotifier;

  @override
  Widget build(BuildContext context) {
    const Offset draggingOffset = Offset(40, 40);

    return Draggable(
      dragAnchorStrategy: (draggable, context, position) => draggingOffset,
      onDragEnd: (details) {
        final globalPoint = details.offset;
        final recipeListBox = _getRecipeListRenderBox();
        if (!recipeListBox.contains(globalPoint + draggingOffset)) {
          recipeListNotifier.removeRecipe(recipe);
        }
      },
      feedback: Opacity(
        opacity: 0.85,
        child: Image(
          image: AssetImage('assets/images/items/${recipe.assetName}.png'),
          width: _RecipeListItemImage.recipeFrameSize,
          height: _RecipeListItemImage.recipeFrameSize,
        ),
      ),
      hitTestBehavior: HitTestBehavior.opaque,
      child: _RecipeListItem(recipe: recipe),
    );
  }

  Rect _getRecipeListRenderBox() {
    final renderBox = recipeListWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return Rect.zero;
    }
    final globalOffset = renderBox.localToGlobal(Offset.zero);
    return globalOffset & renderBox.size;
  }
}

class _RecipeListItem extends StatelessWidget {
  const _RecipeListItem({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _RecipeListItemImage(assetName: recipe.assetName),
          _RecipeListItemIngredients(recipe: recipe),
        ],
      ),
    );
  }
}

class _RecipeListItemImage extends StatelessWidget {
  const _RecipeListItemImage({
    required this.assetName,
  });

  final String assetName;

  static const double recipeFrameSize = 70;
  static const double recipeImageSize = 56;

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

  static const double ingredientFrameSize = 56;
  static const double ingredientImageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
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
    );
  }
}
