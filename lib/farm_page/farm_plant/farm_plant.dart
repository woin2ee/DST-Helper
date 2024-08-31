import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_data.dart';
import 'package:dst_helper/farm_page/farm_plant/plant_cell.dart';
import 'package:flutter/material.dart';

class FarmPlant extends StatelessWidget {
  const FarmPlant({
    super.key,
    required this.farmPlantData,
    this.darkTheme = false,
    this.onPressed,
  });

  final FarmPlantData farmPlantData;
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
    return switch (farmPlantData.farmPlantStyle) {
      FarmPlantStyle.basic => BasicFarmPlant(
          key: key,
          darkTheme: darkTheme,
          onPressed: onPressed,
          farmPlantData: farmPlantData,
        ),
      FarmPlantStyle.dense => DenseFarmPlant(
          key: key,
          darkTheme: darkTheme,
          onPressed: onPressed,
          farmPlantData: farmPlantData,
        ),
      FarmPlantStyle.reverseDense => ReverseDenseFarmPlant(
          key: key,
          darkTheme: darkTheme,
          onPressed: onPressed,
          farmPlantData: farmPlantData,
        ),
    };
  }
}

class BasicFarmPlant extends FarmPlant {
  const BasicFarmPlant({
    super.key,
    super.darkTheme,
    super.onPressed,
    required super.farmPlantData,
  });

  @override
  BasicFarmPlant copyWith({bool? darkTheme}) {
    return BasicFarmPlant(
      farmPlantData: farmPlantData,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Column(
        children: [
          Row(
            children: [
              PlantCell(
                plant: farmPlantData.plants[0],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(0),
              ),
              PlantCell(
                plant: farmPlantData.plants[1],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(1),
              ),
              PlantCell(
                plant: farmPlantData.plants[2],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(2),
              ),
            ],
          ),
          Row(
            children: [
              PlantCell(
                plant: farmPlantData.plants[3],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(3),
              ),
              PlantCell(
                plant: farmPlantData.plants[4],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(4),
              ),
              PlantCell(
                plant: farmPlantData.plants[5],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(5),
              ),
            ],
          ),
          Row(
            children: [
              PlantCell(
                plant: farmPlantData.plants[6],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(6),
              ),
              PlantCell(
                plant: farmPlantData.plants[7],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(7),
              ),
              PlantCell(
                plant: farmPlantData.plants[8],
                darkTheme: darkTheme,
                onPressed: () => onPressed?.call(8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DenseFarmPlant extends FarmPlant {
  const DenseFarmPlant({
    super.key,
    super.darkTheme,
    super.onPressed,
    required super.farmPlantData,
  });

  @override
  DenseFarmPlant copyWith({bool? darkTheme}) {
    return DenseFarmPlant(
      farmPlantData: farmPlantData,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  onPressed: () => onPressed?.call(0),
                ),
                PlantCell(
                  plant: farmPlantData.plants[1],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(1),
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
                  onPressed: () => onPressed?.call(2),
                ),
                PlantCell(
                  plant: farmPlantData.plants[3],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(3),
                ),
                PlantCell(
                  plant: farmPlantData.plants[4],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(4),
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
                  onPressed: () => onPressed?.call(5),
                ),
                PlantCell(
                  plant: farmPlantData.plants[6],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(6),
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
                  onPressed: () => onPressed?.call(7),
                ),
                PlantCell(
                  plant: farmPlantData.plants[8],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(8),
                ),
                PlantCell(
                  plant: farmPlantData.plants[9],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReverseDenseFarmPlant extends FarmPlant {
  const ReverseDenseFarmPlant({
    super.key,
    super.darkTheme,
    super.onPressed,
    required super.farmPlantData,
  });

  @override
  ReverseDenseFarmPlant copyWith({bool? darkTheme}) {
    return ReverseDenseFarmPlant(
      farmPlantData: farmPlantData,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  onPressed: () => onPressed?.call(0),
                ),
                PlantCell(
                  plant: farmPlantData.plants[1],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(1),
                ),
                PlantCell(
                  plant: farmPlantData.plants[2],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(2),
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
                  onPressed: () => onPressed?.call(3),
                ),
                PlantCell(
                  plant: farmPlantData.plants[4],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(4),
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
                  onPressed: () => onPressed?.call(5),
                ),
                PlantCell(
                  plant: farmPlantData.plants[6],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(6),
                ),
                PlantCell(
                  plant: farmPlantData.plants[7],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(7),
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
                  onPressed: () => onPressed?.call(8),
                ),
                PlantCell(
                  plant: farmPlantData.plants[9],
                  darkTheme: darkTheme,
                  onPressed: () => onPressed?.call(9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
