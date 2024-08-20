import 'package:dst_helper/app/models/menu.dart';
import 'package:dst_helper/cook_page/cook_page.dart';
import 'package:dst_helper/farm_page/farm_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum AvailableLanguage {
  en,
  ko,
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.onSelectedLocale,
    required this.selectedLocale,
  });

  final void Function(Locale) onSelectedLocale;
  final Locale selectedLocale;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Only debug use
  static const _firstPageIndex = kReleaseMode ? 0 : 0;

  final List<(Menu, bool)> _selectedMenuState = Menu.values.map((menu) {
    if (menu.index == _firstPageIndex) return (menu, true);
    return (menu, false);
  }).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final selectedMenu = _selectedMenuState.firstWhere((element) => element.$2 == true).$1;

    final languageButton = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1.0, color: Colors.white),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.language,
              color: Colors.white,
            ),
          ),
          Text(
            widget.selectedLocale.localizedName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/bg_loading_loading_charlie2.png',
                height: 100,
              ),
              Row(
                children: [
                  PopupMenuButton<AvailableLanguage>(
                    position: PopupMenuPosition.under,
                    color: Colors.white,
                    child: languageButton,
                    onSelected: (AvailableLanguage item) {
                      widget.onSelectedLocale(Locale(item.name));
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: AvailableLanguage.en,
                        child: Text('English'),
                      ),
                      const PopupMenuItem(
                        value: AvailableLanguage.ko,
                        child: Text('한국어'),
                      ),
                    ],
                  ),
                  const SizedBox(width: 80),
                ],
              ),
            ],
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

extension on Locale {
  String get localizedName {
    switch (languageCode.split('_')[0]) {
      case 'en':
        return 'English';
      case 'ko':
        return '한국어';
      default:
        return 'Language';
    }
  }
}
