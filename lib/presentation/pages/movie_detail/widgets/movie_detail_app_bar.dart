import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_app_bar.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_heart.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class MovieDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieDetailAppBar({
    super.key,
    required this.isLoading,
    required this.title,
    required this.isFavorite,
    required this.onBackPressed,
    required this.onFavoritePressed,
    required this.onOptionsPressed,
  });

  final bool isLoading;
  final String title;
  final bool isFavorite;
  final void Function() onBackPressed;
  final void Function() onFavoritePressed;
  final void Function() onOptionsPressed;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      title: isLoading ? "" : title,
      onBackPressed: onBackPressed,
      actions: [
        if (!isLoading) ...[
          BaseHeart(isFavorite: isFavorite, onPressed: onFavoritePressed),
          const SizedBox(width: Dimensions.marginMedium),
          _optionsIcon(context),
        ],
      ],
    );
  }

  Widget _optionsIcon(BuildContext context) {
    return GestureDetector(
      onTap: onOptionsPressed,
      child: Container(
        padding: const EdgeInsets.only(right: Dimensions.marginMedium),
        child: BaseSvgIcon(
          width: 32.0,
          height: 32.0,
          iconPath: AppIcons.options,
          iconColor: context.colors.accent,
        ),
      ),
    );
  }
}
