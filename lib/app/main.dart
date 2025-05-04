import 'package:flutter/material.dart';
import 'package:movie_flutter_app/app/app.dart';
import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.initialize();
  final locale = await injector.get<PreferencesHelper>().getLocale();
  runApp(App(isDarkMode: false, locale: Locale(locale?.languageCode ?? "pt")));
}
