import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseDialogShape extends StatelessWidget {
  const BaseDialogShape({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: _shape(context),
        padding: _padding,
        margin: _margin,
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }

  BoxDecoration _shape(BuildContext context) => BoxDecoration(
    color: context.colors.primary,
    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
  );

  EdgeInsets get _margin => EdgeInsets.symmetric(
    horizontal: Dimensions.marginMedium,
    vertical: Dimensions.marginLarge,
  );

  EdgeInsets get _padding => const EdgeInsets.symmetric(
    vertical: Dimensions.marginExtraLarge,
    horizontal: Dimensions.marginMedium,
  );
}
