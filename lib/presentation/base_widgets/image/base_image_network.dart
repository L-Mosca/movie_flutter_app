import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_container.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class BaseImageNetwork extends StatelessWidget {
  const BaseImageNetwork({
    super.key,
    required this.imageUrl,
    this.errorPlaceHolder,
    this.customLoading,
    this.borderRadius,
    this.height,
    this.width,
    this.imageShape,
    this.fit,
    this.filterQuality,
    this.enableShadow = true,
  });

  final String? imageUrl;
  final Widget? errorPlaceHolder;
  final Widget? customLoading;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;
  final BaseImageShape? imageShape;
  final BoxFit? fit;
  final FilterQuality? filterQuality;
  final bool enableShadow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: BaseImageContainer(
        customBorderRadius: borderRadius,
        imageShape: imageShape,
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(
      width: width,
      height: height,
      imageUrl ?? "",
      fit: fit ?? BoxFit.cover,
      filterQuality: filterQuality ?? FilterQuality.high,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return _shadow(context, child: child);

        return customLoading ?? _showDefaultLoading();
      },
      errorBuilder: (context, error, stackTrace) {
        if (errorPlaceHolder != null) {
          return errorPlaceHolder!;
        }

        return const SizedBox();
      },
    );
  }

  Widget _showDefaultLoading() => Container(
    padding: const EdgeInsets.all(Dimensions.marginExtraLarge),
    child: Center(
      child: CircularProgressIndicator(
        color: AppColors.accentLight,
        strokeWidth: 4.0,
      ),
    ),
  );

  Widget _shadow(BuildContext context, {required Widget child}) {
    return Stack(
      children: [
        SizedBox.expand(child: child),
        if (enableShadow) Container(color: context.colors.shadow),
      ],
    );
  }
}
