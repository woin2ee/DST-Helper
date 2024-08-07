import 'package:dst_helper/models/items.dart';
import 'package:dst_helper/models/recipes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Meatballs_succcess', () {
    const recipe = Meatballs();
    bool got = recipe.canCookWith([
      const Morsel(),
      Berries(),
      Berries(),
      Berries(),
    ]);
    expect(got, true);
  });
}
