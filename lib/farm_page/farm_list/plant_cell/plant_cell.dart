import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

import 'plant_cell_model.dart';

export 'plant_cell_model.dart';

typedef PlantCallBack = Plant? Function();

class PlantCell extends StatelessWidget {
  PlantCell({
    super.key,
    this.onPressed,
    PlantCellModel? model,
  }) : model = model ?? PlantCellModel(plant: null);

  final PlantCallBack? onPressed;
  final PlantCellModel model;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Flexible(
      fit: FlexFit.tight,
      child: ListenableBuilder(
        listenable: model,
        builder: (BuildContext context, Widget? child) {
          return Container(
            margin: const EdgeInsets.all(1),
            color: model.darkTheme ? colorScheme.surfaceContainerHighest.dark : colorScheme.surfaceContainerHighest,
            child: IconButton(
              onPressed: onPressed == null ? null : () => model.plant = onPressed?.call(),
              icon: plantImageOf(model.plant),
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(6.0),
                shape: const RoundedRectangleBorder(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget plantImageOf(Plant? plant) {
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
