import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_list/plant_cell/plant_cell.dart';
import 'package:flutter/material.dart';

import 'farm_plant_set_model.dart';

export 'farm_plant_set_model.dart';

class FarmPlantSet extends StatelessWidget {
  const FarmPlantSet({
    super.key,
    required this.farmPlantSetModel,
    this.onPressed,
  });

  final FarmPlantSetModel farmPlantSetModel;
  final PlantCallBack Function(int plantIndex) Function(int farmPlantIndex)? onPressed;

// TODO: 구현해야됨!
  // bool get canBecomeGiant {
  //   for (var farmPlant in farmPlants) {
  //     for (var crop in farmPlant.crops) {
  //       if (crop == null) continue;

  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return switch (farmPlantSetModel.farmPlantSetStyle) {
      FarmPlantSetStyle.single => FarmPlant(
          model: farmPlantSetModel.farmPlantModelList[0],
          onPressedByIndex: onPressed?.call(0),
        ),
      FarmPlantSetStyle.double => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FarmPlant(
              model: farmPlantSetModel.farmPlantModelList[0],
              onPressedByIndex: onPressed?.call(0),
            ),
            FarmPlant(
              model: farmPlantSetModel.farmPlantModelList[1].copyWith(darkTheme: true),
              onPressedByIndex: onPressed?.call(1),
            ),
          ],
        ),
      FarmPlantSetStyle.square => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  model: farmPlantSetModel.farmPlantModelList[0],
                  onPressedByIndex: onPressed?.call(0),
                ),
                FarmPlant(
                  model: farmPlantSetModel.farmPlantModelList[1].copyWith(darkTheme: true),
                  onPressedByIndex: onPressed?.call(1),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  model: farmPlantSetModel.farmPlantModelList[2].copyWith(darkTheme: true),
                  onPressedByIndex: onPressed?.call(2),
                ),
                FarmPlant(
                  model: farmPlantSetModel.farmPlantModelList[3],
                  onPressedByIndex: onPressed?.call(3),
                ),
              ],
            ),
          ],
        ),
    };
  }
}
