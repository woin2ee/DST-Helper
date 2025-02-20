import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/localization.dart';
import '../../utils/font_family.dart';
import '../farm_grid/farm_card/farm_card_model.dart';
import '../farm_grid/farm_group/farm_group_model.dart';
import '../farm_grid/farm_view/farm_view_model.dart';
import '../side_info_box/crops_info_box.dart';
import '../side_info_box/fertilizers_info_box.dart';
import 'components/analysis_view/analysis_view.dart';
import 'components/crop_selection_section.dart';
import 'components/farm_group_canvas.dart';
import 'components/fertilizer_selection_section.dart';
import 'farm_group_edit_controller.dart';

class FarmGroupEditWindow extends StatefulWidget {
  const FarmGroupEditWindow({
    super.key,
    required this.isEditingNewOne,
    this.initialModel,
  }) : assert((isEditingNewOne == true && initialModel == null) || (isEditingNewOne == false && initialModel != null));

  final bool isEditingNewOne;
  final FarmCardModel? initialModel;

  @override
  State<FarmGroupEditWindow> createState() => _FarmGroupEditWindowState();
}

class _FarmGroupEditWindowState extends State<FarmGroupEditWindow> {
  late final FarmGroupEditController controller;
  final _overlayController = OverlayPortalController();

  @override
  void initState() {
    super.initState();

    final initialModel = widget.initialModel;
    if (initialModel == null) {
      controller = FarmGroupEditController.init();
    } else {
      controller = FarmGroupEditController.withModel(initialModel);
    }

    _addChangesDetectingListener();

    controller.selectedFertilizerNotifier.addListener(() {
      final selectedFertilizer = controller.selectedFertilizerNotifier.value;
      controller.analysisViewController.nutrientConditionBoxController.selectFertilizer(selectedFertilizer);
    });
  }

  void _addChangesDetectingListener() {
    final controllers = [controller, controller.titleEditingController];
    for (final e in controllers) {
      e.addListener(() {
        controller.hasChanges = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: this),
        ChangeNotifierProvider.value(value: controller),
      ],
      child: GestureDetector(
        onTap: () => _overlayController.hide(),
        child: FittedBox(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
            ),
            padding: const EdgeInsets.all(18.0),
            child: IntrinsicHeight(
              child: Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const FertilizersInfoBox(),
                      VerticalDivider(
                        width: 1.0,
                        color: Colors.grey.shade300,
                      ),
                      const CropsInfoBox(),
                    ],
                  ),
                  VerticalDivider(
                    width: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  Column(
                    spacing: 34,
                    children: [
                      const FarmGroupCanvas(),
                      ValueListenableBuilder(
                          valueListenable: controller.farmGroupModelNotifier,
                          builder: (context, value, child) => const AnalysisView()),
                    ],
                  ),
                  VerticalDivider(
                    width: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  Column(
                    spacing: 30.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _TitleTextField(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          _buildFarmTypeSelectionBox(),
                          _buildFarmGroupTypeSelectionBox(),
                        ],
                      ),
                      CropSelectionSection(notifier: controller.selectedCropNotifier),
                      FertilizerSelectionSection(
                        notifier: controller.selectedFertilizerNotifier,
                        overlayController: _overlayController,
                      ),
                      const Row(
                        spacing: 20,
                        children: [
                          _CancelButton(),
                          _OkButton(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFarmTypeSelectionBox() {
    return Builder(builder: (context) {
      final controller = context.watch<FarmGroupEditController>();
      final colorScheme = Theme.of(context).colorScheme;

      return Row(
        spacing: 10,
        children: <Widget>[
          ...FarmType.values.map((type) => OutlinedButton(
                onPressed: switch (controller.selectedFarmGroupType) {
                  FarmGroupType.single || FarmGroupType.double => () {
                      controller.setFarmType(type);
                    },
                  FarmGroupType.square => switch (type) {
                      FarmType.basic => () {},
                      FarmType.dense => null,
                      FarmType.reverseDense => null,
                    },
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      controller.selectedFarmType == type ? colorScheme.primaryContainer : Colors.white),
                ),
                child: Text(
                  type.localizedName(context),
                  style: const TextStyle(
                    fontFamily: FontFamily.pretendard,
                  ),
                ),
              )),
        ],
      );
    });
  }

  Widget _buildFarmGroupTypeSelectionBox() {
    return Builder(builder: (context) {
      final controller = context.watch<FarmGroupEditController>();
      final colorScheme = Theme.of(context).colorScheme;

      return Row(
        spacing: 10.0,
        children: [
          ...FarmGroupType.values.map((type) => OutlinedButton(
                onPressed: () => controller.setFarmGroupType(type),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      controller.selectedFarmGroupType == type ? colorScheme.primaryContainer : Colors.white),
                ),
                child: Text(
                  type.name,
                  style: const TextStyle(
                    fontFamily: FontFamily.pretendard,
                  ),
                ),
              )),
        ],
      );
    });
  }
}

class _TitleTextField extends StatelessWidget {
  const _TitleTextField();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final controller = context.watch<FarmGroupEditController>();

      return Container(
        padding: const EdgeInsets.only(left: 8.0),
        width: 400,
        child: TextField(
          controller: controller.titleEditingController,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Name',
            hintText: (controller.farmGroupModel.hasAnyPlant)
                ? '${controller.farmGroupModel.suitableSeasons.map((season) => season.localizedName(context))}'
                : '',
            hintStyle: const TextStyle(
              fontFamily: FontFamily.pretendard,
              color: Colors.grey,
            ),
          ),
        ),
      );
    });
  }
}

