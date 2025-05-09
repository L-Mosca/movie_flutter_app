import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class BaseHeart extends StatelessWidget {
  const BaseHeart({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.width,
    this.height,
  });

  final bool isFavorite;
  final void Function() onPressed;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation.drive(Tween(begin: 0.8, end: 1.0)),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: GestureDetector(
        key: ValueKey<bool>(isFavorite),
        onTap: onPressed,
        child: BaseSvgIcon(
          iconPath: AppIcons.favorite,
          width: width ?? 36.0,
          height: height ?? 36.0,
          iconColor: _color,
        ),
      ),
    );
  }

  Color get _color => isFavorite ? AppColors.amber : AppColors.accentLight;
}
