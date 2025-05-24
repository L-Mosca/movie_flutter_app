import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';

abstract interface class ClientHelper {
  Future<String> signUp({required RegisterBody body});
  Future<String> signIn({required LoginBody body});

  Future<MovieDetails?> getMovieById({required String id});
  Future<MovieHomeResponse?> getMovies({required int pageSize, required int page});
}
