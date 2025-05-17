import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/utils/constants/app_constants.dart';

class MovieDetailProgress extends StatelessWidget {
  const MovieDetailProgress({super.key, required this.showLoading});

  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: AnimatedSwitcher(
        duration: AppConstants.defaultAnimationDuration,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: showLoading ? _loading(context) : const SizedBox(),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return Container(
      color: context.colors.shadow,
      child: Center(
        child: CircularProgressIndicator(color: context.colors.accent),
      ),
    );
  }
}
