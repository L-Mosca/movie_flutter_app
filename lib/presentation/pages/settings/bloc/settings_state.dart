import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';

enum SettingsListener { nothing, logoutSuccess }

class SettingsState implements Copyable<SettingsState> {
  const SettingsState({
    this.listener = SettingsListener.nothing,
    this.user,
    this.selectedLocale,
    this.supportedLocales = const [],
  });

  final SettingsListener listener;
  final UserData? user;
  final AppLocale? selectedLocale;
  final List<AppLocale> supportedLocales;

  @override
  SettingsState copy() {
    return SettingsState(
      listener: listener,
      user: user,
      selectedLocale: selectedLocale,
      supportedLocales: supportedLocales,
    );
  }

  @override
  SettingsState copyWith({
    SettingsListener? listener,
    UserData? user,
    AppLocale? selectedLocale,
    List<AppLocale>? supportedLocales,
  }) {
    return SettingsState(
      listener: listener ?? this.listener,
      user: user ?? this.user,
      selectedLocale: selectedLocale ?? this.selectedLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
    );
  }
}
