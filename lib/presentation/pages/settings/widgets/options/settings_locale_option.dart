import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/domain/models/settings/app_locale.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class SettingsLocaleOption extends StatelessWidget {
  const SettingsLocaleOption({
    super.key,
    required this.onLocaleSelected,
    required this.list,
    required this.locale,
  });

  final void Function(AppLocale) onLocaleSelected;
  final List<AppLocale> list;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopMenu(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _prefixIcon(context),
          const SizedBox(width: Dimensions.marginMedium),
          _title(context),
          _suffixIcon(context),
        ],
      ),
    );
  }

  void _showPopMenu(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu<AppLocale>(
      color: context.colors.cardColor,
      context: context,
      position: _position(offset, renderBox),
      items:
          list
              .map(
                (locale) => PopupMenuItem<AppLocale>(
                  value: locale,
                  child: BaseText(text: locale.country),
                ),
              )
              .toList(),
    ).then((selectedLocale) {
      if (selectedLocale != null) onLocaleSelected(selectedLocale);
    });
  }

  RelativeRect _position(Offset offset, RenderBox renderBox) =>
      RelativeRect.fromLTRB(
        offset.dx + renderBox.size.width - 160,
        offset.dy,
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height,
      );

  Widget _prefixIcon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.language,
      width: 38.0,
      height: 38.0,
      iconColor: context.colors.accent,
    );
  }

  Widget _title(BuildContext context) {
    return Expanded(
      child: BaseText(
        text: locale.getLanguage(context),
        fontSize: Dimensions.fontLarge,
      ),
    );
  }

  Widget _suffixIcon(BuildContext context) {
    return BaseSvgIcon(
      iconPath: AppIcons.arrowSelector,
      iconColor: context.colors.disableIcon,
    );
  }
}
