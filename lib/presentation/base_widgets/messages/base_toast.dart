import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseToast {
  static SnackBar defaultToast({
    required String message,
    required BuildContext context,
    Duration? duration,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: duration ?? AppConstants.toastShortDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultShortToast({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.toastShortDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static SnackBar defaultLongToast({
    required String message,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
  }) {
    return SnackBar(
      content: _defaultTextDesign(message, context),
      duration: AppConstants.toastLongDuration,
      backgroundColor: backgroundColor ?? context.colors.toast,
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 0.0,
      shape: shape ?? _defaultShapeRadius,
    );
  }

  static ShapeBorder get _defaultShapeRadius => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
  );

  static Widget _defaultTextDesign(String message, BuildContext context) {
    return BaseText(
      text: message,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w500,
      fontColor: AppColors.white,
    );
  }
}