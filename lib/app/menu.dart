import 'package:dst_helper/utils/custom_icon/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum Menu {
  farm,
  cook,
  github;

  @override
  String toString() {
    switch (this) {
      case Menu.farm:
        return 'Farm';
      case Menu.cook:
        return 'Cook';
      case Menu.github:
        return 'Github';
    }
  }

  Widget get icon {
    switch (this) {
      case Menu.farm:
        return const Icon(Icons.grid_4x4);
      case Menu.cook:
        return const Icon(Symbols.cooking);
      case Menu.github:
        return const Icon(CustomIcon.github);
    }
  }
}
