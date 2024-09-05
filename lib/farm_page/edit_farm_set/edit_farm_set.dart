import 'package:dst_helper/farm_page/edit_farm_set/analysis_view.dart';
import 'package:dst_helper/farm_page/edit_farm_set/crop_selection_table.dart';
import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set_controller.dart';
import 'package:dst_helper/farm_page/edit_farm_set/fertilizer_selection_table.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/farm_page/side_info_box/crops_info_box.dart';
import 'package:dst_helper/farm_page/side_info_box/fertilizers_info_box.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:flutter/material.dart';

class EditFarmSet extends StatefulWidget {
  const EditFarmSet({super.key});

  @override
  State<EditFarmSet> createState() => _EditFarmSetState();
}

class _EditFarmSetState extends State<EditFarmSet> {
  final controller = EditFarmSetController();

  @override
  void initState() {
    super.initState();
    controller.titleEditingController.addListener(() {
      controller.hasChanges = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final farmPlantSetStyleSelectionBox = Row(
      spacing: 10.0,
      children: [
        ...FarmPlantSetStyle.values.map((style) => OutlinedButton(
              onPressed: () {
                switch (style) {
                  case FarmPlantSetStyle.single:
                    setState(() {
                      controller.selectedFarmPlantSetStyle = FarmPlantSetStyle.single;
                      controller.farmPlantSetModel =
                          FarmPlantSetModel.single(farmPlantModel: controller.farmPlantSetModel.farmPlantModelList[0]);
                    });
                  case FarmPlantSetStyle.double:
                    setState(() {
                      controller.selectedFarmPlantSetStyle = FarmPlantSetStyle.double;
                      controller.farmPlantSetModel = FarmPlantSetModel.double(
                        left: controller.farmPlantSetModel.farmPlantModelList[0],
                        right: controller.farmPlantSetModel.farmPlantModelList.elementAtOrNull(1) ??
                            controller.selectedFarmPlantStyle.toEmptyModel(),
                      );
                    });
                  case FarmPlantSetStyle.square:
                    setState(() {
                      controller.selectedFarmPlantSetStyle = FarmPlantSetStyle.square;

                      if (controller.selectedFarmPlantStyle == FarmPlantStyle.basic) {
                        controller.farmPlantSetModel = FarmPlantSetModel.square(
                          topLeft:
                              FarmPlantModel.basicWithPlants(controller.farmPlantSetModel.farmPlantModelList[0].plants),
                          topRight: FarmPlantModel.basicWithPlants(
                              controller.farmPlantSetModel.farmPlantModelList.elementAtOrNull(1)?.plants ??
                                  controller.selectedFarmPlantStyle.toEmptyModel().plants),
                          bottomLeft: FarmPlantModel.basicWithPlants(
                              controller.farmPlantSetModel.farmPlantModelList.elementAtOrNull(2)?.plants ??
                                  controller.selectedFarmPlantStyle.toEmptyModel().plants),
                          bottomRight: FarmPlantModel.basicWithPlants(
                              controller.farmPlantSetModel.farmPlantModelList.elementAtOrNull(3)?.plants ??
                                  controller.selectedFarmPlantStyle.toEmptyModel().plants),
                        );
                      } else {
                        controller.selectedFarmPlantStyle = FarmPlantStyle.basic;
                        controller.farmPlantSetModel = FarmPlantSetModel.square(
                          topLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
                          topRight: FarmPlantModel.empty(FarmPlantStyle.basic),
                          bottomLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
                          bottomRight: FarmPlantModel.empty(FarmPlantStyle.basic),
                        );
                      }
                    });
                }
              },
              child: Text(style.name),
            )),
      ],
    );

    final farmPlantStyleSelectionBox = Row(
      spacing: 10,
      children: <Widget>[
        ...FarmPlantStyle.values.map((style) => OutlinedButton(
              onPressed: switch (controller.selectedFarmPlantSetStyle) {
                FarmPlantSetStyle.single => () {
                    setState(() {
                      if (controller.selectedFarmPlantStyle == style) return;
                      controller.selectedFarmPlantStyle = style;
                      controller.farmPlantSetModel =
                          FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(style));
                    });
                  },
                FarmPlantSetStyle.double => () {
                    setState(() {
                      if (controller.selectedFarmPlantStyle == style) return;
                      controller.selectedFarmPlantStyle = style;
                      controller.farmPlantSetModel = FarmPlantSetModel.double(
                        left: FarmPlantModel.empty(style),
                        right: FarmPlantModel.empty(style),
                      );
                    });
                  },
                FarmPlantSetStyle.square => switch (style) {
                    FarmPlantStyle.basic => () {},
                    FarmPlantStyle.dense => null,
                    FarmPlantStyle.reverseDense => null,
                  },
              },
              child: Text(style.name),
            )),
      ],
    );

    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Row(
          spacing: 26,
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
              spacing: 30,
              children: [
                Container(
                  color: Colors.black54,
                  width: 380,
                  height: 380,
                  child: Center(
                    child: FarmPlantSet(
                      farmPlantSetModel: controller.farmPlantSetModel,
                      onPressed: (farmPlantIndex) => (plantIndex) => () {
                            final Plant? placedPlant =
                                controller.farmPlantSetModel.farmPlantModelList[farmPlantIndex].plants[plantIndex];
                            final selectedCrop = controller.selectedCropController.value;
                            controller.farmPlantSetModel.setPlant(
                              placedPlant == selectedCrop ? null : selectedCrop,
                              farmPlantIndex: farmPlantIndex,
                              plantIndex: plantIndex,
                            );
                          },
                    ),
                  ),
                ),
                AnalysisView(controller: controller),
              ],
            ),
            Column(
              spacing: 16.0,
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
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }),
                ),
                farmPlantStyleSelectionBox,
                farmPlantSetStyleSelectionBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        TextLocalizations.of(context)!.localized('crops'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    CropSelectionTable(selectedCropController: controller.selectedCropController)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        spacing: 10,
                        children: [
                          Text(
                            TextLocalizations.of(context)!.localized('fertilizers'),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            '(모든 밭에 같은 비료를 사용한다고 가정합니다.)',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FertilizerSelectionTable(selectedFertilizerController: controller.selectedFertilizerController),
                  ],
                ),
                Row(
                  spacing: 18,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopScope(
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
                          TextLocalizations.of(context)!.localized('cancel'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        final model = FarmPlantCardModel(
                          title: controller.titleEditingController.text.isNotEmpty
                              ? controller.titleEditingController.text
                              : '${controller.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}',
                          farmPlantSetModel: controller.farmPlantSetModel,
                        );
                        Navigator.pop(context, model);
                      },
                      child: Text(
                        TextLocalizations.of(context)!.localized('add'),
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
}

extension on FarmPlantStyle {
  FarmPlantModel toEmptyModel() {
    switch (this) {
      case FarmPlantStyle.basic:
        return FarmPlantModel.empty(FarmPlantStyle.basic);
      case FarmPlantStyle.dense:
        return FarmPlantModel.empty(FarmPlantStyle.dense);
      case FarmPlantStyle.reverseDense:
        return FarmPlantModel.empty(FarmPlantStyle.dense);
    }
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
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
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
