import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  final String title;
  final void Function() onBackPressed;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.background,
      centerTitle: false,
      title: _title(),
      scrolledUnderElevation: 0.0,
      elevation: 10.0,
      leading: _backButton(context),
      titleSpacing: 0.0,
      shadowColor: context.colors.shadow,
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.marginSmall),
      child: BaseText(
        text: title,
        fontWeight: FontWeight.w600,
        fontSize: Dimensions.fontExtraLarge,
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Material(
      color: context.colors.background,
      child: GestureDetector(
        onTap: onBackPressed,
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 30,
          color: context.colors.accent,
        ),
      ),
    );
  }
}
