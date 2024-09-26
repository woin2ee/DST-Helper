import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/categories_extension.dart';
import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    const double recipeFrameSize = 80;
    const double recipeImageSize = 64;
    const double ingredientFrameSize = 62;
    const double ingredientImageSize = 50;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/frame_1.png'),
              fit: BoxFit.fill,
              width: recipeFrameSize,
              height: recipeFrameSize,
            ),
            Image(
              image: AssetImage('assets/images/items/${recipe.assetName}.png'),
              fit: BoxFit.fill,
              width: recipeImageSize,
              height: recipeImageSize,
            ),
          ],
        ),
        Row(
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
            // ),
          ],
        ),
      ],
    );
  }
}
