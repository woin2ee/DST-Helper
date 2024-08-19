import 'package:dst_helper/models/dst_object.dart';
import 'package:flutter/material.dart';

enum FarmPlantStyle {
  /// (top) 3 : 3 : 3 (bottom)
  basic,

  /// (top) 2 : 3 : 2 : 3 (bottom)
  dense,

  /// (top) 3 : 2 : 3 : 2 (bottom)
  reverseDense;

  int get countOfPlants {
    switch (this) {
      case FarmPlantStyle.basic:
        return 9;
      case FarmPlantStyle.dense:
      case FarmPlantStyle.reverseDense:
        return 10;
    }
  }
}

sealed class FarmPlant extends StatelessWidget {
  const FarmPlant({
    super.key,
    required this.style,
    required this.darkTheme,
    required this.plants,
  });

  FarmPlant.empty({
    super.key,
    required this.style,
    required this.darkTheme,
  }) : plants = List<PlantObject?>.filled(style.countOfPlants, null, growable: false);

  FarmPlant copyWith({bool? darkTheme});

  final FarmPlantStyle style;
  final bool darkTheme;
  final List<PlantObject?> plants;

  bool get hasBalancedNutrients {
    var result = const Nutrient(compost: 0, growthFormula: 0, manure: 0);
    for (var i = 0; i < style.countOfPlants; i++) {
      var plant = plants[i];
      if (plant != null) {
        result += plant.nutrient;
      }
    }
    return result.compost == 0 && result.growthFormula == 0 && result.manure == 0;
  }
}

class BasicFarmPlant extends FarmPlant {
  BasicFarmPlant(PlantObject? c1, PlantObject? c2, PlantObject? c3, PlantObject? c4, PlantObject? c5, PlantObject? c6,
      PlantObject? c7, PlantObject? c8, PlantObject? c9,
      {super.key, super.darkTheme = false})
      : super(
          style: FarmPlantStyle.basic,
          plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9],
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Column(
        children: [
          Row(
            children: [
              PlantCell(plant: plants[0], darkTheme: darkTheme),
              PlantCell(plant: plants[1], darkTheme: darkTheme),
              PlantCell(plant: plants[2], darkTheme: darkTheme),
            ],
          ),
          Row(
            children: [
              PlantCell(plant: plants[3], darkTheme: darkTheme),
              PlantCell(plant: plants[4], darkTheme: darkTheme),
              PlantCell(plant: plants[5], darkTheme: darkTheme),
            ],
          ),
          Row(
            children: [
              PlantCell(plant: plants[6], darkTheme: darkTheme),
              PlantCell(plant: plants[7], darkTheme: darkTheme),
              PlantCell(plant: plants[8], darkTheme: darkTheme),
            ],
          ),
        ],
      ),
    );
  }

  @override
  FarmPlant copyWith({bool? darkTheme}) {
    return BasicFarmPlant(
      plants[0],
      plants[1],
      plants[2],
      plants[3],
      plants[4],
      plants[5],
      plants[6],
      plants[7],
      plants[8],
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}

class DenseFarmPlant extends FarmPlant {
  DenseFarmPlant(PlantObject? c1, PlantObject? c2, PlantObject? c3, PlantObject? c4, PlantObject? c5, PlantObject? c6,
      PlantObject? c7, PlantObject? c8, PlantObject? c9, PlantObject? c10,
      {super.key, super.darkTheme = false})
      : super(
          style: FarmPlantStyle.dense,
          plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10],
        );

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
                PlantCell(plant: plants[0], darkTheme: darkTheme),
                PlantCell(plant: plants[1], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[2], darkTheme: darkTheme),
                PlantCell(plant: plants[3], darkTheme: darkTheme),
                PlantCell(plant: plants[4], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[5], darkTheme: darkTheme),
                PlantCell(plant: plants[6], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[7], darkTheme: darkTheme),
                PlantCell(plant: plants[8], darkTheme: darkTheme),
                PlantCell(plant: plants[9], darkTheme: darkTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  FarmPlant copyWith({bool? darkTheme}) {
    return DenseFarmPlant(
      plants[0],
      plants[1],
      plants[2],
      plants[3],
      plants[4],
      plants[5],
      plants[6],
      plants[7],
      plants[8],
      plants[9],
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}

class ReverseDenseFarmPlant extends FarmPlant {
  ReverseDenseFarmPlant(PlantObject? c1, PlantObject? c2, PlantObject? c3, PlantObject? c4, PlantObject? c5,
      PlantObject? c6, PlantObject? c7, PlantObject? c8, PlantObject? c9, PlantObject? c10,
      {super.key, super.darkTheme = false})
      : super(
          style: FarmPlantStyle.reverseDense,
          plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10],
        );

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
                PlantCell(plant: plants[0], darkTheme: darkTheme),
                PlantCell(plant: plants[1], darkTheme: darkTheme),
                PlantCell(plant: plants[2], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[3], darkTheme: darkTheme),
                PlantCell(plant: plants[4], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[5], darkTheme: darkTheme),
                PlantCell(plant: plants[6], darkTheme: darkTheme),
                PlantCell(plant: plants[7], darkTheme: darkTheme),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                PlantCell(plant: plants[8], darkTheme: darkTheme),
                PlantCell(plant: plants[9], darkTheme: darkTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  FarmPlant copyWith({bool? darkTheme}) {
    return ReverseDenseFarmPlant(
      plants[0],
      plants[1],
      plants[2],
      plants[3],
      plants[4],
      plants[5],
      plants[6],
      plants[7],
      plants[8],
      plants[9],
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }
}

class PlantCell extends StatelessWidget {
  const PlantCell({
    super.key,
    required this.plant,
    this.darkTheme = false,
  });

  final PlantObject? plant;
  final bool darkTheme;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(6),
        color: darkTheme ? colorScheme.surfaceContainerHighest.dark : colorScheme.surfaceContainerHighest,
        child: plant != null ? Image.asset('assets/images/items/${plant!.assetName}.png') : const AspectRatio(aspectRatio: 1),
      ),
    );
  }
}

extension on Color {
  Color get dark {
    const darkValue = -55;
    return Color.fromRGBO(red + darkValue, green + darkValue, blue + darkValue, 1.0);
  }
}
