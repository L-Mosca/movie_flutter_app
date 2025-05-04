import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';

class LoginBottomMessage extends StatelessWidget {
  const LoginBottomMessage({super.key, required this.onClickHerePressed});

  final void Function() onClickHerePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseText(text: "${context.strings.dontHaveAccount} "),
        GestureDetector(
          onTap: onClickHerePressed,
          child: BaseText(
            text: context.strings.clickHere,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
