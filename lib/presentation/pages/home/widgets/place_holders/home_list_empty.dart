import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class HomeListEmpty extends StatelessWidget {
  const HomeListEmpty({super.key, required this.filter});

  final String filter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _icon(context),
            const SizedBox(height: Dimensions.marginLarge),
            _title(context),
            const SizedBox(height: Dimensions.marginMini),
            _message(context),
          ],
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.appIcon,
      iconColor: context.colors.accent,
      width: 100.0,
      height: 100.0,
    );
  }

  Widget _title(BuildContext context) {
    return BaseText(
      text: context.strings.movieNotFound,
      fontSize: Dimensions.fontLarge,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  Widget _message(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text.rich(
        TextSpan(
          text: "${context.strings.nonMatchResponse} ",
          style: TextStyle(
            color: context.colors.text,
            fontSize: Dimensions.fontMedium,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: filter,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontMedium,
                color: context.colors.text,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
