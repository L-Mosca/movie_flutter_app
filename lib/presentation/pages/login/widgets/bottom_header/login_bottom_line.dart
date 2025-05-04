import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/theme_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class LoginBottomLine extends StatelessWidget {
  const LoginBottomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      child: Row(
        children: [
          _line(EdgeInsets.only(right: Dimensions.marginMedium), context),
          _text(context),
          _line(EdgeInsets.only(left: Dimensions.marginMedium), context),
        ],
      ),
    );
  }

  Widget _text(BuildContext context) {
    return BaseText(
      text: context.strings.or.toUpperCase(),
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.fontLarge,
    );
  }

  Widget _line(EdgeInsets margin, BuildContext context) {
    return Expanded(
      child: Container(margin: margin, height: 2.0, color: _lineColor(context)),
    );
  }

  Color _lineColor(BuildContext context) {
    final isDark = context.isDarkMode();
    if (isDark) return AppColors.blueDark600;
    return AppColors.gray100;
  }

  EdgeInsets get _margin =>
      EdgeInsets.symmetric(vertical: Dimensions.marginLarge);
}
