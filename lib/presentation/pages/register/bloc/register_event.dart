import 'package:movie_flutter_app/domain/models/user/register_body.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class RegisterUpdateDataEvent extends RegisterEvent {
  final RegisterBody body;

  RegisterUpdateDataEvent({required this.body});
}

class RegisterSignUpEvent extends RegisterEvent {}

class RegisterChangePasswordVisibilityEvent extends RegisterEvent {}

class RegisterResetListener extends RegisterEvent {}
