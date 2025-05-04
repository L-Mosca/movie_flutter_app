import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/di/injector.dart';
import 'package:movie_flutter_app/domain/repositories/settings_repository/settings_repository.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/settings/bloc/settings_event.dart';
import 'package:movie_flutter_app/presentation/pages/settings/settings_page.dart';

class SettingsRouter {
  const SettingsRouter();

  static Widget get page => BlocProvider(
    create:
        (_) => SettingsBloc(
          settingsRepository: injector.get<SettingsRepository>(),
          userRepository: injector.get<UserRepository>(),
        )..add(SettingsInitEvent()),
    child: const SettingsPage(),
  );
}
