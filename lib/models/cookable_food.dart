import 'package:dst_helper/models/food.dart';

abstract class CookableFood extends Food {
  const CookableFood(super.name, super.assetName, super.type, this.compositeAssetName);

  final String compositeAssetName;
}
