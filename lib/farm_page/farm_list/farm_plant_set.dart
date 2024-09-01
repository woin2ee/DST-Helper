import 'package:dst_helper/farm_page/farm_list/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_list/models/farm_plant_set_model.dart';
import 'package:flutter/material.dart';

class FarmPlantSet extends StatelessWidget {
  const FarmPlantSet({
    super.key,
    required this.farmPlantSetData,
    this.onPressed,
  });

  final FarmPlantSetModel farmPlantSetData;
  final void Function(int farmPlantIndex, int plantIndex)? onPressed;

  // bool get canBecomeGiant {
  //   for (var farmPlant in farmPlants) {
  //     for (var crop in farmPlant.crops) {
  //       if (crop == null) continue;

  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return switch (farmPlantSetData.farmPlantSetStyle) {
      FarmPlantSetStyle.single => FarmPlant(
          farmPlantData: farmPlantSetData.farmPlantModelList[0],
          onPressed: onPressed == null ? null : (plantIndex) => onPressed!(0, plantIndex),
        ),
      FarmPlantSetStyle.double => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FarmPlant(
              farmPlantData: farmPlantSetData.farmPlantModelList[0],
              onPressed: onPressed == null ? null : (plantIndex) => onPressed!(0, plantIndex),
            ),
            FarmPlant(
              farmPlantData: farmPlantSetData.farmPlantModelList[1],
              onPressed: onPressed == null ? null : (plantIndex) => onPressed!(1, plantIndex),
            ).copyWith(darkTheme: true),
          ],
        ),
      FarmPlantSetStyle.square => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantModelList[0],
                  onPressed: onPressed == null ? null : (plantIndex) => onPressed!(0, plantIndex),
                ),
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantModelList[1],
                  onPressed: onPressed == null ? null : (plantIndex) => onPressed!(1, plantIndex),
                ).copyWith(darkTheme: true),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantModelList[2],
                  onPressed: onPressed == null ? null : (plantIndex) => onPressed!(2, plantIndex),
                ).copyWith(darkTheme: true),
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantModelList[3],
                  onPressed: onPressed == null ? null : (plantIndex) => onPressed!(3, plantIndex),
                ),
              ],
            ),
          ],
        ),
    };
  }
}
