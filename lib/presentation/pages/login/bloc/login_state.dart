import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';

enum LoginListener { nothing, loginError, loginSuccess, invalidData }

class LoginState implements Copyable<LoginState> {
  const LoginState({
    this.listener = LoginListener.nothing,
    this.body,
    this.showLoading = false,
    this.errorCode = -1,
  });

  final LoginListener listener;
  final LoginBody? body;
  final bool showLoading;
  final int errorCode;

  @override
  LoginState copy() {
    return LoginState(
      listener: listener,
      body: body,
      showLoading: showLoading,
      errorCode: errorCode,
    );
  }

  @override
  LoginState copyWith({
    LoginListener? listener,
    LoginBody? body,
    bool? showLoading,
    int? errorList,
  }) {
    return LoginState(
      listener: listener ?? this.listener,
      body: body ?? this.body,
      showLoading: showLoading ?? this.showLoading,
      errorCode: errorList ?? this.errorCode,
    );
  }

  LoginState isLoading(bool isLoading) => copyWith(showLoading: isLoading);

  LoginState showInvalidData(int code) =>
      copyWith(listener: LoginListener.invalidData, errorList: code);

  LoginState get loginError => copyWith(listener: LoginListener.loginError);

  LoginState get loginSuccess => copyWith(listener: LoginListener.loginSuccess);

  LoginState get resetListener =>
      copyWith(listener: LoginListener.nothing, errorList: -1);
}
