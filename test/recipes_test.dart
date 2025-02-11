import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Meatballs', () {
    const recipe = Items.meatballs;

    group('Success', () {
      test('Usual1', () {
        bool got = recipe.canBeCookedWith(
          Items.morsel,
          Items.berries,
          Items.berries,
          Items.berries,
        );
        expect(got, true);
      });

      test('2.5 meat', () {
        bool got = recipe.canBeCookedWith(
          Items.morsel,
          Items.batiliskWing,
          Items.meat,
          Items.drumstick,
        );
        expect(got, true);
      });
    });

    group('Failure', () {
      test('Contained Twigs', () {
        bool got = recipe.canBeCookedWith(
          Items.morsel,
          Items.batiliskWing,
          Items.meat,
          Items.twigs,
        );
        expect(got, false);
      });

      test('Over meat value(3.0) ', () {
        bool got = recipe.canBeCookedWith(
          Items.morsel,
          Items.batiliskWing,
          Items.meat,
          Items.meat,
        );
        expect(got, false);
      });
    });
  });

  group('Meaty Stew', () {
    test('Success_case1', () {
      const recipe = Items.meatyStew;
      bool got = recipe.canBeCookedWith(
        Items.meat,
        Items.monsterMeat,
        Items.morsel,
        Items.frogLegs,
      );
      expect(got, true);
    });

    test('Failure_Over monster value', () {
      const recipe = Items.meatyStew;
      bool got = recipe.canBeCookedWith(
        Items.monsterMeat,
        Items.monsterMeat,
        Items.morsel,
        Items.morsel,
      );
      expect(got, false);
    });
  });

  group('Honey Neggets', () {
    const recipe = Items.honeyNuggets;

    test('Success 1', () {
      bool got = recipe.canBeCookedWith(
        Items.monsterMeat,
        Items.honey,
        Items.honey,
        Items.honey,
      );
      expect(got, true);
    });

    test('Success 2', () {
      bool got = recipe.canBeCookedWith(
        Items.monsterMeat,
        Items.morsel,
        Items.honey,
        Items.honey,
      );
      expect(got, true);
    });
  });

  group('Honey Ham', () {
    test('Success_case1', () {
      const recipe = Items.honeyHam;
      bool got = recipe.canBeCookedWith(
        Items.monsterMeat,
        Items.morsel,
        Items.batiliskWing,
        Items.honey,
      );
      expect(got, true);
    });

    test('Failure_Over monster value', () {
      const recipe = Items.honeyHam;
      bool got = recipe.canBeCookedWith(
        Items.monsterMeat,
        Items.monsterMeat,
        Items.honey,
        Items.honey,
      );
      expect(got, false);
    });
  });

  test('Froggle Bunwich_success_case1', () {
    const recipe = Items.froggleBunwich;
    bool got = recipe.canBeCookedWith(
      Items.frogLegs,
      Items.berries,
      Items.berries,
      Items.redCap,
    );
    expect(got, true);
  });

  test('Amberosia', () {
    const recipe = Items.amberosia;
    bool got = recipe.canBeCookedWith(
      Items.collectedDust,
      Items.mandrake,
      Items.mandrake,
      Items.mandrake,
    );
    expect(got, true);
  });

  group('Powdercake', () {
    const recipe = Items.powdercake;
    group('Success', () {
      test('Usual case', () {
        bool got = recipe.canBeCookedWith(
          Items.corn,
          Items.honey,
          Items.twigs,
          Items.twigs,
        );
        expect(got, true);
      });

      test('Success_withFish', () {
        bool got = recipe.canBeCookedWith(
          Items.popperfish,
          Items.honey,
          Items.twigs,
          Items.twigs,
        );
        expect(got, true);
      });
    });
  });

  group('Kabobs', () {
    const recipe = Items.kabobs;
    group('Failure', () {
      test('Over twigs', () {
        bool got = recipe.canBeCookedWith(
          Items.meat,
          Items.meat,
          Items.twigs,
          Items.twigs,
        );
        expect(got, false);
      });
    });
  });

  group('Bunny Stew', () {
    const recipe = Items.kabobs;
    group('Failure', () {
      test('Over meat', () {
        bool got = recipe.canBeCookedWith(
          Items.morsel,
          Items.morsel,
          Items.ice,
          Items.ice,
        );
        expect(got, false);
      });
    });
  });
}
