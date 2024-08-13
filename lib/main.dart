import 'package:dst_helper/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(const App());
}
