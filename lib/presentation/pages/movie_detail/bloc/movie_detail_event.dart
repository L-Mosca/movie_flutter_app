abstract class MovieDetailEvent {}

class MovieDetailInitEvent extends MovieDetailEvent {
  final String movieId;

  MovieDetailInitEvent({required this.movieId});
}

class MovieDetailFavoriteEvent extends MovieDetailEvent {}

class MovieDetailReloadEvent extends MovieDetailEvent {}

class MovieDetailDeleteEvent extends MovieDetailEvent {}

class MovieDetailResetListener extends MovieDetailEvent {}
