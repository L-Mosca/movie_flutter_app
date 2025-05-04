import 'package:get_it/get_it.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator_impl.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator_impl.dart';

class HelperModules {
  static void setup(GetIt getIt) {
    // Register validator
    getIt.registerSingleton<RegisterValidator>(RegisterValidatorImpl());

    // Login validator
    getIt.registerSingleton<LoginValidator>(LoginValidatorImpl());
  }
}