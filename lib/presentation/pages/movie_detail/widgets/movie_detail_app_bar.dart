import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_app_bar.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_heart.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
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
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  final bool isLoading;
  final String title;
  final bool isFavorite;
  final void Function() onBackPressed;
  final void Function() onFavoritePressed;
  final void Function() onEditPressed;
  final void Function() onDeletePressed;

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
      onTap: () => _showMenu(context),
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

  void _showMenu(BuildContext context) {
    final list = [context.strings.edit, context.strings.delete];
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu<String>(
      color: context.colors.cardColor,
      context: context,
      position: RelativeRect.fromLTRB(
        renderBox.size.width,
        offset.dy + 80.0,
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height,
      ),
      items:
          list
              .map(
                (text) => PopupMenuItem<String>(
                  value: text,
                  child: BaseText(text: text),
                ),
              )
              .toList(),
    ).then((selectedOption) {
      if (selectedOption != null && selectedOption.isNotEmpty) {
        if (selectedOption == list.first) {
          onEditPressed();
        } else {
          onDeletePressed();
        }
      }
    });
  }
}
