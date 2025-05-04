import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class SettingsProfileLoggedOut extends StatelessWidget {
  const SettingsProfileLoggedOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: Dimensions.marginExtraLarge),
      width: double.infinity,
      child: Column(
        children: [
          BaseSvgIcon(
            iconPath: AppIcons.appIcon,
            width: 90.0,
            height: 90.0,
            iconColor: context.colors.accent,
          ),
          Container(
            margin: _margin,
            child: BaseText(
              text: context.strings.useAllAppFeatures,
              fontSize: Dimensions.fontLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
    left: 60.0,
    right: 60.0,
    top: Dimensions.marginMedium,
  );
}
