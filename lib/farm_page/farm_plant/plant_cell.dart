import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:flutter/material.dart';

class PlantCell extends StatelessWidget {
  const PlantCell({
    super.key,
    required this.plant,
    this.darkTheme = false,
    this.onPressed,
  });

  final PlantObject? plant;
  final bool darkTheme;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.all(1),
        color: darkTheme ? colorScheme.surfaceContainerHighest.dark : colorScheme.surfaceContainerHighest,
        child: onPressed == null
            ? Padding(
                padding: const EdgeInsets.all(6.0),
                child: plantImageOf(plant),
              )
            : IconButton(
                onPressed: onPressed,
                icon: plantImageOf(plant),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(6.0),
                  shape: const RoundedRectangleBorder(),
                ),
              ),
      ),
    );
  }

  Widget plantImageOf(PlantObject? plant) {
    return plant != null
        ? Image.asset('assets/images/items/${plant.assetName}.png')
        : const AspectRatio(aspectRatio: 1);
  }
}

extension on Color {
  Color get dark {
    const darkValue = -55;
    return Color.fromRGBO(red + darkValue, green + darkValue, blue + darkValue, 1.0);
  }
}
