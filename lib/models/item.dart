import 'package:flutter/foundation.dart';

@immutable
abstract class Item {
  const Item(this.name, this.assetName);

  final String name;
  final String assetName;
}
