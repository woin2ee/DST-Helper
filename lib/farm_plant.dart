import 'package:dst_helper/models/crop.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            Crop.none,
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
            PlacementStyle.dense,
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
            Crop.none,
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
            Crop.none,
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
            Crop.none,
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
        if (crop == Crop.none) continue;
        seasons = seasons.intersection(crop.seasons);
      }
    }
    return seasons;
  }

  final List<FarmPlant> farmPlants;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shape: const BeveledRectangleBorder(),
        color: colorScheme.onSurfaceVariant,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${title ?? ''} ${suitableSeasons.map((season) => season.name)}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.6,
                color: Theme.of(context).colorScheme.surfaceBright,
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
  basic,
  dense,
}

class FarmPlant extends StatelessWidget {
  FarmPlant(
    this.style, [
    Crop c0 = Crop.none,
    Crop c1 = Crop.none,
    Crop c2 = Crop.none,
    Crop c3 = Crop.none,
    Crop c4 = Crop.none,
    Crop c5 = Crop.none,
    Crop c6 = Crop.none,
    Crop c7 = Crop.none,
    Crop c8 = Crop.none,
    Crop c9 = Crop.none, // extra
    Key? key,
  ])  : crops = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9],
        super(key: key);

  FarmPlant.empty({
    super.key,
    required this.style,
  }) : crops = [
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none,
          Crop.none, // extra
        ];

  final List<Crop> crops;

  final PlacementStyle style;

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
    }
  }
}

class CropCell extends StatelessWidget {
  const CropCell({
    super.key,
    required this.crop,
  });

  final Crop crop;

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
        child: Image.asset(
          'crops/${crop.name}.png',
        ),
      ),
    );
  }
}


// class _FarmPlantState extends State<FarmPlant> {
//   static const _size = 9;

//   // late List<Crop> _crops;

//   // _FarmPlantState([
//   //   Crop c0 = Crop.none,
//   //   Crop c1 = Crop.none,
//   //   Crop c2 = Crop.none,
//   //   Crop c3 = Crop.none,
//   //   Crop c4 = Crop.none,
//   //   Crop c5 = Crop.none,
//   //   Crop c6 = Crop.none,
//   //   Crop c7 = Crop.none,
//   //   Crop c8 = Crop.none,
//   // ]) {
//   //   _crops = [c0, c1, c2, c3, c4, c5, c6, c7, c8];
//   // }

//   // _FarmPlantState.empty() {
//   //   _crops = List.filled(_size, Crop.none);
//   // }

//   // void replaceCrop(int index, Crop crop) {
//   //   if (index >= _size) return;
//   //   setState(() {});
//   // }

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
