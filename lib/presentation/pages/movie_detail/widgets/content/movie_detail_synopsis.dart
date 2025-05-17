import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/extensions/string_extensions.dart';

class MovieDetailSynopsis extends StatelessWidget {
  const MovieDetailSynopsis({super.key, this.synopsis});

  final String? synopsis;

  @override
  Widget build(BuildContext context) {
    if (!synopsis.hasData()) return const SizedBox();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimensions.marginLarge),
      child: BaseText(text: synopsis!, fontWeight: FontWeight.w500),
    );
  }
}
