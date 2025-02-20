import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/categories.dart';
import '../../models/v2/status_value.dart';
import '../../utils/etc.dart';
import '../../utils/font_family.dart';
import 'dragging_recipe_image.dart';
import 'status_pair.dart';

class DetailRecipeCard extends StatelessWidget {
  const DetailRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  static const double width = 186;
  static const double imageSize = 64;
  static const double spacing = 8;
  static const double padding = 12;

  @override
  Widget build(BuildContext context) {
    return Draggable<Recipe>(
      data: recipe,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingRecipeImage(assetName: recipe.assetName),
      child: _DropShadowedContainer(
        width: width,
        padding: const EdgeInsets.all(padding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: <Widget>[
            _TitleBox(L10ns.of(context).localized('${recipe.code}_name').untruncatedKoreanByNewline),
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

  static const double vSpacing = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: vSpacing,
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
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: vSpacing,
          children: [
            StatusPair(
              statusKey: StatusKey.perish,
              statusValue: recipe.maxPerishTimeValue,
            ),
            StatusPair(
              statusKey: StatusKey.cook,
              statusValue: recipe.cookTimeValue,
            ),
            StatusPair(
              statusKey: StatusKey.priority,
              statusValue: NumericStatusValue(recipe.priority.toDouble()),
            ),
          ],
        ),
      ],
    );
  }
}
