import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/di/injector.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_event.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/movie_detail_page.dart';
import 'package:movie_flutter_app/router/app_router.dart';

class MovieDetailRouter {
  const MovieDetailRouter();

  static Widget page(BuildContext context, RouteSettings routeSettings) =>
      BlocProvider(
        create: (_) {
          final args = routeSettings.arguments as Map<String, dynamic>?;
          final movieId = args?[AppRouter.movieDetailIdArgument] as String? ?? "";

          return MovieDetailBloc(
            movieRepository: injector.get<MovieRepository>(),
          )..add(MovieDetailInitEvent(movieId: movieId));
        },
        child: const MovieDetailPage(),
      );
}
