import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/extensions/string_extensions.dart';

class MovieDetailTitle extends StatelessWidget {
  const MovieDetailTitle({super.key, this.title, this.originalTitle});

  final String? title;
  final String? originalTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.hasData()) _title(),
        if (originalTitle.hasData()) _originalTitle(),
      ],
    );
  }

  Widget _title() {
    return BaseText(
      text: title!,
      fontSize: 26.0,
      fontWeight: FontWeight.w600,
    );
  }

  Widget _originalTitle() {
    return BaseText(
      text: originalTitle!,
      fontSize: Dimensions.fontLarge,
      fontWeight: FontWeight.w500,
    );
  }
}
