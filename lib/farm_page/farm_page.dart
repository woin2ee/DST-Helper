import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10ns.dart';
import '../models/v1/localization/season_localization.dart';
import '../models/v1/season.dart';
import '../utils/font_family.dart';
import 'edit_farm_set/farm_group_edit_window.dart';
import 'farm_grid/farm_grid.dart';
import 'farm_page_controller.dart';
import 'side_info_box/side_info_box.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final _controller = FarmPageController();
  Future<void>? initResult;

  @override
  void initState() {
    super.initState();
    initResult = _controller.initFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      builder: (context, child) {
        final controller = context.watch<FarmPageController>();

        return Theme(
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
                    const _TopBar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                return const FarmGrid();
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
        return Padding(
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
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            spacing: 4,
            children: [
              Row(
                spacing: 12,
                children: [
                  _SeasonSelectionBox(),
                  const _NewButton(),
                ],
              ),
              const _ShowAndHideCheckbox(),
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
    return Consumer<FarmPageController>(
      builder: (BuildContext context, FarmPageController controller, Widget? checkboxLabel) {
        return Row(
          children: [
            Checkbox(
              value: controller.showingHiddenItems,
              onChanged: (bool? isChecked) {
                controller.showingHiddenItems = isChecked!;
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
    final controller = context.read<FarmPageController>();

    return ElevatedButton(
      onPressed: () async {
        final maybeFarmCardModel = await showDialog(
          barrierColor: Colors.black.withOpacity(0.35),
          context: context,
          builder: (context) => Dialog(
            child: FarmGroupEditWindow(
              key: GlobalKey(),
              isEditingNewOne: true,
            ),
          ),
        );
        if (maybeFarmCardModel is FarmCardModel) {
          final farmCardModel = maybeFarmCardModel;
          controller.addFarmCard(farmCardModel);
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
    return Consumer<FarmPageController>(
      builder: (context, controller, child) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 40,
        ),
        isSelected: _seasons.map((season) => season == controller.selectedSeason).toList(),
        onPressed: (index) {
          controller.selectedSeason = _seasons[index];
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
