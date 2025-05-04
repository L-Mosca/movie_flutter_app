import 'package:movie_flutter_app/domain/models/user/register_body.dart';

abstract interface class RegisterValidator {
  int? validateRegisterFields({required RegisterBody? body});
}