import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientHelper clientHelper;
  final PreferencesHelper preferencesHelper;

  UserRepositoryImpl({
    required this.clientHelper,
    required this.preferencesHelper,
  });

  @override
  Future<void> signUp({required RegisterBody body}) async {
    await Future.delayed(const Duration(seconds: 4));
  }
}
