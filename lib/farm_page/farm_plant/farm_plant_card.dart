import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/models/v1/localization/season_localization.dart';
import 'package:flutter/material.dart';

class FarmPlantCard extends StatelessWidget {
  const FarmPlantCard({
    super.key,
    required this.farmPlantSet,
    this.title,
  });

  final String? title;
  final FarmPlantSet farmPlantSet;

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
            '${title != null ? title! : farmPlantSet.farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))} ★',
            maxLines: 1,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.surfaceBright,
            ),
          ),
          farmPlantSet
        ],
      ),
    );
  }
}
