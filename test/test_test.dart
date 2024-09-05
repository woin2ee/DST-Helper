import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:dst_helper/models/v2/item/items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    var farmPlantModel1 = FarmPlantModel.basic(
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
    );
    var farmPlantSetModel1 = FarmPlantSetModel.single(farmPlantModel: farmPlantModel1);
    final model1 = FarmPlantCardModel(farmPlantSetModel: farmPlantSetModel1);

    var farmPlantModel2 = FarmPlantModel.basic(
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
    );
    var farmPlantSetModel2 = FarmPlantSetModel.single(farmPlantModel: farmPlantModel2);
    final model2 = FarmPlantCardModel(farmPlantSetModel: farmPlantSetModel2);

    expect(farmPlantModel1 == farmPlantModel2, true);
    expect(farmPlantSetModel1 == farmPlantSetModel2, true);
    expect(model1 == model2, true);
  });
}
