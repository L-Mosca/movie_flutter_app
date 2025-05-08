import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text_field.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class HomeSearchMovieTextField extends StatelessWidget {
  const HomeSearchMovieTextField({
    super.key,
    required this.updateFilter,
    required this.onSubmitted,
    required this.text,
  });

  final void Function(String) updateFilter;
  final void Function() onSubmitted;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.marginMedium),
      child: BaseTextField(
        hintText: context.strings.searchMovie,
        text: text,
        onTextChanged: updateFilter,
        onSubmitted: (_) => onSubmitted(),
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        prefixIcon: _prefixIcon(context),
        maxLines: 1,
      ),
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: BaseSvgIcon(
        iconPath: AppIcons.search,
        iconColor: context.colors.accent,
      ),
    );
  }
}
