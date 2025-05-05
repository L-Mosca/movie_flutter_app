import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class MovieHeart extends StatelessWidget {
  const MovieHeart({
    super.key,
    required this.onFavoritePressed,
    required this.isFavorite,
  });

  final void Function() onFavoritePressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFavoritePressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.marginMedium,
          right: Dimensions.marginMedium,
        ),
        child: BaseSvgIcon(
          iconPath: AppIcons.favorite,
          width: 26.0,
          height: 26.0,
          iconColor: _color,
        ),
      ),
    );
  }

  Color get _color => isFavorite ? AppColors.amber : AppColors.accentLight;
}
