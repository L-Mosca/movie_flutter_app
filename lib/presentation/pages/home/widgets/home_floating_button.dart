import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: context.colors.accent,
      onPressed: onPressed,
      child: Icon(Icons.add, color: context.colors.primary, size: 44.0),
    );
  }
}
