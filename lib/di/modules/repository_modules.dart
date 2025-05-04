import 'package:get_it/get_it.dart';
import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository_impl.dart';
import 'package:movie_flutter_app/domain/repositories/settings_repository/settings_repository.dart';
import 'package:movie_flutter_app/domain/repositories/settings_repository/settings_repository_impl.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository.dart';
import 'package:movie_flutter_app/domain/repositories/user_repository/user_repository_impl.dart';

class RepositoryModules {
  static void setup(GetIt getIt) {
    // User Repository
    getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(
        clientHelper: getIt<ClientHelper>(),
        preferencesHelper: getIt<PreferencesHelper>(),
      ),
    );

    // Movie Repository
    getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl());

    // SettingsRepository
    getIt.registerSingleton<SettingsRepository>(
      SettingsRepositoryImpl(preferencesHelper: getIt.get<PreferencesHelper>()),
    );
  }
}
