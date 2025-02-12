import '../../v1/season.dart';
import 'food_value.dart';
import 'nutrient.dart';
import 'requirement.dart';

/// It defines the common properties of items.
///
/// The classes that adopt this mixin have `code` identifying the item and `assetName` that it is the same name as the image file.
mixin Item {
  String get code;
  String get assetName;
}

enum FoodType {
  veggie,
  meat,
  generic,
  seeds,
  goodies,
}

mixin Edible implements Item {
  FoodType get type;
}

/// It indicates that the item can be cooked.
///
/// All cooked items have the own cooked name.
/// If the item doesn't have the own cooked name, should not adopt this mixin.
///
/// Some cookable items may have a composite asset that is a combination of the item and the cooked item.
mixin Cookable implements Item {
  String get cookedAssetName;
  String? get compositeAssetName;
}

/// It indicates plants that grow in the farm.
mixin Plantable implements Item {
  Set<Season> get seasons;
  Nutrient get nutrient;
}

/// It indicates that the item can cook in the crock pot.
///
/// The item has the own food values to determine which recipe to be.
mixin UsingInCrockPot implements Item {
  FoodValues? get foodValues;
}

/// It indicates that the item can be cooked in the crock pot.
mixin CookableWithCrockPot implements Item {
  int get priority;
  Requirements get requirements;
}
