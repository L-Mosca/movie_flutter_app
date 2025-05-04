import 'package:movie_flutter_app/domain/models/user/login_body.dart';

abstract interface class LoginValidator {
  int? validateLoginFields({required LoginBody? body});
}