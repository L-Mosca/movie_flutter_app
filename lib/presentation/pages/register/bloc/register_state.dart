import 'package:movie_flutter_app/base/state_management/copyable.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/domain/validators/register/register_validator_impl.dart';

enum RegisterListener { nothing, invalidData, registerSuccess, registerError }

class RegisterState implements Copyable<RegisterState> {
  const RegisterState({
    this.listener = RegisterListener.nothing,
    this.body,
    this.showLoading = false,
    this.obscureText = true,
    this.errorList = const <int>[],
  });

  final RegisterListener listener;
  final RegisterBody? body;
  final bool showLoading;
  final bool obscureText;
  final List<int> errorList;

  @override
  RegisterState copy() {
    return RegisterState(
      listener: listener,
      body: body,
      showLoading: showLoading,
      obscureText: obscureText,
      errorList: errorList,
    );
  }

  @override
  RegisterState copyWith({
    RegisterListener? listener,
    RegisterBody? body,
    bool? showLoading,
    bool? obscureText,
    List<int>? errorList,
  }) {
    return RegisterState(
      listener: listener ?? this.listener,
      body: body ?? this.body,
      showLoading: showLoading ?? this.showLoading,
      obscureText: obscureText ?? this.obscureText,
      errorList: errorList ?? this.errorList,
    );
  }

  RegisterState isLoading(bool isLoading) => copyWith(showLoading: isLoading);

  RegisterState showErrorMessage(List<int> code) =>
      copyWith(listener: RegisterListener.invalidData, errorList: code);

  RegisterState get registerError =>
      copyWith(listener: RegisterListener.registerError);

  RegisterState get registerSuccess =>
      copyWith(listener: RegisterListener.registerSuccess);

  RegisterState get resetListener =>
      copyWith(listener: RegisterListener.nothing);

  static final defaultErrorList = <int>[
    RegisterValidatorImpl.emptyName,
    RegisterValidatorImpl.invalidNameMinChar,
    RegisterValidatorImpl.invalidNameMaxChar,
    RegisterValidatorImpl.emptyEmail,
    RegisterValidatorImpl.invalidEmail,
    RegisterValidatorImpl.emptyPassword,
    RegisterValidatorImpl.emptyConfirmPassword,
    RegisterValidatorImpl.invalidPassword,
    RegisterValidatorImpl.passwordMinChar,
    RegisterValidatorImpl.passwordUpperLetter,
    RegisterValidatorImpl.passwordLowerLetter,
    RegisterValidatorImpl.passwordNumber,
    RegisterValidatorImpl.passwordSpecialChar,
  ];
}
