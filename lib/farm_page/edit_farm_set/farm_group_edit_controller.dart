import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

import '../../models/v2/item/item.dart';
import '../farm_list/farm_group/farm_group_model.dart';
import '../farm_list/farm_plant/farm_view_model.dart';
import '../farm_list/farm_plant_card/farm_card_model.dart';
import 'components/analysis_view/analysis_view_controller.dart';
import 'components/analysis_view/family_condition_box.dart';
import 'components/analysis_view/nutrient_condition_box.dart';
import 'components/analysis_view/season_condition_box.dart';
import 'components/crop_selection_section.dart';
import 'components/fertilizer_selection_section.dart';

class FarmGroupEditController extends ChangeNotifier {
  FarmGroupEditController._({
    required this.selectedFarmGroupTypeNotifier,
    required this.selectedFarmType,
    required this.titleEditingController,
    required this.farmGroupModelNotifier,
    required this.analysisViewController,
  });

  factory FarmGroupEditController.init() {
    final initialFarmGroupModel = FarmGroupModel.single(
      farmViewModel: FarmViewModel.empty(FarmType.basic),
    );
    final initialAnalysisViewController = AnalysisViewController.create(
      seasonConditionBoxController: SeasonConditionBoxController.init(),
      nutrientConditionBoxController: NutrientConditionBoxNotifier.init(),
      familyConditionBoxController: FamilyConditionBoxController.init(),
      isPlacedAnyPlant: false,
    );

    return FarmGroupEditController._(
      selectedFarmGroupTypeNotifier: ValueNotifier(FarmGroupType.single),
      selectedFarmType: FarmType.basic,
      titleEditingController: TextEditingController(),
      farmGroupModelNotifier: ValueNotifier(initialFarmGroupModel),
      analysisViewController: initialAnalysisViewController,
    );
  }

  factory FarmGroupEditController.withModel(FarmCardModel model) {
    final selectedFarmGroupTypeNotifier = ValueNotifier(model.farmGroupModel.groupType);
    final selectedFarmType = model.farmGroupModel.farmViewModels[0].farmType;
    final titleEditingController = TextEditingController(text: model.title);
    final farmGroupModelNotifier = ValueNotifier(model.farmGroupModel.copy());
    final seasonConditionBoxController =
        SeasonConditionBoxController(suitableSeasons: model.farmGroupModel.suitableSeasons.toBuiltSet());
    final nutrientConditionBoxController = NutrientConditionBoxNotifier.withModel(model);
    final familyConditionBoxController = FamilyConditionBoxController.withModel(model.farmGroupModel);
    final analysisViewController = AnalysisViewController.create(
      seasonConditionBoxController: seasonConditionBoxController,
      nutrientConditionBoxController: nutrientConditionBoxController,
      familyConditionBoxController: familyConditionBoxController,
      isPlacedAnyPlant: model.farmGroupModel.hasAnyPlant,
    );

    return FarmGroupEditController._(
      selectedFarmGroupTypeNotifier: selectedFarmGroupTypeNotifier,
      selectedFarmType: selectedFarmType,
      titleEditingController: titleEditingController,
      farmGroupModelNotifier: farmGroupModelNotifier,
      analysisViewController: analysisViewController,
    );
  }

  final ValueNotifier<FarmGroupType> selectedFarmGroupTypeNotifier;
  FarmGroupType get selectedFarmGroupType => selectedFarmGroupTypeNotifier.value;

  FarmType selectedFarmType;

  final SelectedCropNotifier selectedCropNotifier = SelectedCropNotifier(null);
  Crop? get selectedCrop => selectedCropNotifier.value;

  final SelectedFertilizerNotifier selectedFertilizerNotifier = SelectedFertilizerNotifier(null);
  Fertilizer? get selectedFertilizer => selectedFertilizerNotifier.value;

  final TextEditingController titleEditingController;

  final ValueNotifier<FarmGroupModel> farmGroupModelNotifier;
  FarmGroupModel get farmGroupModel => farmGroupModelNotifier.value;

  /// Dismiss dialog를 보여줄지 결정하는데 사용됩니다.
  bool hasChanges = false;

