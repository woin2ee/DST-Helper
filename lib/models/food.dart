import 'package:dst_helper/models/item.dart';

enum FoodType {
  veggie,
  meat,
  generic,
  seeds,
  goodies,
}

/// 먹을 수 있는 모든 아이템
abstract class Food extends Item {
  const Food(super.name, super.assetName, this.type);

  final FoodType type;
}
