import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.showLoading,
  });

  final void Function() onPressed;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      width: double.infinity,
      text: context.strings.login,
      showLoading: showLoading,
    );
  }
}
