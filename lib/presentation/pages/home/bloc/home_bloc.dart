import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/state_management/base_bloc.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_event.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRepository movieRepository;

  HomeBloc({required this.movieRepository}) : super(const HomeState()) {
    on<HomeInitEvent>(_init);
    on<HomeReloadEvent>(_reload);
    on<HomeNextPageEvent>(_nextPage);
    on<HomeFilterEvent>(_filter);
    on<HomeUpdateFilterEvent>(_updateFilter);
    on<HomeFavoriteEvent>(_favorite);
    on<HomeResetListener>(_resetListener);
  }

  void _init(HomeInitEvent event, Emitter<HomeState> emitter) async {
    await _fetchMovieList(emitter: emitter, page: HomeState.firstPage);
  }

  void _reload(HomeReloadEvent event, Emitter<HomeState> emitter) async {
    await _fetchMovieList(emitter: emitter, page: HomeState.firstPage);
  }

  void _nextPage(HomeNextPageEvent event, Emitter<HomeState> emitter) async {
    if (state.page >= state.lastPage) return;
    await _fetchMovieList(emitter: emitter, page: state.page + 1);
  }

  void _filter(HomeFilterEvent event, Emitter<HomeState> emitter) async {
    await _fetchMovieList(emitter: emitter, page: HomeState.firstPage);
  }

  void _updateFilter(
    HomeUpdateFilterEvent event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(state.copyWith(filter: event.filter));
  }

  void _favorite(HomeFavoriteEvent event, Emitter<HomeState> emitter) async {
    await defaultLaunch(
      function: () async {
        final movieId = event.id;
        final copyList = List<MovieBasicData>.from(state.list);
        final index = copyList.indexWhere((data) => data.id == movieId);

        if (index == -1) return;

        final movie = copyList[index];

        if (movie.isFavorite == true) {
          await movieRepository.removeFavoriteMovie(id: movieId);
        } else {
          await movieRepository.favoriteMovie(id: movieId);
        }

        final updatedMovie = MovieBasicData(
          id: movie.id,
          name: movie.name,
          image: movie.image,
          isFavorite: !(movie.isFavorite ?? false),
        );

        copyList[index] = updatedMovie;
        emitter(state.copyWith(list: copyList));
      },
    );
  }

  void _resetListener(
    HomeResetListener event,
    Emitter<HomeState> emitter,
  ) async {}

  Future<void> _fetchMovieList({
    required Emitter<HomeState> emitter,
    required int page,
  }) async {
    await defaultLaunch(
      function: () async {
        final size = HomeState.pageSize;
        final filter = state.filter;

        final data = await movieRepository.getMovies(
          page: page,
          size: size,
          filter: filter,
        );

        final newList = List<MovieBasicData>.from(state.list);
        newList.addAll(data.list ?? []);

        if (newList.isEmpty) {
          emitter(state.showEmptyList);
          return;
        }

        emitter(state.updateList(newList, page, data.totalPages ?? 1));
      },
      exceptionHandler: (exception) => emitter(state.showError),
      loadingStatus: (loading) => emitter(state.isLoading(loading, state.page)),
    );
  }
}
