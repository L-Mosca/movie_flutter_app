import 'package:movie_flutter_app/domain/models/user/login_body.dart';

class LoginBodyDto {
  String email;
  String password;

  LoginBodyDto({required this.email, required this.password});

  @override
  String toString() {
    return 'LoginBodyDto{email: $email, password: $password}';
  }

  LoginBodyDto.build(LoginBody body)
    : email = body.email ?? "",
      password = body.password ?? "";

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
