import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_app_bar.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppBar({super.key, required this.onBackPressed});

  final void Function() onBackPressed;

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      title: context.strings.settings,
      onBackPressed: onBackPressed,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
