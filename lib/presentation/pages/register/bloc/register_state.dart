import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';

enum RegisterListener { nothing, invalidData, registerSuccess, registerError }

class RegisterState implements Copyable<RegisterState> {
  const RegisterState({
    this.listener = RegisterListener.nothing,
    this.body,
    this.showLoading = false,
    this.obscureText = true,
    this.errorCode = -1,
  });

  final RegisterListener listener;
  final RegisterBody? body;
  final bool showLoading;
  final bool obscureText;
  final int errorCode;

  @override
  RegisterState copy() {
    return RegisterState(
      listener: listener,
      body: body,
      showLoading: showLoading,
      obscureText: obscureText,
      errorCode: errorCode,
    );
  }

  @override
  RegisterState copyWith({
    RegisterListener? listener,
    RegisterBody? body,
    bool? showLoading,
    bool? obscureText,
    int? errorCode,
  }) {
    return RegisterState(
      listener: listener ?? this.listener,
      body: body ?? this.body,
      showLoading: showLoading ?? this.showLoading,
      obscureText: obscureText ?? this.obscureText,
      errorCode: errorCode ?? this.errorCode,
    );
  }

  RegisterState isLoading(bool isLoading) => copyWith(showLoading: isLoading);

  RegisterState showErrorMessage(int code) =>
      copyWith(listener: RegisterListener.invalidData, errorCode: code);

  RegisterState get registerError =>
      copyWith(listener: RegisterListener.registerError);

  RegisterState get registerSuccess =>
      copyWith(listener: RegisterListener.registerSuccess);

  RegisterState get resetListener =>
      copyWith(listener: RegisterListener.nothing, errorCode: -1);
}
