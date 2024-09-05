import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class EditFarmSetController {
  FarmPlantSetStyle selectedFarmPlantSetStyle = FarmPlantSetStyle.single;
  FarmPlantStyle selectedFarmPlantStyle = FarmPlantStyle.basic;

  final ValueNotifier<Crop?> selectedCropController = ValueNotifier<Crop?>(null);
  final ValueNotifier<Fertilizer?> selectedFertilizerController = ValueNotifier<Fertilizer?>(null);
  Fertilizer? get selectedFertilizer => selectedFertilizerController.value;

  final TextEditingController titleEditingController = TextEditingController();
  FarmPlantSetModel farmPlantSetModel = FarmPlantSetModel.single(
    farmPlantModel: FarmPlantModel.empty(FarmPlantStyle.basic),
  );

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
}
