import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class PasswordSummaryItem extends StatelessWidget {
  const PasswordSummaryItem({
    super.key,
    required this.title,
    required this.fontColor,
  });

  final String title;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: title,
      fontSize: Dimensions.fontSmall,
      fontColor: fontColor,
    );
  }
}
