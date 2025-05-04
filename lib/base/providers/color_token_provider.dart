

import 'package:flutter/widgets.dart';
import 'package:movie_flutter_app/presentation/theme/colors/color_tokens.dart';

class ColorTokenProvider extends InheritedWidget {
  final ColorToken colorToken;

  const ColorTokenProvider({
    super.key,
    required this.colorToken,
    required super.child,
  });

  static ColorToken of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ColorTokenProvider>();
    assert(provider != null, 'ColorTokenProvider not found in context');
    return provider!.colorToken;
  }

  @override
  bool updateShouldNotify(covariant ColorTokenProvider oldWidget) {
    return oldWidget.colorToken != colorToken;
  }
}

extension ColorTokenExtension on BuildContext {
  ColorToken get colors => ColorTokenProvider.of(this);
}