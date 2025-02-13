import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10ns.dart';
import 'app_state.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      builder: (context, child) {
        final appState = context.watch<AppState>();
        return MaterialApp(
          title: 'DST Helper',
          restorationScopeId: 'restoration_scope_id_dst_helper_0.0.1_0_debug',
          locale: appState.currentLocale,
          localizationsDelegates: L10ns.localizationsDelegates,
          supportedLocales: L10ns.supportedLocales,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade800),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
