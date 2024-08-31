import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_data.dart';
import 'package:flutter/material.dart';

class FarmPlantSet extends StatelessWidget {
  const FarmPlantSet({
    super.key,
    required this.farmPlantSetData,
    this.onPressed,
  });

  final FarmPlantSetData farmPlantSetData;
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
          farmPlantData: farmPlantSetData.farmPlantDataList[0],
          onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
        ),
      FarmPlantSetStyle.double => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FarmPlant(
              farmPlantData: farmPlantSetData.farmPlantDataList[0],
              onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
            ),
            FarmPlant(
              farmPlantData: farmPlantSetData.farmPlantDataList[1],
              onPressed: (plantIndex) => onPressed?.call(1, plantIndex),
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
                  farmPlantData: farmPlantSetData.farmPlantDataList[0],
                  onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
                ),
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantDataList[1],
                  onPressed: (plantIndex) => onPressed?.call(1, plantIndex),
                ).copyWith(darkTheme: true),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantDataList[2],
                  onPressed: (plantIndex) => onPressed?.call(2, plantIndex),
                ).copyWith(darkTheme: true),
                FarmPlant(
                  farmPlantData: farmPlantSetData.farmPlantDataList[3],
                  onPressed: (plantIndex) => onPressed?.call(3, plantIndex),
                ),
              ],
            ),
          ],
        ),
    };
  }
}
