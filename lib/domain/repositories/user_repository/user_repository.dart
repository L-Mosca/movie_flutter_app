import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';

abstract interface class UserRepository {

  // Register
  Future<String> signUp({required RegisterBody body});
  Future<void> login({required LoginBody body});

  // User Data
  Future<void> saveUser({required UserData user});
  Future<UserData?> getUser();
  Future<void> logout();
}
