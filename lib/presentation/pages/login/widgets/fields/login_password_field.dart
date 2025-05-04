import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text_field.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
    this.password,
  });

  final void Function(String) onChanged;
  final void Function() onSubmitted;
  final String? password;

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.marginSmall),
      child: BaseTextField(
        text: widget.password,
        hintText: context.strings.password,
        onTextChanged: widget.onChanged,
        textInputAction: TextInputAction.send,
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        maxLines: 1,
        onSubmitted: (_) => widget.onSubmitted(),
        prefixIcon: _prefixIcon(context),
        suffixIcon: _suffixIcon(context),
      ),
    );
  }

  Widget _prefixIcon(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: BaseSvgIcon(
        iconPath: AppIcons.lockPad,
        iconColor: context.colors.accent,
      ),
    );
  }

  Widget _suffixIcon(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation.drive(Tween(begin: 0.8, end: 1.0)),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: IconButton(
        key: ValueKey<bool>(obscureText),
        iconSize: 30.0,
        onPressed: () => setState(() => obscureText = !obscureText),
        icon: BaseSvgIcon(
          width: 30.0,
          height: 30.0,
          iconPath: _eyeIcon,
          iconColor: context.colors.accent,
        ),
      ),
    );
  }

  String get _eyeIcon => obscureText ? AppIcons.eyeOpen : AppIcons.eyeClose;
}
