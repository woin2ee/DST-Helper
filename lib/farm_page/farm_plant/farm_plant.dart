import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_plant/plant_cell.dart';
import 'package:flutter/material.dart';

class FarmPlant extends StatelessWidget {
  const FarmPlant({
    super.key,
    required this.farmPlantData,
    this.darkTheme = false,
    this.onPressed,
  });

  final FarmPlantModel farmPlantData;
  final bool darkTheme;
  final void Function(int index)? onPressed;

  FarmPlant copyWith({bool? darkTheme}) {
    return FarmPlant(
      key: key,
      farmPlantData: farmPlantData,
      darkTheme: darkTheme ?? this.darkTheme,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    void Function()? onPressedByIndex(int index) {
      return onPressed == null ? null : () => onPressed!(index);
    }

    return switch (farmPlantData.farmPlantStyle) {
      FarmPlantStyle.basic => SizedBox(
          width: 180,
          height: 180,
          child: Column(
            children: [
              Row(
                children: [
                  PlantCell(
                    plant: farmPlantData.plants[0],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(0),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[1],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(1),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[2],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(2),
                  ),
                ],
              ),
              Row(
                children: [
                  PlantCell(
                    plant: farmPlantData.plants[3],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(3),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[4],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(4),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[5],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(5),
                  ),
                ],
              ),
              Row(
                children: [
                  PlantCell(
                    plant: farmPlantData.plants[6],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(6),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[7],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(7),
                  ),
                  PlantCell(
                    plant: farmPlantData.plants[8],
                    darkTheme: darkTheme,
                    onPressed: onPressedByIndex(8),
                  ),
                ],
              ),
            ],
          ),
        ),
      FarmPlantStyle.dense => SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[0],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(0),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[1],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(1),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[2],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(2),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[3],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(3),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[4],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(4),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[5],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(5),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[6],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(6),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[7],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(7),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[8],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(8),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[9],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      FarmPlantStyle.reverseDense => SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[0],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(0),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[1],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(1),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[2],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(2),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[3],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(3),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[4],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(4),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[5],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(5),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[6],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(6),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[7],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(7),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      plant: farmPlantData.plants[8],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(8),
                    ),
                    PlantCell(
                      plant: farmPlantData.plants[9],
                      darkTheme: darkTheme,
                      onPressed: onPressedByIndex(9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    };
  }
}
