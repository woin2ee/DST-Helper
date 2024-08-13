import 'package:dst_helper/app/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DST Helper',
      restorationScopeId: 'restoration_scope_id_dst_helper_0.0.1_0_debug',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade800),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
