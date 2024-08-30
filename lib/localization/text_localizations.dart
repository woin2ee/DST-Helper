import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextLocalizations {
  TextLocalizations({required this.locale});

  Map<String, dynamic> _textMap = {};

  final Locale locale;

  static const LocalizationsDelegate<TextLocalizations> delegate = _TextLocalizationsDelegate();

  static TextLocalizations? of(BuildContext context) {
    return Localizations.of<TextLocalizations>(context, TextLocalizations);
  }

  Future<void> load(Locale locale) async {
    final languageJson = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    _textMap = jsonDecode(languageJson);
  }

  String localized(String key) {
    final localizedString = _textMap[key];
    if (localizedString == null) {
      assert(false, '"$key" key is not defined.');
      return key;
    }
    return localizedString;
  }
}

class _TextLocalizationsDelegate extends LocalizationsDelegate<TextLocalizations> {
  const _TextLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ko',
      ].contains(locale.languageCode);

  @override
  Future<TextLocalizations> load(Locale locale) {
    final textLocalizations = TextLocalizations(locale: locale);
    return textLocalizations.load(locale).then((_) {
      return textLocalizations;
    });
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<TextLocalizations> old) => false;
}
