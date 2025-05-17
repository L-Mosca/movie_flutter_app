import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';
import 'package:movie_flutter_app/utils/extensions/string_extensions.dart';

class MovieDetailRating extends StatelessWidget {
  const MovieDetailRating({super.key, this.rating});

  final String? rating;

  @override
  Widget build(BuildContext context) {
    if (!rating.hasData()) return const SizedBox();

    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginSmall),
      child: Row(
        children: [
          _starImage(),
          const SizedBox(width: Dimensions.marginMini),
          _data(),
        ],
      ),
    );
  }

  Widget _starImage() {
    return BaseSvgIcon(
      iconPath: AppIcons.star,
      iconColor: AppColors.amber,
      width: 26.0,
      height: 26.0,
    );
  }

  Widget _data() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: Dimensions.marginMini),
        child: BaseText(text: rating!, fontWeight: FontWeight.w500),
      ),
    );
  }
}
