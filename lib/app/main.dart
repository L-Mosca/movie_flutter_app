import 'package:flutter/material.dart';
import 'package:movie_flutter_app/app/app.dart';
import 'package:movie_flutter_app/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.initialize();
  runApp(App(isDarkMode: false));
}