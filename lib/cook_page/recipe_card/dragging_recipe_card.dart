import 'package:flutter/material.dart';

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
