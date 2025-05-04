import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseSnackBar {
  static SnackBar defaultSnackBar({
    required String message,
    required BuildContext context,
    Duration? duration,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: duration ?? AppConstants.snackBarShortDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.fixed,
      elevation: elevation ?? 8.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultShortSnackBar({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.snackBarShortDuration,
      backgroundColor: backgroundColor ?? context.colors.accent,
      behavior: SnackBarBehavior.fixed,
      elevation: elevation ?? 8.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultLongSnackBar({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.snackBarLongDuration,
      backgroundColor: backgroundColor ?? context.colors.accent,
      behavior: SnackBarBehavior.fixed,
      elevation: elevation ?? 8.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static ShapeBorder get _defaultShapeRadius => RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(Dimensions.radiusMini),
      topLeft: Radius.circular(Dimensions.radiusMini),
    ),
  );

  static BaseText _defaultTextDesign(String message, BuildContext context) {
    return BaseText(
      text: message,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
      fontColor: AppColors.white,
    );
  }
}