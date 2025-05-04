import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';

abstract interface class PreferencesHelper {
  // User
  Future<void> saveUser({required UserData user});
  Future<UserData?> getUser();
  Future<void> logout();

  // Locale
  Future<void> saveLocale({required String languageCode});
  Future<Locale?> getLocale();
}
