import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_page_controller.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'farm_plant_card_model.dart';

export 'farm_plant_card_model.dart';

class FarmPlantCard extends StatelessWidget {
  const FarmPlantCard({
    super.key,
    required this.model,
  });

  final FarmPlantCardModel model;

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
                  child: ValueListenableBuilder(
                    valueListenable: model.favorite,
                    builder: (BuildContext context, bool favorite, Widget? child) {
                      return IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          model.favorite.value = !favorite;
                          context.read<FarmPageController>().save();
                        },
                        icon: favorite
                            ? const Icon(
                                Icons.star_rounded,
                                color: Colors.yellow,
                              )
                            : const Icon(
                                Icons.star_border_rounded,
                                color: Colors.grey,
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          FarmPlantSet(farmPlantSetModel: model.farmPlantSetModel),
        ],
      ),
    );
  }
}
