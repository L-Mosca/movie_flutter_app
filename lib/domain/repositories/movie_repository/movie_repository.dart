import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';

abstract interface class MovieRepository {
  Future<MovieHomeResponse> getMovies({
    required int page,
    required int size,
    required String filter,
  });

  Future<void> favoriteMovie({required int id});

  Future<void> removeFavoriteMovie({required int id});
}
