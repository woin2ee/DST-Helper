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

mixin Edible {
  FoodType get type;
}

mixin Cookable {
  String get cookedAssetName;
  String? get compositeAssetName;
}

mixin Plantable {
  Set<Season> get seasons;
  Nutrient get nutrient;
}

mixin UsingInCrockPot {
  FoodValues? get foodValues;
}

mixin CookableInCrockPot {
  int get priority;
  Requirements get requirements;
}