  final AnalysisViewController analysisViewController;

  void setFarmGroupType(FarmGroupType type) {
    if (selectedFarmGroupType == type) return;

    selectedFarmGroupTypeNotifier.value = type;

    switch (selectedFarmGroupType) {
      case FarmGroupType.single:
        farmGroupModelNotifier.value = FarmGroupModel.single(farmViewModel: farmGroupModel.farmViewModels[0]);
      case FarmGroupType.double:
        farmGroupModelNotifier.value = FarmGroupModel.double(
            left: farmGroupModel.farmViewModels[0],
            right: farmGroupModel.farmViewModels.elementAtOrNull(1) ??
                FarmViewModel.empty(selectedFarmType, darkTheme: true));
      case FarmGroupType.square:
        if (selectedFarmType == FarmType.basic) {
          final List<Plant?> emptyPlants = List.filled(9, null);
          farmGroupModelNotifier.value = FarmGroupModel.square(
            topLeft: FarmViewModel.basicWithPlants(farmGroupModel.farmViewModels[0].plants),
            topRight: FarmViewModel.basicWithPlants(
              farmGroupModel.farmViewModels.elementAtOrNull(1)?.plants ?? List.of(emptyPlants),
              darkTheme: true,
            ),
            bottomLeft: FarmViewModel.basicWithPlants(
              farmGroupModel.farmViewModels.elementAtOrNull(2)?.plants ?? List.of(emptyPlants),
              darkTheme: true,
            ),
            bottomRight: FarmViewModel.basicWithPlants(
                farmGroupModel.farmViewModels.elementAtOrNull(3)?.plants ?? List.of(emptyPlants)),
          );
        } else {
          selectedFarmType = FarmType.basic;
          farmGroupModelNotifier.value = FarmGroupModel.square(
            topLeft: FarmViewModel.empty(FarmType.basic),
            topRight: FarmViewModel.empty(FarmType.basic, darkTheme: true),
            bottomLeft: FarmViewModel.empty(FarmType.basic, darkTheme: true),
            bottomRight: FarmViewModel.empty(FarmType.basic),
          );
        }
    }
    _updateAnalysisControllers();
    notifyListeners();
  }

  void setFarmType(FarmType type) {
    if (selectedFarmType == type) return;
    selectedFarmType = type;
    switch (selectedFarmGroupType) {
      case FarmGroupType.single:
        farmGroupModelNotifier.value = FarmGroupModel.single(farmViewModel: FarmViewModel.empty(type));
      case FarmGroupType.double:
        farmGroupModelNotifier.value = FarmGroupModel.double(
          left: FarmViewModel.empty(type),
          right: FarmViewModel.empty(type, darkTheme: true),
        );
      case FarmGroupType.square:
        assert(type != FarmType.dense && type != FarmType.reverseDense);
    }
    _updateAnalysisControllers();
    notifyListeners();
  }

  void setPlant(Plant? plant, {required int farmIndex, required int plantIndex}) {
    final Plant? placedPlant = getPlacedPlant(farmIndex, plantIndex);

    if (placedPlant == plant) {
      plant = null;
    }

    farmGroupModel.setPlant(plant, farmIndex: farmIndex, plantIndex: plantIndex);
    _updateAnalysisControllers();
    notifyListeners();
  }

  void _updateAnalysisControllers() {
    analysisViewController.seasonConditionBoxController.suitableSeasons = farmGroupModel.suitableSeasons.toBuiltSet();
    analysisViewController.nutrientConditionBoxController.updateFarmGroupModel(farmGroupModel);
    analysisViewController.familyConditionBoxController.updateFarmGroupModel(farmGroupModel);
    analysisViewController.isPlacedAnyPlant.value = farmGroupModel.hasAnyPlant;
  }

  /// The order of the [farmIndex] is `top-left`, `top-right`, `bottom-left`, `bottom-right`.
  Plant? getPlacedPlant(int farmIndex, int plantIndex) {
    return farmGroupModel.farmViewModels[farmIndex].plants[plantIndex];
  }
}
