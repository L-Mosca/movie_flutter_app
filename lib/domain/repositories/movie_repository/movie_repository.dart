import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';

abstract interface class MovieRepository {
  Future<MovieHomeResponse?> getMovies({
    required int page,
    required int size,
    required String filter,
  });

  Future<void> favoriteMovie({required String id});

  Future<void> removeFavoriteMovie({required String id});

  Future<MovieDetails?> getMovieById({required String id});
  Future<void> deleteMovie({required String id});
}
