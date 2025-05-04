import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelperImpl implements PreferencesHelper {
  late final SharedPreferences prefs;

  PreferencesHelperImpl._(this.prefs);

  static Future<PreferencesHelperImpl> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesHelperImpl._(prefs);
  }

  Future<void> _setInt({required String key, required int? value}) async {
    await prefs.setInt(key, value ?? -1);
  }

  Future<void> _setBool({required String key, required bool value}) async {
    await prefs.setBool(key, value);
  }

  Future<void> _setDouble({required String key, required double? value}) async {
    await prefs.setDouble(key, value ?? -1.0);
  }

  Future<void> _setString({required String key, required String? value}) async {
    await prefs.setString(key, value ?? "");
  }

  Future<int?> _getInt({required String key}) async {
    return prefs.getInt(key);
  }

  Future<bool?> _getBool({required String key}) async {
    return prefs.getBool(key);
  }

  Future<double?> _getDouble({required String key}) async {
    return prefs.getDouble(key);
  }

  Future<String?> _getString({required String key}) async {
    return prefs.getString(key);
  }
}
