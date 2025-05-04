import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/login_body.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/fields/login_email_field.dart';
import 'package:movie_flutter_app/presentation/pages/login/widgets/fields/login_password_field.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.onUpdateData,
    required this.onSubmitted,
    required this.body,
  });

  final void Function(LoginBody) onUpdateData;
  final void Function() onSubmitted;
  final LoginBody? body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginEmailField(
          onChanged: (email) => _updateEmail(context, email),
          email: body?.email,
        ),
        LoginPasswordField(
          onChanged: (password) => _updatePassword(context, password),
          onSubmitted: onSubmitted,
          password: body?.password,
        ),
        const SizedBox(height: Dimensions.marginSmall),
      ],
    );
  }

  void _updateEmail(BuildContext context, String email) {
    final newBody = body ?? LoginBody.buildDefault();
    newBody.email = email;
    onUpdateData(newBody);
  }

  void _updatePassword(BuildContext context, String password) {
    final newBody = body ?? LoginBody.buildDefault();
    newBody.password = password;
    onUpdateData(newBody);
  }
}
