import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/l10ns.dart';
import '../../../models/v2/localization.dart';
import '../../../utils/font_family.dart';
import '../../edit_farm_set/farm_group_edit_window.dart';
import '../../farm_page_notifier.dart';
import '../farm_group/farm_group.dart';
import 'farm_card_model.dart';

export 'farm_card_model.dart';

class FarmCard extends StatelessWidget {
  const FarmCard({
    super.key,
    required this.model,
  });

  final FarmCardModel model;

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
                        '${model.title ?? model.farmGroupModel.suitableSeasons.map((season) => season.localizedName(context))}',
                    model: model,
                  ),
                  FarmGroup(model: model.farmGroupModel),
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
  final FarmCardModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double sideSpace = 42;
    final farmPageController = context.read<FarmPageNotifier>();

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
                          child: FarmGroupEditWindow(
                            isEditingNewOne: false,
                            initialModel: model,
                          ),
                        ),
                      );
                      if (result is FarmCardModel && context.mounted) {
                        context.read<FarmPageNotifier>().updateFarmCard(result);
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
                    PopupMenuItem(
                      value: _CardActionEntry.edit,
                      child: ListTile(
                        leading: const Icon(Icons.edit),
                        title: Text(L10ns.of(context).localized('edit')),
                      ),
                    ),
                    model.isHidden
                        ? PopupMenuItem(
                            value: _CardActionEntry.show,
                            child: ListTile(
                              leading: const Icon(Icons.visibility),
                              title: Text(L10ns.of(context).localized('show')),
                            ),
                          )
                        : PopupMenuItem(
                            value: _CardActionEntry.hide,
                            child: ListTile(
                              leading: const Icon(Icons.visibility_off),
                              title: Text(L10ns.of(context).localized('hide')),
                            ),
                          ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      value: _CardActionEntry.delete,
                      child: ListTile(
                        iconColor: Colors.red,
                        textColor: Colors.red,
                        leading: const Icon(Icons.delete_forever_rounded),
                        title: Text(L10ns.of(context).localized('delete')),
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
                valueListenable: model.isFavorited,
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
