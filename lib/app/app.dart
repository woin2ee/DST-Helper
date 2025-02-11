import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import '../l10n/l10ns.dart';
import 'home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _selectedLocale = Locale(Platform.localeName.split('_')[0]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DST Helper',
      restorationScopeId: 'restoration_scope_id_dst_helper_0.0.1_0_debug',
      locale: _selectedLocale,
      localizationsDelegates: L10ns.localizationsDelegates,
      supportedLocales: L10ns.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade800),
        useMaterial3: true,
      ),
      home: HomePage(
        onSelectedLocale: (locale) {
          setState(() {
            _selectedLocale = locale;
          });
        },
        selectedLocale: _selectedLocale,
      ),
    );
  }
}
