import 'package:flutter/cupertino.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator_impl.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';

class RegisterBody {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  RegisterBody({this.name, this.email, this.password, this.confirmPassword});

  RegisterBody.buildDefault()
    : name = "",
      email = "",
      password = "",
      confirmPassword = "";

  @override
  String toString() {
    return 'RegisterBody{name: $name, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }

  RegisterBody updateData({required RegisterBody newData}) {
    return RegisterBody(
      name: newData.name ?? name,
      email: newData.email ?? email,
      password: newData.password ?? password,
      confirmPassword: newData.confirmPassword ?? confirmPassword,
    );
  }
}

extension RegisterBodyExtensions on RegisterBody? {
  String getErrorMessage(BuildContext context, int errorCode) {
    switch (errorCode) {
      case RegisterValidatorImpl.emptyName:
        return context.strings.emptyName;
      case RegisterValidatorImpl.invalidNameMinChar:
        return context.strings.nameMinChar;
      case RegisterValidatorImpl.invalidNameMaxChar:
        return context.strings.nameMaxChar;
      case RegisterValidatorImpl.emptyEmail:
        return context.strings.emptyEmail;
      case RegisterValidatorImpl.invalidEmail:
        return context.strings.invalidEmail;
      case RegisterValidatorImpl.emptyPassword:
        return context.strings.emptyPasswords;
      case RegisterValidatorImpl.emptyConfirmPassword:
        return context.strings.emptyPasswords;
      case RegisterValidatorImpl.invalidPassword:
        return context.strings.invalidPassword;
      default:
        return context.strings.typeAllFields;
    }
  }

  Color getPasswordMinCharColor(BuildContext context, List<int> errorList) {
    if (errorList.contains(RegisterValidatorImpl.passwordMinChar)) {
      return context.colors.error;
    }

    return context.colors.success;
  }

  Color getPasswordUpperLetterColor(BuildContext context, List<int> errorList) {
    if (errorList.contains(RegisterValidatorImpl.passwordUpperLetter)) {
      return context.colors.error;
    }

    return context.colors.success;
  }

  Color getPasswordLowerLetterColor(BuildContext context, List<int> errorList) {
    if (errorList.contains(RegisterValidatorImpl.passwordLowerLetter)) {
      return context.colors.error;
    }

    return context.colors.success;
  }

  Color getPasswordNumberColor(BuildContext context, List<int> errorList) {
    if (errorList.contains(RegisterValidatorImpl.passwordNumber)) {
      return context.colors.error;
    }

    return context.colors.success;
  }

  Color getPasswordSpecialCharColor(BuildContext context, List<int> errorList) {
    if (errorList.contains(RegisterValidatorImpl.passwordSpecialChar)) {
      return context.colors.error;
    }

    return context.colors.success;
  }
}
