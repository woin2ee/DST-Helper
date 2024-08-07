import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/item.dart';
import 'package:dst_helper/models/items.dart';

/// 요리 가능한 아이템
abstract class Ingredient extends Item {
  const Ingredient(super.name, super.assetName, this.foodValue);

  final FoodValue? foodValue;
}

class FoodValue {
  const FoodValue({
    this.meat,
    this.fish,
    this.vegetable,
    this.fruit,
    this.sweetener,
    this.egg,
    this.ice,
    this.dairy,
    this.monster,
  });

  final MeatValue? meat;
  final FishValue? fish;
  final VegetableValue? vegetable;
  final FruitValue? fruit;
  final EggValue? egg;
  final SweetenerValue? sweetener;
  final IceValue? ice;
  final DairyValue? dairy;
  final MonsterValue? monster;
  // final Float? butterflyWings;
  // final Float? moonMothWings
  // final Float? roastedBirchnut;
}

enum MeatValue {
  quarter,
  half,
  full,
}

enum FishValue {
  half,
  full,
  double,
}

enum VegetableValue {
  half,
  full,
}

enum FruitValue {
  half,
  full,
}

enum EggValue {
  small,
  enormous,
}

enum SweetenerValue {
  honeys,
  royalJelly,
}

enum IceValue {
  ice,
}

enum DairyValue {
  dairy,
}

enum MonsterValue {
  monster,
}

typedef Ingredients = List<Ingredient>;

extension IngredientsInspector on Ingredients {
  bool get containEgg {
    for (var i = 0; i < length; i++) {
      if (this[i].foodValue?.egg != null) return true;
    }
    return false;
  }

  bool get containInedible {
    for (var i = 0; i < length; i++) {
      if (this[i] is! Food) return true;
    }
    return false;
  }

  bool get containTwigs {
    for (var i = 0; i < length; i++) {
      if (this[i] is Twigs) return true;
    }
    return false;
  }

  bool get containMeet {
    for (var i = 0; i < length; i++) {
      if (this[i].foodValue?.meat != null) return true;
    }
    return false;
  }
  
  bool get containVeggie {
    for (var i = 0; i < length; i++) {
      if (this[i].foodValue?.vegetable != null) return true;
    }
    return false;
  }
  
  bool get containFruit {
    for (var i = 0; i < length; i++) {
      if (this[i].foodValue?.fruit != null) return true;
    }
    return false;
  }

  bool get containSweetener {
    for (var i = 0; i < length; i++) {
      if (this[i].foodValue?.sweetener != null) return true;
    }
    return false;
  }
}
