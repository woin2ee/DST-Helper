import 'package:dst_helper/app/app.dart';
import 'package:flutter/material.dart';

void main() async {
  // if (kDebugMode) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   final prefs = await SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions());
  //   await prefs.clear();
  // }

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(const App());
}
