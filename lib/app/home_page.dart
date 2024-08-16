import 'package:dst_helper/app/models/menu.dart';
import 'package:dst_helper/cook_page/cook_page.dart';
import 'package:dst_helper/cook_page/farm_page/farm_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _firstPageIndex = kReleaseMode ? 0 : 0;

  final List<(Menu, bool)> _selectedMenuState = Menu.values.map((menu) {
    if (menu.index == _firstPageIndex) return (menu, true);
    return (menu, false);
  }).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final selectedMenu = _selectedMenuState.firstWhere((element) => element.$2 == true).$1;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Image.asset(
            'bg_loading_loading_charlie2.png',
            height: 100,
          ),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 170,
            child: NavigationRail(
              onDestinationSelected: (index) {
                setState(() {
                  if (_selectedMenuState[index].$1 == Menu.github) {
                    final Uri url = Uri.parse('https://github.com/woin2ee/DST-Helper');
                    launchUrl(url);
                    return;
                  }
                  for (var i = 0; i < _selectedMenuState.length; i++) {
                    _selectedMenuState[i] = (_selectedMenuState[i].$1, i == index);
                  }
                });
              },
              elevation: 4,
              extended: true,
              destinations: [
                ...Menu.values.map((menu) => NavigationRailDestination(
                      icon: menu.icon,
                      label: Text(menu.localized(context)),
                    )),
              ],
              selectedIndex: selectedMenu.index,
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedMenu.index,
              children: const [
                FarmPage(),
                CookPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
