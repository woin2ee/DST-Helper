import 'package:dst_helper/localization/text_localizations.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum Menu {
  farm,
  cook;

  String localized(BuildContext context) {
    switch (this) {
      case Menu.farm:
        return TextLocalizations.of(context)!.localized('menu_farm');
      case Menu.cook:
        return TextLocalizations.of(context)!.localized('menu_cook');
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
