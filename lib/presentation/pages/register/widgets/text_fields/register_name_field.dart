import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text_field.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class RegisterNameField extends StatelessWidget {
  const RegisterNameField({
    super.key,
    required this.onChanged,
    required this.name,
  });

  final void Function(String) onChanged;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      text: name,
      hintText: context.strings.name,
      onTextChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      prefixIcon: IconButton(
        onPressed: null,
        icon: BaseSvgIcon(
          iconPath: AppIcons.userIcon,
          iconColor: context.colors.accent,
        ),
      ),
    );
  }
}
