import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class SettingsLoginOption extends StatelessWidget {
  const SettingsLoginOption({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _prefixIcon(),
          const SizedBox(width: Dimensions.marginMedium),
          _title(context),
        ],
      ),
    );
  }

  Widget _prefixIcon() {
    return BaseSvgIcon(
      iconPath: AppIcons.signIn,
      width: 38.0,
      height: 38.0,
      iconColor: AppColors.green,
    );
  }

  Widget _title(BuildContext context) {
    return Expanded(
      child: BaseText(
        text: context.strings.login,
        fontSize: Dimensions.fontLarge,
      ),
    );
  }
}
