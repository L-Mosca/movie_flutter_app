import 'package:flutter/material.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';

abstract class ColorToken {
  Color get primary;
  Color get background;
  Color get accent;
  Color get text;
  Color get error;

  Color get border;
  Color get borderFocused;
  Color get borderError;
  Color get borderEnabled;

  Color get buttonFontColor;

  Color get shimmerPrimaryColor;
  Color get shimmerSecondaryColor;

  Color get cardColor;
  Color get shadow;

  Color get star;
  Color get starFilled;

  Color get toast;
  Color get snackBar;

  Color get line;

  Color get imageBackground;
  Color get hover;

  Color get productCardBorder;
  Color get cartSummaryText;
  Color get cartContainer;

  Color get disableIcon;
}

class LightColorToken implements ColorToken {
  @override Color get primary => AppColors.primaryLight;
  @override Color get accent => AppColors.accentLight;
  @override Color get background => AppColors.lightBackground;
  @override Color get text => AppColors.fontLight;
  @override Color get error => AppColors.errorLight;

  @override Color get border => AppColors.borderLight;
  @override Color get borderFocused => AppColors.borderLight;
  @override Color get borderError => AppColors.borderLight;
  @override Color get borderEnabled => AppColors.borderLight;

  @override Color get buttonFontColor => AppColors.white;

  @override Color get shimmerPrimaryColor => AppColors.shimmerPrimaryLightColor;
  @override Color get shimmerSecondaryColor => AppColors.shimmerSecondaryLightColor;

  @override Color get cardColor => AppColors.white;
  @override Color get shadow => AppColors.black.withValues(alpha: 0.2);

  @override Color get star => AppColors.amber;
  @override Color get starFilled => AppColors.gray200;

  @override Color get toast => AppColors.darkGrey;
  @override Color get snackBar => AppColors.accentLight;

  @override Color get line => AppColors.blueDark800;

  @override Color get imageBackground => AppColors.gray100;
  @override Color get hover => AppColors.blue200;

  @override Color get productCardBorder => AppColors.gray100;
  @override Color get cartSummaryText => AppColors.gray400;
  @override Color get cartContainer => AppColors.white;

  @override Color get disableIcon => AppColors.gray300;
}

class DarkColorToken implements ColorToken {
  @override Color get primary => AppColors.primaryDark;
  @override Color get accent => AppColors.accentDark;
  @override Color get background => AppColors.darkBackground;
  @override Color get text => AppColors.fontDark;
  @override Color get error => AppColors.errorDark;

  @override Color get border => AppColors.borderDark;
  @override Color get borderFocused => AppColors.borderDark;
  @override Color get borderError => AppColors.borderDark;
  @override Color get borderEnabled => AppColors.borderDark;

  @override Color get buttonFontColor => AppColors.white;

  @override Color get shimmerPrimaryColor => AppColors.shimmerPrimaryDarkColor;
  @override Color get shimmerSecondaryColor => AppColors.shimmerSecondaryDarkColor;

  @override Color get cardColor => AppColors.darkBackground;
  @override Color get shadow => AppColors.blueDark700;

  @override Color get star => AppColors.amber;
  @override Color get starFilled => AppColors.blueDark600;

  @override Color get toast => AppColors.blueDark600;
  @override Color get snackBar => AppColors.accentDark;

  @override Color get line => AppColors.blueDark400;

  @override Color get imageBackground => AppColors.blueDark800;
  @override Color get hover => AppColors.blueDark400;

  @override Color get productCardBorder => AppColors.blueDark600;
  @override Color get cartSummaryText => AppColors.gray200;
  @override Color get cartContainer => AppColors.blueDark700;

  @override Color get disableIcon => AppColors.gray200;
}