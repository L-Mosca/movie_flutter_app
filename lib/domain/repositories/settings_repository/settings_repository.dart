import 'package:flutter/material.dart';

abstract interface class SettingsRepository {
  // Locale
  Future<void> saveLocale({required String languageCode});
  Future<Locale?> getLocale();
}