import 'package:dst_helper/models/v1/season.dart';
import 'package:dst_helper/models/v2/item/food_value.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:dst_helper/models/v2/item/requirement.dart';

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

mixin Edible on Item {
  FoodType get type;
}

mixin Cookable on Item {
  String get cookedAssetName;
  String? get compositeAssetName;
}

mixin Plantable on Item {
  Set<Season> get seasons;
  Nutrient get nutrient;
}

mixin UsingInCrockPot on Item {
  FoodValues? get foodValues;
}

mixin CookableInCrockPot on Item {
  int get priority;
  Requirements get requirements;
}
