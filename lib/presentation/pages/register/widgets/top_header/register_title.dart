import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimensions.marginLarge),
      width: double.infinity,
      child: BaseText(
        text: "${context.strings.welcome} ${context.strings.appName}",
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
        fontSize: Dimensions.fontLarge,
      ),
    );
  }
}
