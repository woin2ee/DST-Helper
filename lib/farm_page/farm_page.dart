import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_list/farm_list.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_page_controller.dart';
import 'package:dst_helper/farm_page/season_selection_box.dart';
import 'package:dst_helper/farm_page/side_info_box/side_info_box.dart';
import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmPage extends StatelessWidget {
  const FarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FarmPageController(),
      builder: (context, child) => Builder(
        builder: (context) {
          final initResult = context.read<FarmPageController>().initFromPrefs();
          return Consumer<FarmPageController>(
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
                              SeasonSelectionBox(),
                              const NewButton(),
                              const SizedBox(width: 50),
                              const ShowingHiddenItemsCheckbox(),
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

class ShowingHiddenItemsCheckbox extends StatelessWidget {
  const ShowingHiddenItemsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageController>(
      builder: (BuildContext context, FarmPageController controller, Widget? checkboxLabel) {
        return Row(
          children: [
            Checkbox(
              value: controller.showHiddenItems,
              onChanged: (bool? isChecked) {
                controller.showHiddenItems = isChecked!;
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

class NewButton extends StatelessWidget {
  const NewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showDialog(
          barrierColor: Colors.black.withOpacity(0.35),
          context: context,
          builder: (context) => const Dialog(
            child: EditFarmSet(isEditingNew: true),
          ),
        );
        if (result is FarmPlantCardModel && context.mounted) {
          context.read<FarmPageController>().addFarmPlantCard(result);
        }
      },
      child: const Text('New'),
    );
  }
}
