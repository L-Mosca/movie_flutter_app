import 'package:movie_flutter_app/domain/models/user/login_body.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class LoginUpdateDataEvent extends LoginEvent {
  final LoginBody body;

  LoginUpdateDataEvent({required this.body});
}

class LoginSignInEvent extends LoginEvent {}

class LoginResetListenerEvent extends LoginEvent {}
