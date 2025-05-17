import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_button.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseDialogActions extends StatelessWidget {
  const BaseDialogActions({
    super.key,
    required this.onConfirmPressed,
    required this.onDeclinePressed,
  });

  final void Function() onConfirmPressed;
  final void Function() onDeclinePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _declineButton(context),
        const SizedBox(width: Dimensions.marginSmall),
        _confirmButton(context),
      ],
    );
  }

  Widget _declineButton(BuildContext context) {
    return Expanded(
      child: BaseButton(
        width: double.infinity,
        onPressed: onDeclinePressed,
        text: context.strings.no,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    return Expanded(
      child: BaseButton(
        width: double.infinity,
        onPressed: onConfirmPressed,
        text: context.strings.yes,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        fontColor: context.colors.accent,
        color: context.colors.primary,
        borderRadius: 0.0,
        elevation: 0.0,
      ),
    );
  }
}
