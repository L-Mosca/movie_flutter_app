import 'package:flutter/cupertino.dart';
import 'package:movie_flutter_app/domain/validators/register_validator_impl.dart';
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
      case RegisterValidatorImpl.emptyEmail:
        return context.strings.emptyEmail;
      case RegisterValidatorImpl.invalidEmail:
        return context.strings.invalidEmail;
      case RegisterValidatorImpl.emptyPassword:
        return context.strings.emptyPassword;
      case RegisterValidatorImpl.emptyConfirmPassword:
        return context.strings.emptyPassword;
      case RegisterValidatorImpl.invalidPassword:
        return context.strings.invalidPassword;
      default:
        return context.strings.emptyName;
    }
  }
}
