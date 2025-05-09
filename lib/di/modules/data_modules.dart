import 'package:get_it/get_it.dart';
import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper.dart';
import 'package:movie_flutter_app/data/local/shared_preferences/preferences_helper_impl.dart';
import 'package:movie_flutter_app/data/remote/client/app_client.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/data/remote/helper/client_helper_impl.dart';

class DataModules {
  static Future<void> setup(GetIt getIt) async {
    // Preferences Helper
    final preferencesHelper = await PreferencesHelperImpl.create();
    getIt.registerSingleton<PreferencesHelper>(preferencesHelper);

    // Client Helper
    getIt.registerSingleton<AppClient>(AppClient());
    getIt.registerSingleton<ClientHelper>(
      ClientHelperImpl(
        client: getIt.get<AppClient>(),
        preferencesHelper: getIt.get<PreferencesHelper>(),
      ),
    );
  }
}
