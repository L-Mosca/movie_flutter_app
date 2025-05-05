import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_app_bar.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.onSettingsPressed});

  final void Function() onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      title: context.strings.appName,
      showBackAction: false,
      onBackPressed: () {},
      titleSpacing: Dimensions.marginMedium,
      actions: [_settingsIcon(context)],
    );
  }

  Widget _settingsIcon(BuildContext context) {
    return GestureDetector(
      onTap: onSettingsPressed,
      child: Container(
        padding: const EdgeInsets.only(right: Dimensions.marginMedium),
        child: BaseSvgIcon(
          width: 32.0,
          height: 32.0,
          iconPath: AppIcons.settings,
          iconColor: context.colors.accent,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
