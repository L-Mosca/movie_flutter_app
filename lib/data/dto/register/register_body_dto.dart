import 'package:movie_flutter_app/domain/models/user/register_body.dart';

class RegisterBodyDto {
  String name;
  String email;
  String password;

  RegisterBodyDto({
    required this.name,
    required this.email,
    required this.password,
  });

  RegisterBodyDto.build(RegisterBody body)
    : name = body.name ?? "",
      email = body.email ?? "",
      password = body.password ?? "";

  @override
  String toString() {
    return 'RegisterBodyDto{name: $name, email: $email, password: $password}';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
