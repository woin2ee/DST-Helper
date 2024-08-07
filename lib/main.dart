import 'package:dst_helper/cook_page/cook_page.dart';
import 'package:dst_helper/farm_page/farm_page.dart';
import 'package:dst_helper/utils/custom_icon/custom_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DST Helper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade800),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

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

class _HomePageState extends State<HomePage> {
  final List<(Menu, bool)> selectedMenuState = Menu.values.map((menu) {
    if (menu.index == 0) return (menu, true);
    return (menu, false);
  }).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    var selectedMenu =
        selectedMenuState.firstWhere((element) => element.$2 == true).$1;

    late Widget page;
    switch (selectedMenu) {
      case Menu.farm:
        page = const FarmPage();
      case Menu.cook:
        page = const CookPage();
      case Menu.github:
        page = const FarmPage();
        throw Exception('Github menu has not been handled.');
    }

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
          Container(
            constraints: const BoxConstraints(maxWidth: 160),
            child: NavigationRail(
              onDestinationSelected: (index) {
                setState(() {
                  if (selectedMenuState[index].$1 == Menu.github) {
                    final Uri url = Uri.parse('https://github.com/woin2ee/DST-Helper');
                    launchUrl(url);
                    return;
                  }
                  for (var i = 0; i < selectedMenuState.length; i++) {
                    selectedMenuState[i] =
                        (selectedMenuState[i].$1, i == index);
                  }
                });
              },
              elevation: 2,
              extended: true,
              destinations: [
                ...Menu.values.map((menu) => NavigationRailDestination(
                      icon: menu.icon,
                      label: Text(menu.toString()),
                    )),
              ],
              selectedIndex: selectedMenu.index,
            ),
          ),
          Expanded(child: page),
        ],
      ),
    );
  }
}
