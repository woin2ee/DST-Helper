import 'package:flutter/material.dart';

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
