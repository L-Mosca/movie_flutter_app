import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';

enum MovieDetailListener { nothing, deleteSuccess }

class MovieDetailState implements Copyable<MovieDetailState> {
  const MovieDetailState({
    this.listener = MovieDetailListener.nothing,
    this.movieId = "",
    this.movie,
    this.showShimmerLoading = false,
    this.showErrorPlaceHolder = false,
    this.showProgressLoading = false,
  });

  final MovieDetailListener listener;
  final String movieId;
  final MovieDetails? movie;
  final bool showShimmerLoading;
  final bool showErrorPlaceHolder;
  final bool showProgressLoading;

  @override
  MovieDetailState copy() {
    return MovieDetailState(
      listener: listener,
      movieId: movieId,
      movie: movie,
      showShimmerLoading: showShimmerLoading,
      showErrorPlaceHolder: showErrorPlaceHolder,
      showProgressLoading: showProgressLoading,
    );
  }

  @override
  MovieDetailState copyWith({
    MovieDetailListener? listener,
    String? movieId,
    MovieDetails? movie,
    bool? showShimmerLoading,
    bool? showErrorPlaceHolder,
    bool? showProgressLoading,
  }) {
    return MovieDetailState(
      listener: listener ?? this.listener,
      movieId: movieId ?? this.movieId,
      movie: movie ?? this.movie,
      showShimmerLoading: showShimmerLoading ?? this.showShimmerLoading,
      showErrorPlaceHolder: showErrorPlaceHolder ?? this.showErrorPlaceHolder,
      showProgressLoading: showProgressLoading ?? this.showProgressLoading,
    );
  }

  MovieDetailState updateMovieData(MovieDetails data) => copyWith(
    movie: data,
    showErrorPlaceHolder: false,
    showShimmerLoading: false,
    showProgressLoading: false,
  );

  MovieDetailState showShimmer(bool isLoading) => copyWith(
    showShimmerLoading: isLoading,
    showProgressLoading: false,
    showErrorPlaceHolder: false,
  );

  MovieDetailState showProgress(bool isLoading) => copyWith(
    showShimmerLoading: false,
    showProgressLoading: isLoading,
    showErrorPlaceHolder: false,
  );

  MovieDetailState showError(bool isError) => copyWith(
    showErrorPlaceHolder: isError,
    showProgressLoading: false,
    showShimmerLoading: false,
  );

  MovieDetailState get deleteSuccess =>
      copyWith(listener: MovieDetailListener.deleteSuccess);

  MovieDetailState get resetListener =>
      copyWith(listener: MovieDetailListener.nothing);
}
