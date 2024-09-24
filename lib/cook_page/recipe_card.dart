import 'package:dst_helper/models/v2/item/categories.dart';
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
    return Container(
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
            _buildTitle(),
            Image.asset(
              'assets/images/items/${recipe.assetName}.png',
              width: 64,
              height: 64,
            ),
            _buildStatus(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    const double titleTextFontSize = 15;
    const double titleTextPhysicalSize = 18;
    const int titleTextMaxLines = 2;

    return SizedBox(
      height: titleTextPhysicalSize * titleTextMaxLines,
      child: Center(
        child: Text(
          recipe.code,
          // L10ns.of(context).localized(recipe.code),
          // '무화과 개구리 샌드위치',
          // _keepWord('무화과 개구리 샌드위치'),
          // _keepWord('Fancy Spiralled Tubers'),
          // 'Fancy Spiralled Tubers',
          // 'Stuffed Pepper Poppers',
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

  Widget _buildStatus() {
    const double imageSize = 20;
    const valueTextStyle = TextStyle(
      fontFamily: FontFamily.pretendard,
      fontSize: 13,
      color: Colors.black,
    );
    const double valueTextWidth = 40;

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
              child: Text(
                recipe.hungerValue.toString(),
                style: valueTextStyle,
                textAlign: TextAlign.center,
              ),
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
              child: Text(
                recipe.healthValue.toString(),
                style: valueTextStyle,
                textAlign: TextAlign.center,
              ),
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
              child: Text(
                recipe.sanityValue.toString(),
                style: valueTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
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
