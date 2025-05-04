import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';

abstract interface class SettingsRepository {
  // Locale
  Future<void> saveLocale({required AppLocale locale});
  Future<AppLocale?> getLocale();
}
