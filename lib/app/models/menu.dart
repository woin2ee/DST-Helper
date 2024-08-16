import 'package:dst_helper/utils/custom_icon/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Menu {
  farm,
  cook,
  github;

  String localized(BuildContext context) {
    switch (this) {
      case Menu.farm:
        return AppLocalizations.of(context)!.sideBar_farm;
      case Menu.cook:
        return AppLocalizations.of(context)!.sideBar_cook;
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
