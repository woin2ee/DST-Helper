import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_page_controller.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:dst_helper/utils/font_family.dart';
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
    return ListenableBuilder(
        listenable: model,
        builder: (context, child) {
          return Opacity(
            opacity: model.isHidden ? 0.7 : 1.0,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              color: theme.colorScheme.secondary.withOpacity(0.9),
              child: Column(
                children: [
                  _CardTitle(
                    title:
                        '${model.title ?? model.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}',
                    model: model,
                  ),
                  FarmPlantSet(farmPlantSetModel: model.farmPlantSetModel),
                ],
              ),
            ),
          );
        });
  }
}

enum _CardActionEntry {
  edit,
  hide,
  show,
  delete,
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    required this.title,
    required this.model,
  });

  final String title;
  final FarmPlantCardModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double sideSpace = 42;
    final farmPageController = context.read<FarmPageController>();

    return Container(
      color: Colors.black54,
      height: 38,
      child: Row(
        children: [
          SizedBox(
            width: sideSpace,
            child: Center(
              child: PopupMenuButton<_CardActionEntry>(
                color: Colors.grey.shade200,
                icon: const Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                  size: 22,
                ),
                position: PopupMenuPosition.under,
                onSelected: (_CardActionEntry action) async {
                  switch (action) {
                    case _CardActionEntry.edit:
                      final result = await showDialog(
                        barrierColor: Colors.black.withOpacity(0.35),
                        context: context,
                        builder: (context) => Dialog(
                          child: EditFarmSet(
                            isEditingNew: false,
                            originModel: model,
                          ),
                        ),
                      );
                      if (result is FarmPlantCardModel && context.mounted) {
                        context.read<FarmPageController>().updateFarmPlantCard(result);
                      }
                    case _CardActionEntry.hide:
                      farmPageController.makeCardHidden(true, id: model.id);
                    case _CardActionEntry.show:
                      farmPageController.makeCardHidden(false, id: model.id);
                    case _CardActionEntry.delete:
                      farmPageController.deleteCard(id: model.id);
                  }
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: _CardActionEntry.edit,
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                    ),
                    model.isHidden
                        ? const PopupMenuItem(
                            value: _CardActionEntry.show,
                            child: ListTile(
                              leading: Icon(Icons.visibility),
                              title: Text('Show'),
                            ),
                          )
                        : const PopupMenuItem(
                            value: _CardActionEntry.hide,
                            child: ListTile(
                              leading: Icon(Icons.visibility_off),
                              title: Text('Hide'),
                            ),
                          ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      value: _CardActionEntry.delete,
                      child: ListTile(
                        iconColor: Colors.red,
                        textColor: Colors.red,
                        leading: Icon(Icons.delete_forever_rounded),
                        title: Text('Delete'),
                      ),
                    ),
                  ];
                },
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.pretendard,
                fontSize: 17,
                color: theme.colorScheme.surfaceBright,
              ),
            ),
          ),
          SizedBox(
            width: sideSpace,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: model.favorite,
                builder: (BuildContext context, bool favorite, Widget? child) {
                  return IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      farmPageController.markCardAsFavorite(!favorite, id: model.id);
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
          ),
        ],
      ),
    );
  }
}
