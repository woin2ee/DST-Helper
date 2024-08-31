import 'package:dst_helper/app/models/menu.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.onDestinationSelected,
    required this.selectedIndex,
  });

  final void Function(int) onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: NavigationRail(
        onDestinationSelected: onDestinationSelected,
        elevation: 4,
        extended: true,
        destinations: [
          NavigationRailDestination(
            icon: Menu.farm.icon,
            label: Text(Menu.farm.localized(context)),
          ),
          NavigationRailDestination(
            icon: Menu.cook.icon,
            label: Text(Menu.cook.localized(context)),
          ),
          NavigationRailDestination(
            icon: Menu.github.icon,
            label: Text(Menu.github.localized(context)),
            padding: const EdgeInsets.only(top: 20.0),
          ),
        ],
        selectedIndex: selectedIndex,
      ),
    );
  }
}
