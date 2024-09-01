import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:flutter/material.dart';

class FarmPlantCard extends StatefulWidget {
  const FarmPlantCard({
    super.key,
    required this.farmPlantSet,
    this.title,
  });

  final String? title;
  final FarmPlantSet farmPlantSet;

  @override
  State<FarmPlantCard> createState() => _FarmPlantCardState();
}

class _FarmPlantCardState extends State<FarmPlantCard> {
  bool _favorite = false;

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
                      '${widget.title != null ? widget.title! : widget.farmPlantSet.farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))}',
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
                    onPressed: () {
                      setState(() {
                        _favorite = !_favorite;
                      });
                    },
                    icon: _favorite
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
          widget.farmPlantSet
        ],
      ),
    );
  }
}
