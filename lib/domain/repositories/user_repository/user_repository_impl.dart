import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/models/user/user_data.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientHelper clientHelper;
  final PreferencesHelper preferencesHelper;

  UserRepositoryImpl({
    required this.clientHelper,
    required this.preferencesHelper,
  });

  @override
  Future<String> signUp({required RegisterBody body}) async {
    return await clientHelper.signUp(body: body);
  }

  @override
  Future<String> login({required LoginBody body}) async {
    return await clientHelper.signIn(body: body);
  }

  @override
  Future<void> saveUser({required UserData user}) async {
    await preferencesHelper.saveUser(user: user);
  }

  @override
  Future<UserData?> getUser() async {
    return await preferencesHelper.getUser();
  }

  @override
  Future<void> logout() async {
    await preferencesHelper.logout();
  }
}
