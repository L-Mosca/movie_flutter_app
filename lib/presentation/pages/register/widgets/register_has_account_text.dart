import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class RegisterHasAccountText extends StatelessWidget {
  const RegisterHasAccountText({super.key, required this.onClickHerePressed});

  final void Function() onClickHerePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.marginMedium),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText(text: "${context.strings.hasAccount} "),
          GestureDetector(
            onTap: onClickHerePressed,
            child: BaseText(
              text: context.strings.clickHere,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
