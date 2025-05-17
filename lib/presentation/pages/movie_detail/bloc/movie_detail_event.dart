abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  final int movieId;

  MovieDetailInitEvent({required this.movieId});
}

class MovieDetailFavoriteEvent extends MovieDetailEvent {}

class MovieDetailReloadEvent extends MovieDetailEvent {}

class MovieDetailDeleteEvent extends MovieDetailEvent {}

class MovieDetailShowDeleteDialog extends MovieDetailEvent {
  final bool show;

  MovieDetailShowDeleteDialog({required this.show});
}

class MovieDetailShowEditDialog extends MovieDetailEvent {
  final bool show;

  MovieDetailShowEditDialog({required this.show});
}

class MovieDetailResetListener extends MovieDetailEvent {}
