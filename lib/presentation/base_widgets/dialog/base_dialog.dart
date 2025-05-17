import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: _shape,
      surfaceTintColor: context.colors.primary,
      backgroundColor: context.colors.primary,
      contentPadding: const EdgeInsets.all(Dimensions.marginLarge),
      content: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }

  ShapeBorder get _shape => OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
  );
}
