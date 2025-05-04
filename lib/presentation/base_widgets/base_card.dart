import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.customBorder,
    this.elevation,
  });

  final Widget child;
  final double? width;
  final double? height;
  final Color? color;

  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadiusGeometry? customBorder;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: _color(context),
        borderRadius: customBorder ?? _borderRadius,
        border: _border(context),
        boxShadow: _shadow(context),
      ),
      child: child,
    );
  }

  List<BoxShadow> _shadow(BuildContext context) {
    final cardElevation = elevation ?? 1;

    if (cardElevation == 0) return <BoxShadow>[];

    return [
      BoxShadow(
        color: context.colors.shadow,
        blurRadius: 16.0,
        spreadRadius: (2 * cardElevation).toDouble(),
        offset: Offset(4, 4),
      ),
    ];
  }

  Color? _color(BuildContext context) {
    if (color != null) return color;
    return context.colors.cardColor;
  }

  BorderRadiusGeometry get _borderRadius =>
      BorderRadius.circular(borderRadius ?? Dimensions.radiusSmall);

  BoxBorder _border(BuildContext context) {
    Color color = AppColors.transparent;

    if (borderColor != null) color = borderColor!;

    return Border.all(
      color: color,
      width: borderWidth ?? 0.0,
    );
  }
}
