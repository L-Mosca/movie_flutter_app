import 'dart:convert';
import 'dart:ui';

import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelperImpl implements PreferencesHelper {
  late final SharedPreferences prefs;

  PreferencesHelperImpl._(this.prefs);

  static Future<PreferencesHelperImpl> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesHelperImpl._(prefs);
  }

  final _userKey = "Preferences.userKey";
  final _localeKey = "Preferences.localeKey";

  @override
  Future<void> saveUser({required UserData user}) async {
    final raw = jsonEncode(user.toJson());
    await _setString(key: _userKey, value: raw);
  }

  @override
  Future<UserData?> getUser() async {
    final raw = await _getString(key: _userKey);
    if (raw == null || raw.isEmpty) return null;

    return UserData.fromJson(jsonDecode(raw));
  }

  @override
  Future<void> logout() async {
    await _setString(key: _userKey, value: "");
  }

  @override
  Future<void> saveLocale({required String languageCode}) async {
    await _setString(key: _localeKey, value: languageCode);
  }

  @override
  Future<Locale?> getLocale() async {
    final languageCode = await _getString(key: _localeKey);
    if (languageCode == null || languageCode.isEmpty) return null;

    return Locale(languageCode);
  }

  /*Future<void> _setInt({required String key, required int? value}) async {
    await prefs.setInt(key, value ?? -1);
  }

  Future<void> _setBool({required String key, required bool value}) async {
    await prefs.setBool(key, value);
  }

  Future<void> _setDouble({required String key, required double? value}) async {
    await prefs.setDouble(key, value ?? -1.0);
  }*/

  Future<void> _setString({required String key, required String? value}) async {
    await prefs.setString(key, value ?? "");
  }

  /*Future<int?> _getInt({required String key}) async {
    return prefs.getInt(key);
  }

  Future<bool?> _getBool({required String key}) async {
    return prefs.getBool(key);
  }

  Future<double?> _getDouble({required String key}) async {
    return prefs.getDouble(key);
  }*/

  Future<String?> _getString({required String key}) async {
    return prefs.getString(key);
  }
}
