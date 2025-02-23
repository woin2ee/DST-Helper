import 'package:flutter/material.dart';

import '../l10n/l10ns.dart';
import '../models/v2/item/categories.dart';
import '../models/v2/status_value.dart';
import '../utils/etc.dart';
import '../utils/font_family.dart';

enum RecipeCardMode {
  basic,
  detail,
  simple,
  onlyImage;

  String get name {
    switch (this) {
      case RecipeCardMode.basic:
        return 'Basic';
      case RecipeCardMode.detail:
        return 'Detail';
      case RecipeCardMode.simple:
        return 'Simple';
      case RecipeCardMode.onlyImage:
        return 'Image';
    }
  }
}

class DefaultRecipeCard extends StatelessWidget {
  const DefaultRecipeCard({
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
      feedback: DraggingRecipeImage(assetName: recipe.assetName),
      child: _DefaultRecipeCardDropShadowedContainer(
        width: width,
        padding: const EdgeInsets.only(top: vPadding, left: hPadding, right: hPadding, bottom: vPadding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: <Widget>[
            _DefaultRecipeCardTitleBox(L10ns.of(context).localized('${recipe.code}_name').untruncatedKoreanByNewline),
            Image.asset(
              'assets/images/items/${recipe.assetName}.png',
              width: imageSize,
              height: imageSize,
            ),
            _DefaultRecipeCardStatusBox(recipe: recipe),
          ],
        ),
      ),
    );
  }
}

class _DefaultRecipeCardDropShadowedContainer extends StatelessWidget {
  const _DefaultRecipeCardDropShadowedContainer({
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

class _DefaultRecipeCardTitleBox extends StatelessWidget {
  const _DefaultRecipeCardTitleBox(
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

class _DefaultRecipeCardStatusBox extends StatelessWidget {
  const _DefaultRecipeCardStatusBox({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: <Widget>[
        _StatusPair(
          statusKey: _StatusKey.hunger,
          statusValue: recipe.hungerValue,
        ),
        _StatusPair(
          statusKey: _StatusKey.health,
          statusValue: recipe.healthValue,
        ),
        _StatusPair(
          statusKey: _StatusKey.sanity,
          statusValue: recipe.sanityValue,
        ),
      ],
    );
  }
}

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
      child: _DetailRecipeCardDropShadowedContainer(
        width: width,
        padding: const EdgeInsets.all(padding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: <Widget>[
            _DetailRecipeCardTitleBox(L10ns.of(context).localized('${recipe.code}_name').untruncatedKoreanByNewline),
            Image.asset(
              'assets/images/items/${recipe.assetName}.png',
              width: imageSize,
              height: imageSize,
            ),
            _DetailRecipeCardStatusBox(recipe: recipe),
          ],
        ),
      ),
    );
  }
}

class _DetailRecipeCardDropShadowedContainer extends StatelessWidget {
  const _DetailRecipeCardDropShadowedContainer({
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

class _DetailRecipeCardTitleBox extends StatelessWidget {
  const _DetailRecipeCardTitleBox(
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

class _DetailRecipeCardStatusBox extends StatelessWidget {
  const _DetailRecipeCardStatusBox({
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
            _StatusPair(
              statusKey: _StatusKey.hunger,
              statusValue: recipe.hungerValue,
            ),
            _StatusPair(
              statusKey: _StatusKey.health,
              statusValue: recipe.healthValue,
            ),
            _StatusPair(
              statusKey: _StatusKey.sanity,
              statusValue: recipe.sanityValue,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: vSpacing,
          children: [
            _StatusPair(
              statusKey: _StatusKey.perish,
              statusValue: recipe.maxPerishTimeValue,
            ),
            _StatusPair(
              statusKey: _StatusKey.cook,
              statusValue: recipe.cookTimeValue,
            ),
            _StatusPair(
              statusKey: _StatusKey.priority,
              statusValue: NumericStatusValue(recipe.priority.toDouble()),
            ),
          ],
        ),
      ],
    );
  }
}

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
      feedback: DraggingRecipeImage(assetName: recipe.assetName),
      child: _OnlyImageRecipeCardDropShadowedContainer(
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

class _OnlyImageRecipeCardDropShadowedContainer extends StatelessWidget {
  const _OnlyImageRecipeCardDropShadowedContainer({
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
      child: _SimpleRecipeCardDropShadowedContainer(
        width: width,
        padding: const EdgeInsets.all(padding),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: <Widget>[
            _SimpleRecipeCardTitleBox(L10ns.of(context).localized('${recipe.code}_name').untruncatedKoreanByNewline),
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

class _SimpleRecipeCardDropShadowedContainer extends StatelessWidget {
  const _SimpleRecipeCardDropShadowedContainer({
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

class _SimpleRecipeCardTitleBox extends StatelessWidget {
  const _SimpleRecipeCardTitleBox(
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

class DraggingRecipeImage extends StatelessWidget {
  const DraggingRecipeImage({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.75, -0.75),
      child: Opacity(
        opacity: 0.85,
        child: Image(
          image: AssetImage('assets/images/items/$assetName.png'),
        ),
      ),
    );
  }
}

enum _StatusKey {
  hunger,
  health,
  sanity,
  perish,
  cook,
  priority;

  String get symbolName {
    switch (this) {
      case _StatusKey.hunger:
        return 'hunger_meter';
      case _StatusKey.health:
        return 'health_meter';
      case _StatusKey.sanity:
        return 'sanity_meter';
      case _StatusKey.perish:
        return 'rot';
      case _StatusKey.cook:
        return 'crock_pot';
      case _StatusKey.priority:
        return 'priority';
    }
  }
}

class _StatusPair extends StatelessWidget {
  const _StatusPair({
    required this.statusKey,
    required this.statusValue,
  });

  final _StatusKey statusKey;
  final StatusValue statusValue;

  static const double imageSize = 20;
  static const double spacing = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: [
        Image.asset(
          'assets/images/${statusKey.symbolName}.png',
          width: imageSize,
          height: imageSize,
        ),
        _StatusValueBox(statusValue: statusValue),
      ],
    );
  }
}

class _StatusValueBox extends StatelessWidget {
  const _StatusValueBox({
    required this.statusValue,
  });

  final StatusValue statusValue;

  static const double width = 52;
  static const textStyle = TextStyle(
    fontFamily: FontFamily.pretendard,
    fontSize: 13,
    color: Colors.black,
  );
  static const double tooltipIconSize = 16;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _buildContent(statusValue),
    );
  }

  Widget _buildContent(StatusValue statusValue) {
    if (statusValue is DurationStatusValue) {
      return Tooltip(
        message: statusValue.verbose(),
        textStyle: const TextStyle(
          fontFamily: FontFamily.pretendard,
          fontSize: 12,
          color: Colors.white,
        ),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        verticalOffset: 8,
        margin: const EdgeInsets.only(left: 132),
        padding: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 4),
        enableTapToDismiss: false,
        preferBelow: false,
        showDuration: const Duration(),
        exitDuration: const Duration(),
        child: Center(
          child: Row(
            spacing: 2,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusValue.toString(),
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: tooltipIconSize,
                height: tooltipIconSize,
                child: FittedBox(
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: Color(0xff444444),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Text(
        statusValue.toString(),
        style: textStyle,
        textAlign: TextAlign.center,
      );
    }
  }
}