class _OkButton extends StatelessWidget {
  const _OkButton();

  @override
  Widget build(BuildContext context) {
    final parent = context.read<_FarmGroupEditWindowState>().widget;
    final controller = context.read<FarmGroupEditController>();

    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: () {
        final originModel = parent.initialModel;
        final FarmCardModel model;
        final title = controller.titleEditingController.text.isNotEmpty ? controller.titleEditingController.text : null;
        LinkedFertilizer? linkedFertilizer() {
          final selectedFertilizer = controller.selectedFertilizer;
          if (selectedFertilizer == null) return null;
          return LinkedFertilizer(
            fertilizer: selectedFertilizer,
            amount: controller.analysisViewController.nutrientConditionBoxController.value.countOfNeededFertilizer,
          );
        }

        if (parent.isEditingNewOne == false && originModel != null) {
          model = originModel.copyWith(
            title: title,
            farmGroupModel: controller.farmGroupModel,
            createType: CreateType.userCustom,
            linkedFertilizer: linkedFertilizer,
          );
        } else {
          model = FarmCardModel.create(
            title: title,
            farmGroupModel: controller.farmGroupModel,
            createType: CreateType.userCustom,
            linkedFertilizer: linkedFertilizer(),
          );
        }

        Navigator.pop(context, model);
      },
      child: Text(
        parent.isEditingNewOne ? L10ns.of(context).localized('add') : L10ns.of(context).localized('done'),
        style: const TextStyle(
          fontFamily: FontFamily.pretendard,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<FarmGroupEditController>();

    return ListenableBuilder(
      listenable: Listenable.merge([
        controller,
        controller.titleEditingController,
      ]),
      builder: (context, child) {
        return PopScope(
          canPop: !controller.hasChanges,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            final bool shouldPop = await showBackDialog(context) ?? false;
            if (context.mounted && shouldPop) {
              Navigator.pop(context);
            }
          },
          child: child!,
        );
      },
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {
          controller.hasChanges ? Navigator.maybePop(context) : Navigator.pop(context);
        },
        child: Text(
          L10ns.of(context).localized('cancel'),
          style: const TextStyle(
            fontFamily: FontFamily.pretendard,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  /// Shows a dialog and resolves to true when the user has indicated that they
  /// want to pop.
  ///
  /// A return value of null indicates a desire not to pop, such as when the
  /// user has dismissed the modal without tapping a button.
  Future<bool?> showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            L10ns.of(context).localized('back_dialog_title'),
            style: const TextStyle(
              fontFamily: FontFamily.pretendard,
            ),
          ),
          content: Text(
            L10ns.of(context).localized('back_dialog_message'),
            style: const TextStyle(
              fontFamily: FontFamily.pretendard,
            ),
          ),
          actions: <Widget>[
            FilledButton(
              onPressed: () => Navigator.pop(context, false),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
              ),
              child: Text(
                L10ns.of(context).localized('cancel'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontVariations: [FontVariation.weight(500)],
                  color: Colors.black54,
                ),
              ),
            ),
            FilledButton(
              child: Text(
                L10ns.of(context).localized('confirm'),
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                  fontVariations: [FontVariation.weight(500)],
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
