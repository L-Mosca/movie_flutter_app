import 'package:flutter/material.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/extensions/string_extensions.dart';

class MovieDetailDuration extends StatelessWidget {
  const MovieDetailDuration({super.key, this.duration});

  final String? duration;

  @override
  Widget build(BuildContext context) {
    if (!duration.hasData()) return const SizedBox();
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginMini),
      child: BaseText(
        text: "${context.strings.duration} $duration",
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
