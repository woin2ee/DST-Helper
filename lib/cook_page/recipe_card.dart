import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/status_value.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Draggable<Recipe>(
      data: recipe,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingRecipeCard(imageAssetName: recipe.assetName),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        width: 134,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              _buildTitle(context),
              Image.asset(
                'assets/images/items/${recipe.assetName}.png',
                width: 64,
                height: 64,
              ),
              _StatusBox(recipe: recipe),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    const double titleTextFontSize = 15;
    const double titleTextPhysicalSize = 18;
    const int titleTextMaxLines = 2;

    return SizedBox(
      height: titleTextPhysicalSize * titleTextMaxLines,
      child: Center(
        child: Text(
          _keepWord(L10ns.of(context).localized('${recipe.code}_name')),
          style: const TextStyle(
            fontFamily: FontFamily.pretendard,
            fontVariations: [FontVariation.weight(500)],
            fontSize: titleTextFontSize,
            color: Colors.black,
            height: titleTextPhysicalSize / titleTextFontSize,
          ),
          maxLines: titleTextMaxLines,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _StatusBox extends StatelessWidget {
  const _StatusBox({required this.recipe});

  final Recipe recipe;

  final double imageSize = 20;
  final double valueTextWidth = 52;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: <Widget>[
            Image.asset(
              'assets/images/hunger_meter.png',
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(
              width: valueTextWidth,
              child: _buildStatusItemValue(recipe.hungerValue, context),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: <Widget>[
            Image.asset(
              'assets/images/health_meter.png',
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(
              width: valueTextWidth,
              child: _buildStatusItemValue(recipe.healthValue, context),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: <Widget>[
            Image.asset(
              'assets/images/sanity_meter.png',
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(
              width: valueTextWidth,
              child: _buildStatusItemValue(recipe.sanityValue, context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusItemValue(StatusValue statusValue, BuildContext context) {
    const valueTextStyle = TextStyle(
      fontFamily: FontFamily.pretendard,
      fontSize: 13,
      color: Colors.black,
    );
    const double iconSize = 16;

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
                style: valueTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: iconSize,
                height: iconSize,
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
        style: valueTextStyle,
        textAlign: TextAlign.center,
      );
    }
  }
}

String _keepWord(String text) {
  final RegExp emoji =
      RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  String fullText = '';
  List<String> words = text.split(' ');
  for (var i = 0; i < words.length; i++) {
    fullText +=
        emoji.hasMatch(words[i]) ? words[i] : words[i].replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D');
    if (i < words.length - 1) fullText += ' ';
  }
  return fullText;
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
