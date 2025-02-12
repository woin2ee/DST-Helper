import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10ns.dart';
import '../models/v1/localization/season_localization.dart';
import '../models/v1/season.dart';
import '../utils/font_family.dart';
import 'edit_farm_set/farm_group_edit_window.dart';
import 'farm_list/farm_list.dart';
import 'farm_page_notifier.dart';
import 'side_info_box/side_info_box.dart';

class FarmPage extends StatelessWidget {
  const FarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FarmPageNotifier(),
      builder: (context, child) => Builder(
        builder: (context) {
          final initResult = context.read<FarmPageNotifier>().initFromPrefs();
          return Consumer<FarmPageNotifier>(
            builder: (context, controller, child) => Theme(
              data: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: controller.selectedSeason.personalColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            spacing: 12,
                            children: [
                              _SeasonSelectionBox(),
                              const _NewButton(),
                              const SizedBox(width: 50),
                              const _ShowAndHideCheckbox(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: FutureBuilder(
                              future: initResult,
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                  case ConnectionState.waiting:
                                    return const Center(child: Text('Loading...'));
                                  case ConnectionState.active:
                                  case ConnectionState.done:
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    return const FarmList();
                                }
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
            ),
          );
        },
      ),
    );
  }
}

class _ShowAndHideCheckbox extends StatelessWidget {
  const _ShowAndHideCheckbox();

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageNotifier>(
      builder: (BuildContext context, FarmPageNotifier farmPageNotifier, Widget? checkboxLabel) {
        return Row(
          children: [
            Checkbox(
              value: farmPageNotifier.showingHiddenItems,
              onChanged: (bool? isChecked) {
                farmPageNotifier.showingHiddenItems = isChecked!;
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
    return ElevatedButton(
      onPressed: () async {
        final result = await showDialog(
          barrierColor: Colors.black.withOpacity(0.35),
          context: context,
          builder: (context) => Dialog(
            child: FarmGroupEditWindow(
              key: GlobalKey(),
              isEditingNewOne: true,
            ),
          ),
        );
        if (result is FarmCardModel && context.mounted) {
          context.read<FarmPageNotifier>().addFarmCard(result);
        }
      },
      child: const Text('New'),
    );
  }
}

class _SeasonSelectionBox extends StatelessWidget {
  _SeasonSelectionBox();

  final List<Season> _seasons = [
    Season.spring,
    Season.summer,
    Season.autumn,
    Season.winter,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageNotifier>(
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
