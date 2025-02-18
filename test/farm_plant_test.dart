import 'package:dst_helper/farm_page/farm_grid/farm_view/farm_view_model.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic)', () {
    final model = FarmViewModel.basic(
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
    expect(model.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: basic, null 포함)', () {
    final model = FarmViewModel.basic(
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
    expect(model.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: dense)', () {
    final model = FarmViewModel.dense(
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
    expect(model.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (style: reverseDense)', () {
    final model = FarmViewModel.reverseDense(
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
    expect(model.hasBalancedNutrients, true);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (불균형 Plant)', () {
    final model = FarmViewModel.basic(
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
    expect(model.hasBalancedNutrients, false);
  });

  test('Plant 구성에 따른 영양소 균형 계산 테스트: (균형 Plant, 잡초 포함)', () {
    final model = FarmViewModel.basic(
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
    expect(model.hasBalancedNutrients, false);
  });
}
