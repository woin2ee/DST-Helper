import 'package:dst_helper/cook_page/recipe_card/status_pair.dart';
import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/utils/etc.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  static const double width = 134;
  static const double imageSize = 64;
  static const double spacing = 8;
  static const double hPadding = 8;
  static const double vPadding = 12;

  @override
  Widget build(BuildContext context) {
    return Draggable<Recipe>(
      data: recipe,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingRecipeCard(imageAssetName: recipe.assetName),
      child: _DropShadowedContainer(
        width: width,
        padding: const EdgeInsets.only(top: vPadding, left: hPadding, right: hPadding, bottom: vPadding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: <Widget>[
            _TitleBox(keepKoreanWord(L10ns.of(context).localized('${recipe.code}_name'))),
            Image.asset(
              'assets/images/items/${recipe.assetName}.png',
              width: imageSize,
              height: imageSize,
            ),
            _StatusBox(recipe: recipe),
          ],
        ),
      ),
    );
  }
}

class DraggingRecipeCard extends StatelessWidget {
  const DraggingRecipeCard({
    super.key,
    required this.imageAssetName,
  });

  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.75, -0.75),
      child: Opacity(
        opacity: 0.85,
        child: Image(
            image: AssetImage(
          'assets/images/items/$imageAssetName.png',
        )),
      ),
    );
  }
}

class _DropShadowedContainer extends StatelessWidget {
  const _DropShadowedContainer({
    this.width,
    this.padding,
    this.borderRadius,
    required this.child,
  });

  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  static const ambientShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 7,
    offset: Offset(0, 1),
  );
  static const keyShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 3,
    offset: Offset(0, 3),
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
      width: width,
      child: child,
    );
  }
}

class _TitleBox extends StatelessWidget {
  const _TitleBox(
    this.title,
  );

  final String title;

  static const double fontSize = 15;
  static const double lineHeight = 18;
  static const int maxLines = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: lineHeight * maxLines,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: FontFamily.pretendard,
            fontVariations: [FontVariation.weight(500)],
            fontSize: fontSize,
            color: Colors.black,
            height: lineHeight / fontSize,
          ),
          maxLines: maxLines,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _StatusBox extends StatelessWidget {
  const _StatusBox({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: <Widget>[
        StatusPair(
          statusKey: StatusKey.hunger,
          statusValue: recipe.hungerValue,
        ),
        StatusPair(
          statusKey: StatusKey.health,
          statusValue: recipe.healthValue,
        ),
        StatusPair(
          statusKey: StatusKey.sanity,
          statusValue: recipe.sanityValue,
        ),
      ],
    );
  }
}
