import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../models/v2/item/item.dart';
import '../farm_list/farm_plant/farm_plant_model.dart';
import '../farm_list/farm_plant_card/farm_plant_card_model.dart';
import '../farm_list/farm_plant_set/farm_plant_set.dart';
import 'components/analysis_view/analysis_view_controller.dart';
import 'components/analysis_view/family_condition_box.dart';
import 'components/analysis_view/nutrient_condition_box.dart';
import 'components/analysis_view/season_condition_box.dart';
import 'components/crop_selection_section.dart';
import 'components/fertilizer_selection_section.dart';

class EditFarmSetController extends ChangeNotifier {
  EditFarmSetController._({
    required this.selectedFarmPlantSetStyleNotifier,
    required this.selectedFarmPlantStyle,
    required this.titleEditingController,
    required this.farmPlantSetModelNotifier,
    required this.analysisViewController,
  });

  factory EditFarmSetController.init() {
    return EditFarmSetController._(
      selectedFarmPlantSetStyleNotifier: ValueNotifier(FarmPlantSetStyle.single),
      selectedFarmPlantStyle: FarmPlantStyle.basic,
      titleEditingController: TextEditingController(),
      farmPlantSetModelNotifier: ValueNotifier(
        FarmPlantSetModel.single(
          farmPlantModel: FarmPlantModel.empty(FarmPlantStyle.basic),
        ),
      ),
      analysisViewController: AnalysisViewController.create(
        seasonConditionBoxController: SeasonConditionBoxController.init(),
        nutrientConditionBoxController: NutrientConditionBoxNotifier.init(),
        familyConditionBoxController: FamilyConditionBoxController.init(),
        isPlacedAnyPlant: false,
      ),
    );
  }

  factory EditFarmSetController.withModel(FarmPlantCardModel originModel) {
    final selectedFarmPlantSetStyleController = ValueNotifier(originModel.farmPlantSetModel.farmPlantSetStyle);
    final selectedFarmPlantStyle = originModel.farmPlantSetModel.farmPlantModelList[0].farmPlantStyle;
    final titleEditingController = TextEditingController(text: originModel.title);
    final farmPlantSetModelController = ValueNotifier(originModel.farmPlantSetModel.copy());
    final seasonConditionBoxController =
        SeasonConditionBoxController(suitableSeasons: originModel.farmPlantSetModel.suitableSeasons.toBuiltSet());
    final nutrientConditionBoxController = NutrientConditionBoxNotifier.withModel(originModel);
    final familyConditionBoxController = FamilyConditionBoxController.withModel(originModel.farmPlantSetModel);
    final analysisViewController = AnalysisViewController.create(
      seasonConditionBoxController: seasonConditionBoxController,
      nutrientConditionBoxController: nutrientConditionBoxController,
      familyConditionBoxController: familyConditionBoxController,
      isPlacedAnyPlant: originModel.farmPlantSetModel.hasAnyPlant,
    );
    return EditFarmSetController._(
      selectedFarmPlantSetStyleNotifier: selectedFarmPlantSetStyleController,
      selectedFarmPlantStyle: selectedFarmPlantStyle,
      titleEditingController: titleEditingController,
      farmPlantSetModelNotifier: farmPlantSetModelController,
      analysisViewController: analysisViewController,
    );
  }

  final ValueNotifier<FarmPlantSetStyle> selectedFarmPlantSetStyleNotifier;
  FarmPlantSetStyle get selectedFarmPlantSetStyle => selectedFarmPlantSetStyleNotifier.value;

  FarmPlantStyle selectedFarmPlantStyle;

  final SelectedCropNotifier selectedCropNotifier = SelectedCropNotifier(null);
  Crop? get selectedCrop => selectedCropNotifier.value;

  final SelectedFertilizerNotifier selectedFertilizerNotifier = SelectedFertilizerNotifier(null);
  Fertilizer? get selectedFertilizer => selectedFertilizerNotifier.value;

  final TextEditingController titleEditingController;

  final ValueNotifier<FarmPlantSetModel> farmPlantSetModelNotifier;
  FarmPlantSetModel get farmPlantSetModel => farmPlantSetModelNotifier.value;

  /// Dismiss dialog를 보여줄지 결정하는데 사용됩니다.
  bool hasChanges = false;

  final AnalysisViewController analysisViewController;

