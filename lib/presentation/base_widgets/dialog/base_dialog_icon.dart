import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class BaseDialogIcon extends StatelessWidget {
  const BaseDialogIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.warning,
      width: 80.0,
      height: 80.0,
      iconColor: context.colors.error,
    );
  }
}
