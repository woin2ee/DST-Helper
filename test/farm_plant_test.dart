import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    final farmPlantModel = FarmPlantModel.basic(
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      null,
      Crops.tomaRoot,
      Crops.tomaRoot,
      Crops.tomaRoot,
      Crops.tomaRoot,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    var farmPlantModel = FarmPlantModel.basic(
      null,
      null,
      Crops.carrot,
      null,
      null,
      Crops.carrot,
      Crops.corn,
      Crops.corn,
      Crops.dragonFruit,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    var farmPlantModel = FarmPlantModel.dense(
      Crops.pumpkin,
      Crops.garlic,
      Crops.pumpkin,
      Crops.pumpkin,
      Crops.garlic,
      Crops.pumpkin,
      Crops.potato,
      Crops.potato,
      Crops.potato,
      Crops.potato,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    var farmPlantModel = FarmPlantModel.reverseDense(
      Crops.asparagus,
      Crops.potato,
      Crops.potato,
      Crops.asparagus,
      Crops.potato,
      Crops.onion,
      Crops.asparagus,
      Crops.potato,
      Crops.onion,
      Crops.asparagus,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    var farmPlantModel = FarmPlantModel.basic(
      Crops.potato,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    expect(farmPlantModel.hasBalancedNutrients, false);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (균형 Plant, 잡초 포함)', () {
    var farmPlantModel = FarmPlantModel.basic(
      Weeds.forgetMeLots,
      null,
      Crops.carrot,
      null,
      null,
      Crops.carrot,
      Crops.corn,
      Crops.corn,
      Crops.dragonFruit,
    );
    expect(farmPlantModel.hasBalancedNutrients, false);
  });
}
