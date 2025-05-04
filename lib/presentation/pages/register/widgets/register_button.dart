import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_button.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.onPressed,
    required this.showLoading,
  });

  final void Function() onPressed;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: Dimensions.marginMedium,
        top: Dimensions.marginMedium,
      ),
      onPressed: onPressed,
      text: context.strings.register,
      showLoading: showLoading,
    );
  }
}
