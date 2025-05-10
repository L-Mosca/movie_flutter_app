import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/extensions/string_extensions.dart';

class MovieDetailCast extends StatelessWidget {
  const MovieDetailCast({
    super.key,
    this.director,
    this.trailer,
    this.cast,
    required this.onTrailerPressed,
  });

  final String? director;
  final String? trailer;
  final String? cast;
  final void Function(String) onTrailerPressed;

  @override
  Widget build(BuildContext context) {
    final hasDirector = director.hasData();
    final hasTrailer = trailer.hasData();
    final hasCast = cast.hasData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_director(context), _trailer(context), _cast(context)],
    );
  }

  Widget _director(BuildContext context) {
    return BaseText(
      text: "${context.strings.director}: $director",
      fontWeight: FontWeight.w500,
    );
  }

  Widget _trailer(BuildContext context) {
    return GestureDetector(
      onTap: () => onTrailerPressed(trailer!),
      child: Row(
        children: [
          BaseText(
            text: "${context.strings.trailer}: ",
            fontWeight: FontWeight.w500,
          ),
          BaseText(
            text: trailer!,
            fontColor: context.colors.accent,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ],
      ),
    );
  }

  Widget _cast(BuildContext context) {
    return BaseText(
      text: "${context.strings.casting}: $cast",
      fontWeight: FontWeight.w500,
    );
  }
}
