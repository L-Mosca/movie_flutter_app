import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_container.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_network.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _imageShape(context),
      child: BaseImageNetwork(
        width: 120.0,
        height: 120.0,
        imageShape: BaseImageShape.circular,
        imageUrl: image,
        errorPlaceHolder: Center(
          child: BaseSvgIcon(
            iconPath: AppIcons.userIcon,
            width: 80.0,
            height: 80.0,
            iconColor: context.colors.accent,
          ),
        ),
        fit: BoxFit.fill,
      ),
    );
  }

  BoxDecoration _imageShape(BuildContext context) => BoxDecoration(
    color: context.colors.primary,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: context.colors.shadow,
        blurRadius: 16.0,
        spreadRadius: 2.0,
        offset: Offset(4, 4),
      ),
    ],
  );
}
