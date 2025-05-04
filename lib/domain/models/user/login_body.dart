import 'package:flutter/cupertino.dart';
import 'package:movie_flutter_app/domain/validators/login/login_validator_impl.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';

class LoginBody {
  String? email;
  String? password;

  LoginBody({this.email, this.password});

  @override
  String toString() {
    return 'LoginBody{email: $email, password: $password}';
  }

  LoginBody.buildDefault() : email = "", password = "";

  LoginBody updateData({required LoginBody newData}) {
    return LoginBody(
      email: newData.email ?? email,
      password: newData.password ?? password,
    );
  }
}

extension LoginBodyExtension on LoginBody? {
  String getErrorMessage(BuildContext context, int errorCode) {
    switch (errorCode) {
      case LoginValidatorImpl.emptyEmail:
        return context.strings.emptyEmail;
      case LoginValidatorImpl.invalidEmail:
        return context.strings.invalidEmail;
      case LoginValidatorImpl.emptyPassword:
        return context.strings.emptyPassword;
      default:
        return context.strings.emptyEmail;
    }
  }
}
