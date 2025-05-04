import 'package:get_it/get_it.dart';
import 'package:movie_flutter_app/domain/validators/register_validator.dart';
import 'package:movie_flutter_app/domain/validators/register_validator_impl.dart';

class HelperModules {
  static void setup(GetIt getIt) {
    // Register validator
    getIt.registerSingleton<RegisterValidator>(RegisterValidatorImpl());
  }
}