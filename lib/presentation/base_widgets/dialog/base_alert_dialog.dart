import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_actions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_title.dart';

class BaseAlertDialog extends StatelessWidget {
  const BaseAlertDialog({
    super.key,
    required this.title,
    required this.onConfirmPressed,
    required this.onDeclinePressed,
  });

  final String title;
  final void Function() onConfirmPressed;
  final void Function() onDeclinePressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      children: [
        BaseDialogIcon(),
        BaseDialogTitle(title: title),
        BaseDialogActions(
          onConfirmPressed: onConfirmPressed,
          onDeclinePressed: onDeclinePressed,
        ),
      ],
    );
  }
}
