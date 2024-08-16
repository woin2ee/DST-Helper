import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';

class FarmPlantGroupCard extends StatelessWidget {
  const FarmPlantGroupCard({
    super.key,
    required this.farmPlants,
    required this.title,
  });

  FarmPlantGroupCard.preDefined1({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Potato(),
            const Potato(),
            const Potato(),
            const Potato(),
            null,
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
          ),
        ];

  FarmPlantGroupCard.preDefined2({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const DragonFruit(),
            const DragonFruit(),
            const DragonFruit(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
          ),
          FarmPlant(
            PlacementStyle.basic,
            const DragonFruit(),
            const DragonFruit(),
            const DragonFruit(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
            const TomaRoot(),
          ),
        ];

  FarmPlantGroupCard.preDefined3({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.dense,
            const Pumpkin(),
            const Garlic(),
            const Pumpkin(),
            const Pumpkin(),
            const Garlic(),
            const Pumpkin(),
            const Potato(),
            const Potato(),
            const Potato(),
            const Potato(),
          ),
          FarmPlant(
            PlacementStyle.reverseDense,
            const Garlic(),
            const Pumpkin(),
            const Pumpkin(),
            const Garlic(),
            const Pumpkin(),
            const Potato(),
            const Potato(),
            const Pumpkin(),
            const Potato(),
            const Potato(),
          ),
        ];

  FarmPlantGroupCard.preDefined4({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            const Onion(),
            const Garlic(),
            const Garlic(),
            const Garlic(),
            const DragonFruit(),
            const DragonFruit(),
            const DragonFruit(),
          ),
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            const Onion(),
            const Garlic(),
            const Garlic(),
            const Garlic(),
            const DragonFruit(),
            const DragonFruit(),
            const DragonFruit(),
          ),
        ];

  FarmPlantGroupCard.preDefined5({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            const Onion(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
          ),
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            const Onion(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
          ),
        ];

  FarmPlantGroupCard.preDefined6({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            null,
            const Onion(),
            const Onion(),
            const Potato(),
            const Potato(),
            const Garlic(),
            const Potato(),
            const Potato(),
            const Garlic(),
          ),
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            null,
            const Garlic(),
            const Potato(),
            const Potato(),
            const Garlic(),
            const Potato(),
            const Potato(),
          ),
        ];

  FarmPlantGroupCard.preDefined7({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Asparagus(),
            const Asparagus(),
            const Asparagus(),
            const Potato(),
            const Potato(),
            const Potato(),
            const Pumpkin(),
            const Pumpkin(),
            const Pumpkin(),
          ),
          FarmPlant(
            PlacementStyle.basic,
            const Asparagus(),
            const Asparagus(),
            const Asparagus(),
            const Potato(),
            const Potato(),
            const Potato(),
            const Pumpkin(),
            const Pumpkin(),
            const Pumpkin(),
          ),
        ];

  FarmPlantGroupCard.preDefined8({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            const Watermelon(),
            null,
            const Carrot(),
            const Carrot(),
            const Carrot(),
            const Carrot(),
          ),
        ];

  FarmPlantGroupCard.preDefined9({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            const Onion(),
            const Onion(),
            const Onion(),
            const Garlic(),
            const Garlic(),
            const Garlic(),
            const Pepper(),
            const Pepper(),
            const Pepper(),
          ),
        ];

  final String? title;

  Seasons get suitableSeasons {
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (var farmPlant in farmPlants) {
      for (var plant in farmPlant.plants) {
        if (plant == null) continue;
        seasons = seasons.intersection(plant.seasons);
      }
    }
    return seasons;
  }

  // bool get canBecomeGiant {
  //   for (var farmPlant in farmPlants) {
  //     for (var crop in farmPlant.crops) {
  //       if (crop == null) continue;

  //     }
  //   }
  // }

  final List<FarmPlant> farmPlants;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shape: const BeveledRectangleBorder(),
        color: theme.colorScheme.onSurfaceVariant,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${title != null ? title! : suitableSeasons.map((season) => season.name)} ★',
              maxLines: 1,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.surfaceBright,
              ),
            ),
            Row(
              children: farmPlants,
            ),
          ],
        ),
      ),
    );
  }
}

enum PlacementStyle {
  /// (top) 3 : 3 : 3 (bottom)
  basic,

  /// (top) 2 : 3 : 2 : 3 (bottom)
  dense,

  /// (top) 3 : 2 : 3 : 2 (bottom)
  reverseDense,
}

class FarmPlant extends StatelessWidget {
  FarmPlant(
    this.style, [
    PlantObject? c0,
    PlantObject? c1,
    PlantObject? c2,
    PlantObject? c3,
    PlantObject? c4,
    PlantObject? c5,
    PlantObject? c6,
    PlantObject? c7,
    PlantObject? c8,
    PlantObject? c9, // extra
    Key? key,
  ])  : plants = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9],
        super(key: key);

  FarmPlant.empty({
    super.key,
    required this.style,
  }) : plants = [
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null, // extra
        ];

  final List<PlantObject?> plants;

  final PlacementStyle style;

  bool get hasBalancedNutrients {
    var result = const Nutrient(compost: 0, growthFormula: 0, manure: 0);
    int countOfPlants;
    switch (style) {
      case PlacementStyle.basic:
        countOfPlants = 9;
      case PlacementStyle.dense:
      case PlacementStyle.reverseDense:
        countOfPlants = 10;
    }
    for (var i = 0; i < countOfPlants; i++) {
      var plant = plants[i];
      if (plant != null) {
        result += plant.nutrient;
      }
    }
    return result.compost == 0 && result.growthFormula == 0 && result.manure == 0;
  }

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case PlacementStyle.basic:
        return SizedBox(
          width: 180,
          height: 180,
          child: Column(
            children: [
              Row(
                children: [
                  PlantCell(plant: plants[0]),
                  PlantCell(plant: plants[1]),
                  PlantCell(plant: plants[2]),
                ],
              ),
              Row(
                children: [
                  PlantCell(plant: plants[3]),
                  PlantCell(plant: plants[4]),
                  PlantCell(plant: plants[5]),
                ],
              ),
              Row(
                children: [
                  PlantCell(plant: plants[6]),
                  PlantCell(plant: plants[7]),
                  PlantCell(plant: plants[8]),
                ],
              ),
            ],
          ),
        );
      case PlacementStyle.dense:
        return SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[0]),
                    PlantCell(plant: plants[1]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[2]),
                    PlantCell(plant: plants[3]),
                    PlantCell(plant: plants[4]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[5]),
                    PlantCell(plant: plants[6]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[7]),
                    PlantCell(plant: plants[8]),
                    PlantCell(plant: plants[9]),
                  ],
                ),
              ),
            ],
          ),
        );
      case PlacementStyle.reverseDense:
        return SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[0]),
                    PlantCell(plant: plants[1]),
                    PlantCell(plant: plants[2]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[3]),
                    PlantCell(plant: plants[4]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[5]),
                    PlantCell(plant: plants[6]),
                    PlantCell(plant: plants[7]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(plant: plants[8]),
                    PlantCell(plant: plants[9]),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}

class PlantCell extends StatelessWidget {
  const PlantCell({
    super.key,
    required this.plant,
  });

  final PlantObject? plant;

  static const double margin = 1;

  static const double padding = 6;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.all(margin),
        padding: const EdgeInsets.all(padding),
        color: colorScheme.surfaceContainerHighest,
        child: plant != null ? Image.asset('items/${plant!.assetName}.png') : const AspectRatio(aspectRatio: 1),
      ),
    );
  }
}
