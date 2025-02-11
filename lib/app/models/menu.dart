import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../l10n/l10ns.dart';

enum Menu {
  farm,
  cook;

  String localized(BuildContext context) {
    switch (this) {
      case Menu.farm:
        return L10ns.of(context).localized('menu_farm');
      case Menu.cook:
        return L10ns.of(context).localized('menu_cook');
    }
  }

  Widget get icon {
    switch (this) {
      case Menu.farm:
        return const Icon(Icons.grid_4x4);
      case Menu.cook:
        return const Icon(Symbols.cooking);
    }
  }
}