  void setSelectedFarmPlantSetStyle(FarmPlantSetStyle style) {
    if (selectedFarmPlantSetStyle == style) return;

    selectedFarmPlantSetStyleNotifier.value = style;

    switch (selectedFarmPlantSetStyle) {
      case FarmPlantSetStyle.single:
        farmPlantSetModelNotifier.value =
            FarmPlantSetModel.single(farmPlantModel: farmPlantSetModel.farmPlantModelList[0]);
      case FarmPlantSetStyle.double:
        farmPlantSetModelNotifier.value = FarmPlantSetModel.double(
            left: farmPlantSetModel.farmPlantModelList[0],
            right: farmPlantSetModel.farmPlantModelList.elementAtOrNull(1) ??
                FarmPlantModel.empty(selectedFarmPlantStyle, darkTheme: true));
      case FarmPlantSetStyle.square:
        if (selectedFarmPlantStyle == FarmPlantStyle.basic) {
          final List<Plant?> emptyPlants = List.filled(9, null);
          farmPlantSetModelNotifier.value = FarmPlantSetModel.square(
            topLeft: FarmPlantModel.basicWithPlants(farmPlantSetModel.farmPlantModelList[0].plants),
            topRight: FarmPlantModel.basicWithPlants(
              farmPlantSetModel.farmPlantModelList.elementAtOrNull(1)?.plants ?? List.of(emptyPlants),
              darkTheme: true,
            ),
            bottomLeft: FarmPlantModel.basicWithPlants(
              farmPlantSetModel.farmPlantModelList.elementAtOrNull(2)?.plants ?? List.of(emptyPlants),
              darkTheme: true,
            ),
            bottomRight: FarmPlantModel.basicWithPlants(
                farmPlantSetModel.farmPlantModelList.elementAtOrNull(3)?.plants ?? List.of(emptyPlants)),
          );
        } else {
          selectedFarmPlantStyle = FarmPlantStyle.basic;
          farmPlantSetModelNotifier.value = FarmPlantSetModel.square(
            topLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
            topRight: FarmPlantModel.empty(FarmPlantStyle.basic, darkTheme: true),
            bottomLeft: FarmPlantModel.empty(FarmPlantStyle.basic, darkTheme: true),
            bottomRight: FarmPlantModel.empty(FarmPlantStyle.basic),
          );
        }
    }
    _updateAnalysisControllers();
    notifyListeners();
  }

  void setSelectedFarmPlantStyle(FarmPlantStyle style) {
    if (selectedFarmPlantStyle == style) return;
    selectedFarmPlantStyle = style;
    switch (selectedFarmPlantSetStyle) {
      case FarmPlantSetStyle.single:
        farmPlantSetModelNotifier.value = FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(style));
      case FarmPlantSetStyle.double:
        farmPlantSetModelNotifier.value = FarmPlantSetModel.double(
          left: FarmPlantModel.empty(style),
          right: FarmPlantModel.empty(style, darkTheme: true),
        );
      case FarmPlantSetStyle.square:
        assert(style != FarmPlantStyle.dense && style != FarmPlantStyle.reverseDense);
    }
    _updateAnalysisControllers();
    notifyListeners();
  }

  void setPlant(Plant? plant, {required int farmPlantIndex, required int plantIndex}) {
    final Plant? placedPlant = getPlacedPlant(farmPlantIndex, plantIndex);

    if (placedPlant == plant) {
      plant = null;
    }

    farmPlantSetModel.setPlant(plant, farmPlantIndex: farmPlantIndex, plantIndex: plantIndex);
    _updateAnalysisControllers();
    notifyListeners();
  }

  void _updateAnalysisControllers() {
    analysisViewController.seasonConditionBoxController.suitableSeasons =
        farmPlantSetModel.suitableSeasons.toBuiltSet();
    analysisViewController.nutrientConditionBoxController.updateFarmPlantSetModel(farmPlantSetModel);
    analysisViewController.familyConditionBoxController.updateFarmPlantSetModel(farmPlantSetModel);
    analysisViewController.isPlacedAnyPlant.value = farmPlantSetModel.hasAnyPlant;
  }

  /// The order of the `farmPlantIndex` is `top-left`, `top-right`, `bottom-left`, `bottom-right`.
  Plant? getPlacedPlant(int farmPlantIndex, int plantIndex) {
    return farmPlantSetModel.farmPlantModelList[farmPlantIndex].plants[plantIndex];
  }
}
