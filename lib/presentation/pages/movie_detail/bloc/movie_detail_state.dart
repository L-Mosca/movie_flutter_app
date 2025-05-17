import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';

enum MovieDetailListener { nothing, deleteSuccess }

class MovieDetailState implements Copyable<MovieDetailState> {
  const MovieDetailState({
    this.listener = MovieDetailListener.nothing,
    this.movieId = -1,
    this.movie,
    this.showShimmerLoading = false,
    this.showErrorPlaceHolder = false,
    this.showProgressLoading = false,
    this.showDeleteDialog = false,
    this.showEditDialog = false,
  });

  final MovieDetailListener listener;
  final int movieId;
  final MovieDetails? movie;
  final bool showShimmerLoading;
  final bool showErrorPlaceHolder;
  final bool showProgressLoading;
  final bool showDeleteDialog;
  final bool showEditDialog;

  @override
  MovieDetailState copy() {
    return MovieDetailState(
      listener: listener,
      movieId: movieId,
      movie: movie,
      showShimmerLoading: showShimmerLoading,
      showErrorPlaceHolder: showErrorPlaceHolder,
      showProgressLoading: showProgressLoading,
      showDeleteDialog: showDeleteDialog,
      showEditDialog: showEditDialog,
    );
  }

  @override
  MovieDetailState copyWith({
    MovieDetailListener? listener,
    int? movieId,
    MovieDetails? movie,
    bool? showShimmerLoading,
    bool? showErrorPlaceHolder,
    bool? showProgressLoading,
    bool? showDeleteDialog,
    bool? showEditDialog,
  }) {
    return MovieDetailState(
      listener: listener ?? this.listener,
      movieId: movieId ?? this.movieId,
      movie: movie ?? this.movie,
      showShimmerLoading: showShimmerLoading ?? this.showShimmerLoading,
      showErrorPlaceHolder: showErrorPlaceHolder ?? this.showErrorPlaceHolder,
      showProgressLoading: showProgressLoading ?? this.showProgressLoading,
      showDeleteDialog: showDeleteDialog ?? this.showDeleteDialog,
      showEditDialog: showEditDialog ?? this.showEditDialog,
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

  MovieDetailState changeDeleteDialogVisibility(bool show) => copyWith(
    showEditDialog: false,
    showDeleteDialog: show,
  );

  MovieDetailState changeEditDialogVisibility(bool show) => copyWith(
    showEditDialog: show,
    showDeleteDialog: false,
  );
}
