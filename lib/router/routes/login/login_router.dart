import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/di/injector.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/login/bloc/login_event.dart';
import 'package:movie_flutter_app/presentation/pages/login/login_page.dart';

class LoginRouter {
  const LoginRouter();

  static Widget get page => BlocProvider(
    create:
        (_) => LoginBloc(
          userRepository: injector.get<UserRepository>(),
          loginValidator: injector.get<LoginValidator>(),
        )..add(LoginInitEvent()),
    child: const LoginPage(),
  );
}
