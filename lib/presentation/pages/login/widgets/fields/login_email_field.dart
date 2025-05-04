import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text_field.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key, required this.onChanged, this.email});

  final void Function(String) onChanged;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimensions.marginSmall),
      child: BaseTextField(
        text: email,
        hintText: context.strings.email,
        onTextChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: IconButton(
          onPressed: null,
          icon: BaseSvgIcon(
            iconPath: AppIcons.userIcon,
            iconColor: context.colors.accent,
          ),
        ),
      ),
    );
  }
}
