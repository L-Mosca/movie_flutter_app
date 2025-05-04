import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class LoginValidatorImpl implements LoginValidator {
  static const int emptyEmail = 1;
  static const int invalidEmail = 2;
  static const int emptyPassword = 3;

  @override
  int? validateLoginFields({required LoginBody? body}) {
    if (body == null) return emptyEmail;

    final email = body.email ?? "";
    final password = body.password ?? "";

    if (email.isEmpty) return emptyEmail;
    if (!AppConstants.emailRegex.hasMatch(email)) return invalidEmail;
    if (password.isEmpty) return emptyPassword;

    return null;
  }
}
