import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/app_bar_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/check_box_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/chip_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/elevated_button_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/outlined_button_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/text_field_theme.dart';
import 'package:movie_flutter_app/presentation/theme/custom_themes/text_theme.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightTextFieldTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkTextFieldTheme,
  );
}
