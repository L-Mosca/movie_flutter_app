import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator.dart';
import 'package:movie_flutter_app/presentation/pages/register/bloc/register_state.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class RegisterValidatorImpl implements RegisterValidator {
  static const int emptyName = 1;
  static const int invalidNameMinChar = 2;
  static const int invalidNameMaxChar = 3;
  static const int emptyEmail = 4;
  static const int invalidEmail = 5;
  static const int emptyPassword = 6;
  static const int emptyConfirmPassword = 7;
  static const int invalidPassword = 8;

  static const int passwordMinChar = 10;
  static const int passwordUpperLetter = 11;
  static const int passwordLowerLetter = 12;
  static const int passwordNumber = 13;
  static const int passwordSpecialChar = 14;

  @override
  List<int> validateRegisterFields({required RegisterBody? body}) {
    final errors = <int>[];

    if (body == null) return RegisterState.defaultErrorList;

    final name = body.name ?? "";
    final email = body.email ?? "";
    final password = body.password ?? "";
    final confirmPassword = body.confirmPassword ?? "";

    errors.addAll(_validateName(name));
    errors.addAll(_validateEmail(email));
    errors.addAll(_validatePassword(password, confirmPassword));

    return errors;
  }

  List<int> _validateName(String name) {
    final errors = <int>[];
    if (name.isEmpty) errors.add(emptyName);
    if (name.length <= 2) errors.add(invalidNameMinChar);
    if (name.length >= 50) errors.add(invalidNameMaxChar);
    return errors;
  }

  List<int> _validateEmail(String email) {
    final errors = <int>[];
    if (email.isEmpty) errors.add(emptyEmail);
    if (!AppConstants.emailRegex.hasMatch(email)) {
      errors.add(invalidEmail);
    }
    return errors;
  }

  List<int> _validatePassword(String password, String confirmPassword) {
    final errors = <int>[];

    if (password.isEmpty) errors.add(emptyPassword);

    if (confirmPassword.isEmpty) errors.add(emptyConfirmPassword);

    if (password.length < 8) errors.add(passwordMinChar);
    if (!AppConstants.lowerLetterRegex.hasMatch(password)) {
      errors.add(passwordLowerLetter);
    }
    if (!AppConstants.upperLetterRegex.hasMatch(password)) {
      errors.add(passwordUpperLetter);
    }
    if (!AppConstants.numberRegex.hasMatch(password)) {
      errors.add(passwordNumber);
    }
    if (!AppConstants.specialCharRegex.hasMatch(password)) {
      errors.add(passwordSpecialChar);
    }

    if (password != confirmPassword) errors.add(invalidPassword);

    return errors;
  }
}
