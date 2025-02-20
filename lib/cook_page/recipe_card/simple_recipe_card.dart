import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/categories.dart';
import '../../utils/etc.dart';
import '../../utils/font_family.dart';
import 'dragging_recipe_image.dart';

class SimpleRecipeCard extends StatelessWidget {
  const SimpleRecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  static const double width = 128;
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
    blurRadius: 2,
    offset: Offset(0, 2.2),
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

  static const double lineHeight = 17;
  static const double fontSize = 14;
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
