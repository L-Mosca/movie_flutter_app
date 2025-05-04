import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      width: double.infinity,
      child: BaseText(
        text: "${context.strings.welcome} ${context.strings.appName}",
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
        fontSize: Dimensions.fontLarge,
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
    top: Dimensions.marginLarge,
    bottom: Dimensions.marginSmall,
  );
}
