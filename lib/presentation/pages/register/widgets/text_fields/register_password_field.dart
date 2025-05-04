import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text_field.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class RegisterPasswordField extends StatelessWidget {
  const RegisterPasswordField({
    super.key,
    required this.onChanged,
    required this.onChangeVisibilityPressed,
    required this.password,
    required this.obscureText,
    required this.onSubmitted,
  });

  final void Function(String) onChanged;
  final void Function() onChangeVisibilityPressed;
  final String? password;
  final bool obscureText;
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.marginSmall),
      child: BaseTextField(
        text: password,
        hintText: context.strings.password,
        onTextChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        maxLines: 1,
        onSubmitted: (_) => onSubmitted(),
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
        onPressed: onChangeVisibilityPressed,
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
