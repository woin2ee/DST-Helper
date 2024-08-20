import 'package:dst_helper/farm_page/farm_plant/farm_plants_shape.dart';
import 'package:dst_helper/models/localization.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';

class FarmPlantSet extends StatelessWidget {
  const FarmPlantSet({
    super.key,
    required this.shape,
    this.title,
  });

  final String? title;
  final FarmPlantsShape shape;

  Seasons get suitableSeasons {
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (var farmPlant in shape.farmPlants) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: const BeveledRectangleBorder(),
      color: theme.colorScheme.onSurfaceVariant,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${title != null ? title! : suitableSeasons.map((season) => season.localizedName(context))} ★',
            maxLines: 1,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.surfaceBright,
            ),
          ),
          switch (shape) {
            FarmPlantsShapeSingle(:final farmPlants) => farmPlants[0],
            FarmPlantsShapeDouble(:final farmPlants) => Row(children: [
                ...farmPlants.asMap().entries.map(
                    (farmPlant) => farmPlant.key.isOdd ? farmPlant.value.copyWith(darkTheme: true) : farmPlant.value),
              ]),
            FarmPlantsShapeSquare(:final farmPlants) => Column(
                children: [
                  Row(children: [farmPlants[0], farmPlants[1].copyWith(darkTheme: true)]),
                  Row(children: [farmPlants[2].copyWith(darkTheme: true), farmPlants[3]]),
                ],
              ),
          }
        ],
      ),
    );
  }
}
