import 'package:dst_helper/models/crop.dart';
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
            Crop.potato,
            Crop.potato,
            Crop.potato,
            Crop.potato,
            null,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
          ),
        ];

  FarmPlantGroupCard.preDefined2({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
          ),
          FarmPlant(
            PlacementStyle.basic,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
            Crop.tomato,
          ),
        ];

  FarmPlantGroupCard.preDefined3({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.dense,
            Crop.pumpkin,
            Crop.garlic,
            Crop.pumpkin,
            Crop.pumpkin,
            Crop.garlic,
            Crop.pumpkin,
            Crop.potato,
            Crop.potato,
            Crop.potato,
            Crop.potato,
          ),
          FarmPlant(
            PlacementStyle.reverseDense,
            Crop.garlic,
            Crop.pumpkin,
            Crop.pumpkin,
            Crop.garlic,
            Crop.pumpkin,
            Crop.potato,
            Crop.potato,
            Crop.pumpkin,
            Crop.potato,
            Crop.potato,
          ),
        ];

  FarmPlantGroupCard.preDefined4({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            Crop.onion,
            Crop.garlic,
            Crop.garlic,
            Crop.garlic,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.dragonFruit,
          ),
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            Crop.onion,
            Crop.garlic,
            Crop.garlic,
            Crop.garlic,
            Crop.dragonFruit,
            Crop.dragonFruit,
            Crop.dragonFruit,
          ),
        ];

  FarmPlantGroupCard.preDefined5({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            Crop.onion,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
          ),
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            Crop.onion,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
          ),
        ];

  FarmPlantGroupCard.preDefined6({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            null,
            Crop.onion,
            Crop.onion,
            Crop.potato,
            Crop.potato,
            Crop.garlic,
            Crop.potato,
            Crop.potato,
            Crop.garlic,
          ),
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            null,
            Crop.garlic,
            Crop.potato,
            Crop.potato,
            Crop.garlic,
            Crop.potato,
            Crop.potato,
          ),
        ];

  FarmPlantGroupCard.preDefined7({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.asparagus,
            Crop.asparagus,
            Crop.asparagus,
            Crop.potato,
            Crop.potato,
            Crop.potato,
            Crop.pumpkin,
            Crop.pumpkin,
            Crop.pumpkin,
          ),
          FarmPlant(
            PlacementStyle.basic,
            Crop.asparagus,
            Crop.asparagus,
            Crop.asparagus,
            Crop.potato,
            Crop.potato,
            Crop.potato,
            Crop.pumpkin,
            Crop.pumpkin,
            Crop.pumpkin,
          ),
        ];

  FarmPlantGroupCard.preDefined8({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            Crop.watermelon,
            null,
            Crop.carrot,
            Crop.carrot,
            Crop.carrot,
            Crop.carrot,
          ),
        ];

  FarmPlantGroupCard.preDefined9({super.key})
      : title = null,
        farmPlants = [
          FarmPlant(
            PlacementStyle.basic,
            Crop.onion,
            Crop.onion,
            Crop.onion,
            Crop.garlic,
            Crop.garlic,
            Crop.garlic,
            Crop.pepper,
            Crop.pepper,
            Crop.pepper,
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
      for (var crop in farmPlant.crops) {
        if (crop == null) continue;
        seasons = seasons.intersection(crop.seasons);
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
    Crop? c0,
    Crop? c1,
    Crop? c2,
    Crop? c3,
    Crop? c4,
    Crop? c5,
    Crop? c6,
    Crop? c7,
    Crop? c8,
    Crop? c9, // extra
    Key? key,
  ])  : crops = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9],
        super(key: key);

  FarmPlant.empty({
    super.key,
    required this.style,
  }) : crops = [
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

  final List<Crop?> crops;

  final PlacementStyle style;

  bool get hasBalancedNutrients {
    var result = const Nutrient(compost: 0, growthFormula: 0, manure: 0);
    int countOfCrops;
    switch (style) {
      case PlacementStyle.basic:
        countOfCrops = 9;
      case PlacementStyle.dense:
      case PlacementStyle.reverseDense:
        countOfCrops = 10;
    }
    for (var i = 0; i < countOfCrops; i++) {
      var crop = crops[i];
      if (crop != null) {
        result += crop.nutrient;
      }
    }
    return result.compost == 0 &&
        result.growthFormula == 0 &&
        result.manure == 0;
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
                  CropCell(crop: crops[0]),
                  CropCell(crop: crops[1]),
                  CropCell(crop: crops[2]),
                ],
              ),
              Row(
                children: [
                  CropCell(crop: crops[3]),
                  CropCell(crop: crops[4]),
                  CropCell(crop: crops[5]),
                ],
              ),
              Row(
                children: [
                  CropCell(crop: crops[6]),
                  CropCell(crop: crops[7]),
                  CropCell(crop: crops[8]),
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
                    CropCell(crop: crops[0]),
                    CropCell(crop: crops[1]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[2]),
                    CropCell(crop: crops[3]),
                    CropCell(crop: crops[4]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[5]),
                    CropCell(crop: crops[6]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[7]),
                    CropCell(crop: crops[8]),
                    CropCell(crop: crops[9]),
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
                    CropCell(crop: crops[0]),
                    CropCell(crop: crops[1]),
                    CropCell(crop: crops[2]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[3]),
                    CropCell(crop: crops[4]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[5]),
                    CropCell(crop: crops[6]),
                    CropCell(crop: crops[7]),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    CropCell(crop: crops[8]),
                    CropCell(crop: crops[9]),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }
}

class CropCell extends StatelessWidget {
  const CropCell({
    super.key,
    required this.crop,
  });

  final Crop? crop;

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
        child: crop != null
            ? Image.asset('crops/${crop!.name}.png')
            : const AspectRatio(aspectRatio: 1),
      ),
    );
  }
}
