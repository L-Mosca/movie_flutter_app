import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseDialogTitle extends StatelessWidget {
  const BaseDialogTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginLarge, bottom: 60.0),
      child: BaseText(
        text: title,
        fontSize: Dimensions.fontLarge,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
