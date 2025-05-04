import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class RegisterValidatorImpl implements RegisterValidator {
  static const int emptyName = 1;
  static const int emptyEmail = 2;
  static const int invalidEmail = 3;
  static const int emptyPassword = 4;
  static const int emptyConfirmPassword = 5;
  static const int invalidPassword = 6;

  @override
  int? validateRegisterFields({required RegisterBody? body}) {
    if (body == null) return emptyName;

    final name = body.name ?? "";
    final email = body.email ?? "";
    final password = body.password ?? "";
    final confirmPassword = body.confirmPassword ?? "";

    if (name.isEmpty) return emptyName;

    if (email.isEmpty) return emptyEmail;
    if (!AppConstants.emailRegex.hasMatch(email)) return invalidEmail;

    if (password.isEmpty) return emptyPassword;
    if (confirmPassword.isEmpty) return emptyConfirmPassword;
    if (password != confirmPassword) return invalidPassword;

    return null;
  }
}
