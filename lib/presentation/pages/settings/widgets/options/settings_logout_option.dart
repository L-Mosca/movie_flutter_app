import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class SettingsLogoutOption extends StatelessWidget {
  const SettingsLogoutOption({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _prefixIcon(context),
          const SizedBox(width: Dimensions.marginMedium),
          _title(context),
        ],
      ),
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.signOut,
      width: 38.0,
      height: 38.0,
      iconColor: context.colors.error,
    );
  }

  Widget _title(BuildContext context) {
    return Expanded(
      child: BaseText(
        text: context.strings.exit,
        fontSize: Dimensions.fontLarge,
      ),
    );
  }
}
