import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: context.colors.accent,
        borderRadius: BorderRadius.circular(Dimensions.radiusMini),
      ),
      child: Center(
        child: BaseSvgIcon(
          iconPath: AppIcons.appIcon,
          width: 54.0,
          height: 54.0,
          iconColor: context.colors.primary,
        ),
      ),
    );
  }
}
