import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';

abstract interface class UserRepository {
  Future<void> signUp({required RegisterBody body});

  Future<void> login({required LoginBody body});
}
