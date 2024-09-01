import 'package:dst_helper/farm_page/farm_list/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_list/models/farm_plant_card_model.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:flutter/material.dart';

class FarmPlantCard extends StatelessWidget {
  const FarmPlantCard({
    super.key,
    required this.model,
    required this.onStarPressed,
  });

  final FarmPlantCardModel model;
  final void Function(bool) onStarPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      shape: const BeveledRectangleBorder(),
      color: theme.colorScheme.onSurfaceVariant,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 36, right: 36),
                    child: Text(
                      '${model.title != null ? model.title! : model.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}',
                      maxLines: 1,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.surfaceBright,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () => onStarPressed(!model.favorite),
                    icon: model.favorite
                        ? const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          )
                        : const Icon(
                            Icons.star_border_rounded,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ],
            ),
          ),
          FarmPlantSet(farmPlantSetData: model.farmPlantSetModel),
        ],
      ),
    );
  }
}
