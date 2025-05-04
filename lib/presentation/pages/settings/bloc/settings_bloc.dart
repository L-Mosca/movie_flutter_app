import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/repositories/settings_repository/settings_repository.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_event.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_state.dart';

class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;
  final UserRepository userRepository;

  SettingsBloc({required this.settingsRepository, required this.userRepository})
    : super(const SettingsState()) {
    on<SettingsInitEvent>(_init);
    on<SettingsSetLocaleEvent>(_setLocale);
    on<SettingsLogoutEvent>(_logout);
    on<SettingsResetListener>(_resetListener);
  }

  void _init(SettingsInitEvent event, Emitter<SettingsState> emitter) async {
    await defaultLaunch(
      function: () async {
        final user = await userRepository.getUser();
        emitter(state.copyWith(user: user));
      },
    );
  }

  void _setLocale(
    SettingsSetLocaleEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final locale = event.locale;
        await settingsRepository.saveLocale(languageCode: locale.languageCode);
        emitter(state.copyWith(selectedLocale: locale));
      },
    );
  }

  void _logout(
    SettingsLogoutEvent event,
    Emitter<SettingsState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        await userRepository.logout();
        emitter(state.copyWith(listener: SettingsListener.logoutSuccess));
      },
    );
  }

  void _resetListener(
    SettingsResetListener event,
    Emitter<SettingsState> emitter,
  ) async {
    emitter(state.copyWith(listener: SettingsListener.nothing));
  }
}
