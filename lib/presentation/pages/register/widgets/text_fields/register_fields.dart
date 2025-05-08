import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/user/register_body.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/register_confirm_password_field.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/register_email_field.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/register_name_field.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/register_password_field.dart';
import 'package:movie_flutter_app/presentation/pages/register/widgets/text_fields/password_summary/register_password_summary.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    required this.updateData,
    required this.onChangeVisibilityPressed,
    required this.onSubmitted,
    required this.body,
    required this.obscureText,
    required this.errorList,
  });

  final void Function(RegisterBody) updateData;
  final void Function() onChangeVisibilityPressed;
  final void Function() onSubmitted;
  final RegisterBody? body;
  final bool obscureText;
  final List<int> errorList;

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterNameField(onChanged: _updateName, name: widget.body?.name),
        RegisterEmailField(onChanged: _updateEmail, email: widget.body?.email),
        RegisterPasswordField(
          onChanged: _updatePassword,
          onChangeVisibilityPressed: widget.onChangeVisibilityPressed,
          password: widget.body?.password,
          obscureText: widget.obscureText,
          onSubmitted: _focusNode.requestFocus,
        ),
        RegisterConfirmPasswordField(
          onChanged: _updateConfirmPassword,
          onChangeVisibilityPressed: widget.onChangeVisibilityPressed,
          onSubmitted: widget.onSubmitted,
          password: widget.body?.confirmPassword,
          obscureText: widget.obscureText,
          focusNode: _focusNode,
        ),
        RegisterPasswordSummary(
          body: widget.body,
          errorList: widget.errorList,
        ),
        const SizedBox(height: Dimensions.marginLarge),
      ],
    );
  }

  void _updateName(String name) {
    final newBody = widget.body ?? RegisterBody.buildDefault();
    newBody.name = name;
    widget.updateData(newBody);
  }

  void _updateEmail(String email) {
    final newBody = widget.body ?? RegisterBody.buildDefault();
    newBody.email = email;
    widget.updateData(newBody);
  }

  void _updatePassword(String password) {
    final newBody = widget.body ?? RegisterBody.buildDefault();
    newBody.password = password;
    widget.updateData(newBody);
  }

  void _updateConfirmPassword(String confirmPassword) {
    final newBody = widget.body ?? RegisterBody.buildDefault();
    newBody.confirmPassword = confirmPassword;
    widget.updateData(newBody);
  }
}
