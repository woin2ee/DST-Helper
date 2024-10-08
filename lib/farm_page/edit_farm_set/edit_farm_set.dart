import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/analysis_view.dart';
import 'package:dst_helper/farm_page/edit_farm_set/components/crop_selection_table.dart';
import 'package:dst_helper/farm_page/edit_farm_set/components/farm_plant_set_board.dart';
import 'package:dst_helper/farm_page/edit_farm_set/components/fertilizer_selection_table.dart';
import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set_controller.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/farm_page/side_info_box/crops_info_box.dart';
import 'package:dst_helper/farm_page/side_info_box/fertilizers_info_box.dart';
import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class EditFarmSet extends StatefulWidget {
  const EditFarmSet({
    super.key,
    required this.isEditingNew,
    this.originModel,
  }) : assert((isEditingNew == true && originModel == null) || (isEditingNew == false && originModel != null));

  final bool isEditingNew;
  final FarmPlantCardModel? originModel;

  @override
  State<EditFarmSet> createState() => _EditFarmSetState();
}

class _EditFarmSetState extends State<EditFarmSet> {
  late final EditFarmSetController controller;

  @override
  void initState() {
    super.initState();

    final originModel = widget.originModel;
    if (originModel == null) {
      controller = EditFarmSetController.init();
    } else {
      controller = EditFarmSetController.withModel(originModel);
    }
    Iterable<Listenable> controllers = [controller, controller.titleEditingController];
    for (final e in controllers) {
      e.addListener(() {
        controller.hasChanges = true;
      });
    }

    controller.fertilizerSelectionTableController.addListener(() {
      final selectedFertilizer = controller.fertilizerSelectionTableController.selectedFertilizer;
      controller.analysisViewController.nutrientConditionBoxController.selectFertilizer(selectedFertilizer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Row(
          spacing: 34,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FertilizersInfoBox(),
                CropsInfoBox(),
              ],
            ),
            Column(
              spacing: 34,
              children: [
                FarmPlantSetBoard(
                  controller: controller,
                  width: 384,
                  height: 384,
                ),
                ValueListenableBuilder(
                    valueListenable: controller.farmPlantSetModelController,
                    builder: (context, value, child) {
                      return AnalysisView(
                        controller: controller.analysisViewController,
                        width: 400,
                        height: 356,
                      );
                    }),
              ],
            ),
            Column(
              spacing: 30.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 400,
                  child: ListenableBuilder(
                      listenable: controller.farmPlantSetModel,
                      builder: (context, child) {
                        return TextField(
                          controller: controller.titleEditingController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Name',
                            hintText: (controller.farmPlantSetModel.hasAnyPlant)
                                ? '${controller.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}'
                                : '',
                            hintStyle: const TextStyle(
                              fontFamily: FontFamily.pretendard,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: controller.selectedFarmPlantSetStyleController,
                        builder: (context, value, child) {
                          return _buildFarmPlantStyleSelectionBox();
                        }),
                    _buildFarmPlantSetStyleSelectionBox(),
                  ],
                ),
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        L10ns.of(context).localized('crops'),
                        style: const TextStyle(
                          fontFamily: FontFamily.pretendard,
                          fontVariations: [FontVariation.weight(500)],
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CropSelectionTable(selectedCropController: controller.selectedCropController)
                  ],
                ),
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        spacing: 10,
                        children: [
                          Text(
                            L10ns.of(context).localized('fertilizers'),
                            style: const TextStyle(
                              fontFamily: FontFamily.pretendard,
                              fontVariations: [FontVariation.weight(500)],
                              fontSize: 16,
                            ),
                          ),
                          Tooltip(
                            message: L10ns.of(context).localized('fertilizer_selection_tooltip'),
                            textStyle: const TextStyle(
                              fontFamily: FontFamily.pretendard,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            verticalOffset: 15,
                            padding: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 4),
                            enableTapToDismiss: false,
                            preferBelow: false,
                            waitDuration: const Duration(milliseconds: 200),
                            child: const Icon(Icons.info_outline_rounded),
                          ),
                        ],
                      ),
                    ),
                    FertilizerSelectionTable(controller: controller.fertilizerSelectionTableController),
                  ],
                ),
                Row(
                  spacing: 28,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListenableBuilder(
                        listenable: Listenable.merge([
                          controller,
                          controller.titleEditingController,
                        ]),
                        builder: (context, child) {
                          return PopScope(
                            canPop: !controller.hasChanges,
                            onPopInvokedWithResult: (didPop, result) async {
                              if (didPop) return;
                              final bool shouldPop = await showBackDialog() ?? false;
                              if (context.mounted && shouldPop) {
                                Navigator.pop(context);
                              }
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
                        }),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        final originModel = widget.originModel;
                        final FarmPlantCardModel model;
                        final title = controller.titleEditingController.text.isNotEmpty
                            ? controller.titleEditingController.text
                            : null;
                        if (widget.isEditingNew == false && originModel != null) {
                          model = originModel.copyWith(
                            title: title,
                            farmPlantSetModel: controller.farmPlantSetModel,
                            createType: CreateType.userCustom,
                          );
                        } else {
                          model = FarmPlantCardModel.create(
                            title: title,
                            farmPlantSetModel: controller.farmPlantSetModel,
                            createType: CreateType.userCustom,
                            fertilizer: controller.selectedFertilizer,
                          );
                        }
                        Navigator.pop(context, model);
                      },
                      child: Text(
                        widget.isEditingNew ? L10ns.of(context).localized('add') : L10ns.of(context).localized('done'),
                        style: const TextStyle(
                          fontFamily: FontFamily.pretendard,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmPlantStyleSelectionBox() {
    return Builder(builder: (context) {
      return Row(
        spacing: 10,
        children: <Widget>[
          ...FarmPlantStyle.values.map((style) => OutlinedButton(
                onPressed: switch (controller.selectedFarmPlantSetStyle) {
                  FarmPlantSetStyle.single || FarmPlantSetStyle.double => () {
                      controller.setSelectedFarmPlantStyle(style);
                    },
                  FarmPlantSetStyle.square => switch (style) {
                      FarmPlantStyle.basic => () {},
                      FarmPlantStyle.dense => null,
                      FarmPlantStyle.reverseDense => null,
                    },
                },
                child: Text(
                  style.localizedName(context),
                  style: const TextStyle(
                    fontFamily: FontFamily.pretendard,
                  ),
                ),
              )),
        ],
      );
    });
  }

  Widget _buildFarmPlantSetStyleSelectionBox() {
    return Row(
      spacing: 10.0,
      children: [
        ...FarmPlantSetStyle.values.map((style) => OutlinedButton(
              onPressed: () => controller.setSelectedFarmPlantSetStyle(style),
              child: Text(
                style.name,
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            )),
      ],
    );
  }
}

extension on _EditFarmSetState {
  /// Shows a dialog and resolves to true when the user has indicated that they
  /// want to pop.
  ///
  /// A return value of null indicates a desire not to pop, such as when the
  /// user has dismissed the modal without tapping a button.
  Future<bool?> showBackDialog() {
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
