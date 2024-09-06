import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class EditFarmSetController extends ChangeNotifier {
  final ValueNotifier<FarmPlantSetStyle> selectedFarmPlantSetStyleController = ValueNotifier(FarmPlantSetStyle.single);
  FarmPlantSetStyle get selectedFarmPlantSetStyle => selectedFarmPlantSetStyleController.value;

  FarmPlantStyle selectedFarmPlantStyle = FarmPlantStyle.basic;

  final ValueNotifier<Crop?> selectedCropController = ValueNotifier<Crop?>(null);
  Crop? get selectedCrop => selectedCropController.value;

  final ValueNotifier<Fertilizer?> selectedFertilizerController = ValueNotifier<Fertilizer?>(null);
  Fertilizer? get selectedFertilizer => selectedFertilizerController.value;

  final TextEditingController titleEditingController = TextEditingController();

  final ValueNotifier<FarmPlantSetModel> farmPlantSetModelController = ValueNotifier(
    FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.empty(FarmPlantStyle.basic),
    ),
  );
  FarmPlantSetModel get farmPlantSetModel => farmPlantSetModelController.value;

  /// Dismiss dialog를 보여줄지 결정하는데 사용됩니다.
  bool hasChanges = false;

  int? calculateCountOfFertilizerNeeded() {
    final selectedFertilizer = this.selectedFertilizer;
    if (selectedFertilizer == null) return null;

    var totalNutrientsByFarmPlant =
        farmPlantSetModel.farmPlantModelList.map((farmPlantData) => farmPlantData.totalNutrient);

    bool allNutrientsValid() {
      return totalNutrientsByFarmPlant
          .every((nutrient) => nutrient.compost >= 0 && nutrient.growthFormula >= 0 && nutrient.manure >= 0);
    }

    if (allNutrientsValid()) {
      return 0;
    }

    // The max count is 10, because a farm plant can have a maximum of 10 plants and its maximum negative value is -80.
    // And a minimum amount of nutrient's positive value is 8, thus it is.
    for (var i = 0; i < 10; i++) {
      totalNutrientsByFarmPlant = totalNutrientsByFarmPlant.map((nutrient) => nutrient + selectedFertilizer.nutrient);
      if (allNutrientsValid()) {
        return i + 1;
      }
    }

    return null;
  }

  void setSelectedFarmPlantSetStyle(FarmPlantSetStyle style) {
    if (selectedFarmPlantSetStyle == style) return;
    selectedFarmPlantSetStyleController.value = style;
    switch (selectedFarmPlantSetStyle) {
      case FarmPlantSetStyle.single:
        farmPlantSetModelController.value =
            FarmPlantSetModel.single(farmPlantModel: farmPlantSetModel.farmPlantModelList[0]);
      case FarmPlantSetStyle.double:
        farmPlantSetModelController.value = FarmPlantSetModel.double(
            left: farmPlantSetModel.farmPlantModelList[0],
            right: farmPlantSetModel.farmPlantModelList.elementAtOrNull(1) ??
                FarmPlantModel.empty(selectedFarmPlantStyle, darkTheme: true));
      case FarmPlantSetStyle.square:
        if (selectedFarmPlantStyle == FarmPlantStyle.basic) {
          final List<Plant?> emptyPlants = List.filled(9, null);
          farmPlantSetModelController.value = FarmPlantSetModel.square(
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
          farmPlantSetModelController.value = FarmPlantSetModel.square(
            topLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
            topRight: FarmPlantModel.empty(FarmPlantStyle.basic, darkTheme: true),
            bottomLeft: FarmPlantModel.empty(FarmPlantStyle.basic, darkTheme: true),
            bottomRight: FarmPlantModel.empty(FarmPlantStyle.basic),
          );
        }
    }
  }

  void setSelectedFarmPlantStyle(FarmPlantStyle style) {
    if (selectedFarmPlantStyle == style) return;
    selectedFarmPlantStyle = style;
    switch (selectedFarmPlantSetStyle) {
      case FarmPlantSetStyle.single:
        farmPlantSetModelController.value = FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(style));
      case FarmPlantSetStyle.double:
        farmPlantSetModelController.value = FarmPlantSetModel.double(
          left: FarmPlantModel.empty(style),
          right: FarmPlantModel.empty(style, darkTheme: true),
        );
      case FarmPlantSetStyle.square:
        assert(style != FarmPlantStyle.dense && style != FarmPlantStyle.reverseDense);
    }
  }
}
