import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10ns.dart';
import '../models/v1/localization/season_localization.dart';
import '../models/v1/season.dart';
import '../utils/font_family.dart';
import 'farm_grid/farm_grid.dart';
import 'farm_group_editor/farm_group_editor.dart';
import 'farm_page_model.dart';
import 'side_info_box/side_info_box.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  late final FarmPageModel _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _model = FarmPageModel(
      repository: Provider.of<FarmPageRepository>(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      builder: (context, child) {
        final model = context.watch<FarmPageModel>();
        final selectedSeason = model.selectedSeason;

        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: selectedSeason != null ? ColorScheme.fromSeed(seedColor: selectedSeason.personalColor) : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _TopBar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Builder(
                          builder: (context) {
                            if (!model.isLoaded) {
                              return const Center(
                                child: Text('Loading...'),
                              );
                            }
                            return const FarmGrid();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SideInfoBox(),
            ],
          ),
        );
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      if (windowWidth > 740) {
        return const Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            spacing: 12,
            children: [
              _SeasonSelectionBox(),
              _NewButton(),
              _ShowAndHideCheckbox(),
            ],
          ),
        );
      } else {
        return const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 4,
            children: [
              Row(
                spacing: 12,
                children: [
                  _SeasonSelectionBox(),
                  _NewButton(),
                ],
              ),
              _ShowAndHideCheckbox(),
            ],
          ),
        );
      }
    });
  }
}

class _ShowAndHideCheckbox extends StatelessWidget {
  const _ShowAndHideCheckbox();

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageModel>(
      builder: (BuildContext context, FarmPageModel model, Widget? checkboxLabel) {
        return Row(
          children: [
            Checkbox(
              value: model.showingHiddenItems,
              onChanged: (bool? isChecked) {
                model.showingHiddenItems = isChecked!;
              },
            ),
            checkboxLabel!,
          ],
        );
      },
      child: Text(
        L10ns.of(context).localized('show_hidden_items'),
        style: const TextStyle(
          fontFamily: FontFamily.pretendard,
        ),
      ),
    );
  }
}

class _NewButton extends StatelessWidget {
  const _NewButton();

  @override
  Widget build(BuildContext context) {
    final model = context.read<FarmPageModel>();

    return ElevatedButton(
      onPressed: () async {
        final maybeFarmCardModel = await showDialog(
          barrierColor: Colors.black.withOpacity(0.35),
          context: context,
          builder: (context) => Dialog(
            child: FarmGroupEditor(
              key: GlobalKey(),
              isEditingNewOne: true,
            ),
          ),
        );
        if (maybeFarmCardModel is FarmCardModel) {
          final farmCardModel = maybeFarmCardModel;
          model.addFarmCard(farmCardModel);
        }
      },
      child: const Text('New'),
    );
  }
}

class _SeasonSelectionBox extends StatelessWidget {
  const _SeasonSelectionBox();

  static const List<Season> _seasons = [
    Season.spring,
    Season.summer,
    Season.autumn,
    Season.winter,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageModel>(
      builder: (context, model, child) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 40,
        ),
        isSelected: _seasons.map((season) => season == model.selectedSeason).toList(),
        onPressed: (index) {
          model.selectedSeason = _seasons[index];
        },
        children: [
          ...Season.values.map((season) => Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Text(
                  season.localizedName(context),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily.pretendard,
                    fontVariations: [
                      FontVariation.weight(500),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
