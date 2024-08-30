import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Meatballs', () {
    const recipe = Meatballs();

    group('Success', () {
      test('Usual1', () {
        bool got = recipe.canBeCookedWith(
          const Morsel(),
          const Berries(),
          const Berries(),
          const Berries(),
        );
        expect(got, true);
      });

      test('2.5 meat', () {
        bool got = recipe.canBeCookedWith(
          const Morsel(),
          const BatiliskWing(),
          const Meat(),
          const Drumstick(),
        );
        expect(got, true);
      });
    });

    group('Failure', () {
      test('Contained Twigs', () {
        bool got = recipe.canBeCookedWith(
          const Morsel(),
          const BatiliskWing(),
          const Meat(),
          const Twigs(),
        );
        expect(got, false);
      });

      test('Over meat value(3.0) ', () {
        bool got = recipe.canBeCookedWith(
          const Morsel(),
          const BatiliskWing(),
          const Meat(),
          const Meat(),
        );
        expect(got, false);
      });
    });
  });

  group('Meaty Stew', () {
    test('Success_case1', () {
      const recipe = MeatyStew();
      bool got = recipe.canBeCookedWith(
        const Meat(),
        const MonsterMeat(),
        const Morsel(),
        const FrogLegs(),
      );
      expect(got, true);
    });

    test('Failure_Over monster value', () {
      const recipe = MeatyStew();
      bool got = recipe.canBeCookedWith(
        const MonsterMeat(),
        const MonsterMeat(),
        const Morsel(),
        const Morsel(),
      );
      expect(got, false);
    });
  });

  test('Honey Nuggets_success_case1', () {
    const recipe = HoneyNuggets();
    bool got = recipe.canBeCookedWith(
      const MonsterMeat(),
      const Honey(),
      const Honey(),
      const Honey(),
    );
    expect(got, true);
  });

  group('Honey Neggets', () {
    test('Success_case1', () {
      const recipe = HoneyHam();
      bool got = recipe.canBeCookedWith(
        const MonsterMeat(),
        const Morsel(),
        const Honey(),
        const Honey(),
      );
      expect(got, true);
    });
  });

  group('Honey Ham', () {
    test('Success_case1', () {
      const recipe = HoneyHam();
      bool got = recipe.canBeCookedWith(
        const MonsterMeat(),
        const Morsel(),
        const BatiliskWing(),
        const Honey(),
      );
      expect(got, true);
    });

    test('Failure_Over monster value', () {
      const recipe = HoneyHam();
      bool got = recipe.canBeCookedWith(
        const MonsterMeat(),
        const MonsterMeat(),
        const Honey(),
        const Honey(),
      );
      expect(got, false);
    });
  });

  test('Froggle Bunwich_success_case1', () {
    const recipe = FroggleBunwich();
    bool got = recipe.canBeCookedWith(
      const FrogLegs(),
      const Berries(),
      const Berries(),
      const RedCap(),
    );
    expect(got, true);
  });

  test('Amberosia', () {
    const recipe = Amberosia();
    bool got = recipe.canBeCookedWith(
      const CollectedDust(),
      const Mandrake(),
      const Mandrake(),
      const Mandrake(),
    );
    expect(got, true);
  });

  group('Powdercake', () {
    const recipe = Powdercake();
    group('Success', () {
      test('Usual case', () {
        bool got = recipe.canBeCookedWith(
          const Corn(),
          const Honey(),
          const Twigs(),
          const Twigs(),
        );
        expect(got, true);
      });

      test('Success_withFish', () {
        bool got = recipe.canBeCookedWith(
          const Popperfish(),
          const Honey(),
          const Twigs(),
          const Twigs(),
        );
        expect(got, true);
      });
    });
  });

  group('Kabobs', () {
    const recipe = Kabobs();
    group('Failure', () {
      test('Over twigs', () {
        bool got = recipe.canBeCookedWith(
          const Meat(),
          const Meat(),
          const Twigs(),
          const Twigs(),
        );
        expect(got, false);
      });
    });
  });

  group('Bunny Stew', () {
    const recipe = Kabobs();
    group('Failure', () {
      test('Over meat', () {
        bool got = recipe.canBeCookedWith(
          const Morsel(),
          const Morsel(),
          const Ice(),
          const Ice(),
        );
        expect(got, false);
      });
    });
  });
}
