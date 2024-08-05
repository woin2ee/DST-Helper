import 'package:dst_helper/farm_page/farm_plant.dart';
import 'package:dst_helper/models/crop.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.basic,
      Crop.potato,
      Crop.potato,
      Crop.potato,
      Crop.potato,
      null,
      Crop.tomato,
      Crop.tomato,
      Crop.tomato,
      Crop.tomato,
    );
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.basic,
      null,
      null,
      Crop.carrot,
      null,
      null,
      Crop.carrot,
      Crop.corn,
      Crop.corn,
      Crop.dragonFruit,
    );
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.dense,
      Crop.pumpkin,
      Crop.garlic,
      Crop.pumpkin,
      Crop.pumpkin,
      Crop.garlic,
      Crop.pumpkin,
      Crop.potato,
      Crop.potato,
      Crop.potato,
      Crop.potato,
    );
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.reverseDense,
      Crop.asparagus,
      Crop.potato,
      Crop.potato,
      Crop.asparagus,
      Crop.potato,
      Crop.onion,
      Crop.asparagus,
      Crop.potato,
      Crop.onion,
      Crop.asparagus,
    );
    expect(farmPlant.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.basic,
      Crop.potato,
    );
    expect(farmPlant.hasBalancedNutrients, false);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (균형 Plant, 잡초 포함)', () {
    var farmPlant = FarmPlant(
      PlacementStyle.basic,
      Crop.forgetMeLots,
      null,
      Crop.carrot,
      null,
      null,
      Crop.carrot,
      Crop.corn,
      Crop.corn,
      Crop.dragonFruit,
    );
    expect(farmPlant.hasBalancedNutrients, false);
  });
}
