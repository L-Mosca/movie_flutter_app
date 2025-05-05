import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_button.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class HomeListError extends StatelessWidget {
  const HomeListError({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _icon(context),
            const SizedBox(height: Dimensions.marginMedium),
            _title(context),
            const SizedBox(height: Dimensions.marginMedium),
            _message(context),
            const SizedBox(height: Dimensions.marginLarge),
            _button(context),
          ],
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.warning,
      iconColor: context.colors.error,
      width: 100.0,
      height: 100.0,
    );
  }

  Widget _title(BuildContext context) {
    return BaseText(
      text: context.strings.anErrorOccurred,
      fontSize: Dimensions.fontLarge,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  Widget _message(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.marginMedium),
      child: BaseText(
        text: context.strings.fetchMovieError,
        fontSize: Dimensions.fontMedium,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _button(BuildContext context) {
    return BaseButton(
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      onPressed: onPressed,
      text: context.strings.reload,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
    );
  }
}
