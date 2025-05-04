import 'package:flutter/cupertino.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';

abstract class SettingsEvent {}

class SettingsInitEvent extends SettingsEvent {
  final BuildContext context;

  SettingsInitEvent({required this.context});
}

class SettingsSetLocaleEvent extends SettingsEvent {
  final AppLocale locale;

  SettingsSetLocaleEvent({required this.locale});
}

class SettingsLogoutEvent extends SettingsEvent {}

class SettingsFetchLocaleListEvent extends SettingsEvent {
  final List<AppLocale> list;

  SettingsFetchLocaleListEvent({required this.list});
}

class SettingsResetListener extends SettingsEvent {}
