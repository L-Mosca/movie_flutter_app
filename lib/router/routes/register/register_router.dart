import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/di/injector.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/validators/register_validator.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_event.dart';
import 'package:movie_flutter_app/presentation/pages/register/register_page.dart';

class RegisterRouter {
  const RegisterRouter();

  static Widget get page => BlocProvider(
    create:
        (_) => RegisterBloc(
          userRepository: injector.get<UserRepository>(),
          registerValidator: injector.get<RegisterValidator>(),
        )..add(RegisterInitEvent()),
    child: const RegisterPage(),
  );
}
