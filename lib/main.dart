import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

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
  const currentVersion = _PrefsVersion(
    description: 'Update farm card model',
    number: 15,
  );

  clearAndSet() async {
    await prefs.clear();
    prefs.setInt('prefs_version', currentVersion.number);
  }

  final existingVersion = prefs.getInt('prefs_version');
  if (existingVersion == null) {
    clearAndSet();
    return;
  }
  assert(existingVersion <= currentVersion.number);
  if (existingVersion < currentVersion.number) {
    clearAndSet();
    return;
  }
}

class _PrefsVersion {
  final String description;
  final int number;

  const _PrefsVersion({required this.description, required this.number});
}
