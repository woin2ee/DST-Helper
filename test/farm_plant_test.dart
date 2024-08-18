import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';
import 'package:dst_helper/models/dst_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    var farmPlant = BasicFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    var farmPlant = BasicFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    var farmPlant = DenseFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    var farmPlant = ReverseDenseFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    var farmPlant = BasicFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, false);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (균형 Plant, 잡초 포함)', () {
    var farmPlant = BasicFarmPlant(
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
    expect(farmPlant.hasBalancedNutrients, false);
  });
}
