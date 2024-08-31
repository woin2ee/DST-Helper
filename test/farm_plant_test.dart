import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_data.dart';
import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    final farmPlantData = BasicFarmPlantData(
      const Potato(),
      const Potato(),
      const Potato(),
      const Potato(),
      null,
      const TomaRoot(),
      const TomaRoot(),
      const TomaRoot(),
      const TomaRoot(),
    );
    expect(farmPlantData.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    var farmPlantData = BasicFarmPlantData(
      null,
      null,
      const Carrot(),
      null,
      null,
      const Carrot(),
      const Corn(),
      const Corn(),
      const DragonFruit(),
    );
    expect(farmPlantData.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    var farmPlantData = DenseFarmPlantData(
      const Pumpkin(),
      const Garlic(),
      const Pumpkin(),
      const Pumpkin(),
      const Garlic(),
      const Pumpkin(),
      const Potato(),
      const Potato(),
      const Potato(),
      const Potato(),
    );
    expect(farmPlantData.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    var farmPlantData = ReverseDenseFarmPlantData(
      const Asparagus(),
      const Potato(),
      const Potato(),
      const Asparagus(),
      const Potato(),
      const Onion(),
      const Asparagus(),
      const Potato(),
      const Onion(),
      const Asparagus(),
    );
    expect(farmPlantData.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    var farmPlantData = BasicFarmPlantData(
      const Potato(),
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
    expect(farmPlantData.hasBalancedNutrients, false);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (균형 Plant, 잡초 포함)', () {
    var farmPlantData = BasicFarmPlantData(
      const ForgetMeLots(),
      null,
      const Carrot(),
      null,
      null,
      const Carrot(),
      const Corn(),
      const Corn(),
      const DragonFruit(),
    );
    expect(farmPlantData.hasBalancedNutrients, false);
  });
}
