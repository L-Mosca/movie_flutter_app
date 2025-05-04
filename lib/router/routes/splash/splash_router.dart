import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/di/injector.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/presentation/pages/splash/bloc/splash_event.dart';
import 'package:movie_flutter_app/presentation/pages/splash/splash_page.dart';

import '../../../presentation/pages/splash/bloc/splash_bloc.dart';

class SplashRouter {
  const SplashRouter();

  static Widget get page => BlocProvider(
    create:
        (_) =>
            SplashBloc(userRepository: injector.get<UserRepository>())
              ..add(SplashInitEvent()),
    child: SplashPage(),
  );
}
