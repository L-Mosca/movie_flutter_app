import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';

abstract class SettingsEvent {}

class SettingsInitEvent extends SettingsEvent {}

class SettingsSetLocaleEvent extends SettingsEvent {
  final AppLocale locale;

  SettingsSetLocaleEvent({required this.locale});
}

class SettingsLogoutEvent extends SettingsEvent {}

class SettingsResetListener extends SettingsEvent {}
