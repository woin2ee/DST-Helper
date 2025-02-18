import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class AppState extends ChangeNotifier {
  Locale _currentLocale = Locale(Platform.localeName.split('_')[0]);
  Locale get currentLocale => _currentLocale;
  set currentLocale(Locale value) {
    _currentLocale = value;
    notifyListeners();
  }
}
