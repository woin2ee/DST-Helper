import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    final farmPlantModel = FarmPlantModel.basic(
      Items.potato,
      Items.potato,
      Items.potato,
      Items.potato,
      null,
      Items.tomaRoot,
      Items.tomaRoot,
      Items.tomaRoot,
      Items.tomaRoot,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    var farmPlantModel = FarmPlantModel.basic(
      null,
      null,
      Items.carrot,
      null,
      null,
      Items.carrot,
      Items.corn,
      Items.corn,
      Items.dragonFruit,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    var farmPlantModel = FarmPlantModel.dense(
      Items.pumpkin,
      Items.garlic,
      Items.pumpkin,
      Items.pumpkin,
      Items.garlic,
      Items.pumpkin,
      Items.potato,
      Items.potato,
      Items.potato,
      Items.potato,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    var farmPlantModel = FarmPlantModel.reverseDense(
      Items.asparagus,
      Items.potato,
      Items.potato,
      Items.asparagus,
      Items.potato,
      Items.onion,
      Items.asparagus,
      Items.potato,
      Items.onion,
      Items.asparagus,
    );
    expect(farmPlantModel.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    var farmPlantModel = FarmPlantModel.basic(
      Items.potato,
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
      Items.forgetMeLots,
      null,
      Items.carrot,
      null,
      null,
      Items.carrot,
      Items.corn,
      Items.corn,
      Items.dragonFruit,
    );
    expect(farmPlantModel.hasBalancedNutrients, false);
  });
}
