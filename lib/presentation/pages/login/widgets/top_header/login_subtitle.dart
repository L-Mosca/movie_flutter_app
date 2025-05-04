import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class LoginSubtitle extends StatelessWidget {
  const LoginSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginLarge),
      width: double.infinity,
      child: BaseText(
        text: context.strings.signInToContinue,
        textAlign: TextAlign.center,
        fontSize: Dimensions.fontMedium,
      ),
    );
  }
}
