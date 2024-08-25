import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
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
    return switch (farmPlantSetData) {
      SingleFarmPlantSetData(farmPlantDataList: final farmPlants) => FarmPlant(
          farmPlantData: farmPlants[0],
          onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
        ),
      DoubleFarmPlantSetData(farmPlantDataList: final farmPlants) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FarmPlant(
              farmPlantData: farmPlants[0],
              onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
            ),
            FarmPlant(
              farmPlantData: farmPlants[1],
              onPressed: (plantIndex) => onPressed?.call(1, plantIndex),
            ).copyWith(darkTheme: true),
          ],
        ),
      SquareFarmPlantSetData(farmPlantDataList: final farmPlants) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  farmPlantData: farmPlants[0],
                  onPressed: (plantIndex) => onPressed?.call(0, plantIndex),
                ),
                FarmPlant(
                  farmPlantData: farmPlants[1],
                  onPressed: (plantIndex) => onPressed?.call(1, plantIndex),
                ).copyWith(darkTheme: true),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FarmPlant(
                  farmPlantData: farmPlants[2],
                  onPressed: (plantIndex) => onPressed?.call(2, plantIndex),
                ).copyWith(darkTheme: true),
                FarmPlant(
                  farmPlantData: farmPlants[3],
                  onPressed: (plantIndex) => onPressed?.call(3, plantIndex),
                ),
              ],
            ),
          ],
        ),
    };
  }
}
