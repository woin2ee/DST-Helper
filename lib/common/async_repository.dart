import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AsyncRepository<T> {
  Future<void> save(T data);

  Future<T> fetch();
}

abstract class SharedPreferencesRepository<T> extends AsyncRepository<T> {
  SharedPreferencesRepository({
    required this.prefs,
  });

  @protected
  final Future<SharedPreferencesWithCache> prefs;
}
