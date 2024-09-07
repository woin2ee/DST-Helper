import 'package:dst_helper/app/app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await _clearPrefsIfNeeds();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(const App());
}

Future<void> _clearPrefsIfNeeds() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions());

  // 버전 명시
  const int currentVersion = 5;

  final version = prefs.getInt('prefs_version');
  if (version == null || version != currentVersion) {
    await prefs.clear();
    prefs.setInt('prefs_version', currentVersion);
    return;
  }
}
