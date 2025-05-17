import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_event.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_state.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;

  MovieDetailBloc({required this.movieRepository})
    : super(const MovieDetailState()) {
    on<MovieDetailInitEvent>(_init);
    on<MovieDetailFavoriteEvent>(_setFavorite);
    on<MovieDetailReloadEvent>(_reload);
    on<MovieDetailDeleteEvent>(_delete);
    on<MovieDetailResetListener>(_resetListener);
  }

  void _init(
    MovieDetailInitEvent event,
    Emitter<MovieDetailState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        emitter(state.copyWith(movieId: event.movieId));
        final movie = await movieRepository.getMovieById(id: event.movieId);
        if (movie != null) emitter(state.updateMovieData(movie));
      },
      loadingStatus: (isLoading) => emitter(state.showShimmer(isLoading)),
      exceptionHandler: (e) => emitter(state.showError(true)),
    );
  }

  void _setFavorite(
    MovieDetailFavoriteEvent event,
    Emitter<MovieDetailState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final id = state.movieId;
        final isFavorite = state.movie?.isFavorite ?? false;

        if (isFavorite) await movieRepository.removeFavoriteMovie(id: id);
        if (!isFavorite) await movieRepository.favoriteMovie(id: id);

        final newMovie = state.movie!;
        newMovie.isFavorite = !isFavorite;
        emitter(state.updateMovieData(newMovie));
      },
      loadingStatus: (isLoading) => emitter(state.showProgress(isLoading)),
      exceptionHandler: (_) {},
    );
  }

  void _reload(
    MovieDetailReloadEvent event,
    Emitter<MovieDetailState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        final movie = await movieRepository.getMovieById(id: state.movieId);
        if (movie != null) emitter(state.updateMovieData(movie));
      },
      loadingStatus: (isLoading) => emitter(state.showShimmer(isLoading)),
      exceptionHandler: (e) => emitter(state.showError(true)),
    );
  }

  void _delete(
    MovieDetailDeleteEvent event,
    Emitter<MovieDetailState> emitter,
  ) async {
    await defaultLaunch(
      function: () async {
        await movieRepository.deleteMovie(id: state.movieId);
        emitter(state.deleteSuccess);
      },
      loadingStatus: (isLoading) => emitter(state.showProgress(isLoading)),
      exceptionHandler: (e) => emitter(state.showError(true)),
    );
  }

  void _resetListener(
    MovieDetailResetListener event,
    Emitter<MovieDetailState> emitter,
  ) async {
    emitter(state.resetListener);
  }
}
