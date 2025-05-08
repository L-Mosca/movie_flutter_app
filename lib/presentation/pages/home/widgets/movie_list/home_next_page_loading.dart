import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';

class HomeNextPageLoading extends StatelessWidget {
  const HomeNextPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: LinearProgressIndicator(
        color: context.colors.accent,
        backgroundColor: context.colors.primary,
      ),
    );
  }
}
