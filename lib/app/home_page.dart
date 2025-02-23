import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/l10ns.dart';
import '../cook_page/cook_page.dart';
import '../farm_page/farm_page.dart';
import '../utils/custom_icon/custom_icon_icons.dart';
import '../utils/font_family.dart';
import 'app_state.dart';

enum AvailableLanguage {
  en,
  ko,
}

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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Only use in developing
  static const _firstPageIndex = kReleaseMode ? 0 : 0;

  final List<(Menu, bool)> _selectedMenuState = Menu.values.map((menu) {
    if (menu.index == _firstPageIndex) return (menu, true);
    return (menu, false);
  }).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedMenu = _selectedMenuState.firstWhere((element) => element.$2 == true).$1;
    final appState = context.watch<AppState>();

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              final Uri url = Uri.parse('https://github.com/woin2ee/DST-Helper');
              launchUrl(url);
            },
            icon: const Icon(
              CustomIcon.github,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          LanguagePopupMenuButton(
            selectedLocaleName: appState.currentLocale.localizedName,
            onSelected: (AvailableLanguage item) {
              appState.currentLocale = Locale(item.name);
            },
          ),
          const SizedBox(width: 30),
        ],
        title: Row(
          children: [
            Image.asset(
              'assets/images/bg_loading_loading_charlie2.png',
              height: 100,
            ),
            const SizedBox(width: 30),
            ...Menu.values.asMap().entries.map((menu) => Padding(
                  padding: const EdgeInsets.all(6),
                  child: TextButton(
                    onPressed: () {
                      switch (menu.value) {
                        case Menu.farm:
                        case Menu.cook:
                          setState(() {
                            for (var i = 0; i < _selectedMenuState.length; i++) {
                              _selectedMenuState[i] = (_selectedMenuState[i].$1, i == menu.key);
                            }
                          });
                      }
                    },
                    child: Text(
                      menu.value.localized(context),
                      style: TextStyle(
                        fontFamily: FontFamily.pretendard,
                        fontSize: 15,
                        color: selectedMenu == menu.value ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                )),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Row(
        children: [
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

class LanguagePopupMenuButton extends StatelessWidget {
  const LanguagePopupMenuButton({
    super.key,
    required this.selectedLocaleName,
    required this.onSelected,
  });

  final String selectedLocaleName;
  final Null Function(AvailableLanguage item) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AvailableLanguage>(
      tooltip: 'Show languages',
      position: PopupMenuPosition.under,
      color: Colors.white,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: AvailableLanguage.en,
          child: Text(
            'English',
            style: TextStyle(
              fontFamily: FontFamily.pretendard,
            ),
          ),
        ),
        const PopupMenuItem(
          value: AvailableLanguage.ko,
          child: Text(
            '한국어',
            style: TextStyle(
              fontFamily: FontFamily.pretendard,
            ),
          ),
        ),
      ],
      child: Container(
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
              selectedLocaleName,
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
