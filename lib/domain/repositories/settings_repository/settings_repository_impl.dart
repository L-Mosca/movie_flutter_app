import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';
import 'package:movie_flutter_app/domain/repositories/settings_repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final PreferencesHelper preferencesHelper;

  SettingsRepositoryImpl({required this.preferencesHelper});

  @override
  Future<AppLocale?> getLocale() async {
    return await preferencesHelper.getLocale();
  }

  @override
  Future<void> saveLocale({required AppLocale locale}) async {
    await preferencesHelper.saveLocale(locale: locale);
  }
}
