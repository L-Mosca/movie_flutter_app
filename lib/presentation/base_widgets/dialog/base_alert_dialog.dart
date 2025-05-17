import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_actions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_shape.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_dialog_title.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class BaseAlertDialog extends StatefulWidget {
  const BaseAlertDialog({
    super.key,
    required this.title,
    required this.onConfirmPressed,
    required this.onDeclinePressed,
    required this.onShadowPressed,
  });

  final String title;
  final void Function() onConfirmPressed;
  final void Function() onDeclinePressed;
  final void Function() onShadowPressed;

  @override
  State<BaseAlertDialog> createState() => _BaseAlertDialogState();
}

class _BaseAlertDialogState extends State<BaseAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppConstants.defaultAnimationDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Stack(
        children: [
          _shadow(context),
          BaseDialogShape(
            children: [
              BaseDialogIcon(),
              BaseDialogTitle(title: widget.title),
              BaseDialogActions(
                onConfirmPressed: widget.onConfirmPressed,
                onDeclinePressed: widget.onDeclinePressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shadow(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: widget.onShadowPressed,
        child: Container(color: context.colors.shadow),
      ),
    );
  }
}
