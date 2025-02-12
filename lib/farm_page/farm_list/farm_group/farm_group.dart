import 'package:flutter/material.dart';

import '../farm_plant/farm_view.dart';
import 'farm_group_model.dart';

export 'farm_group_model.dart';

class FarmGroup extends StatelessWidget {
  const FarmGroup({
    super.key,
    required this.model,
    this.onPressed,
  });

  final FarmGroupModel model;
  final VoidCallback Function(int plantIndex) Function(int farmIndex)? onPressed;

  @override
  Widget build(BuildContext context) {
    return switch (model.groupType) {
      FarmGroupType.single => FarmView(
          model: model.farmViewModels[0],
          onPressedByIndex: onPressed?.call(0),
        ),
      FarmGroupType.double => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FarmView(
              model: model.farmViewModels[0],
              onPressedByIndex: onPressed?.call(0),
            ),
            FarmView(
              model: model.farmViewModels[1],
              onPressedByIndex: onPressed?.call(1),
            ),
          ],
        ),
      FarmGroupType.square => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmView(
                  model: model.farmViewModels[0],
                  onPressedByIndex: onPressed?.call(0),
                ),
                FarmView(
                  model: model.farmViewModels[1],
                  onPressedByIndex: onPressed?.call(1),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmView(
                  model: model.farmViewModels[2],
                  onPressedByIndex: onPressed?.call(2),
                ),
                FarmView(
                  model: model.farmViewModels[3],
                  onPressedByIndex: onPressed?.call(3),
                ),
              ],
            ),
          ],
        ),
    };
  }
}
