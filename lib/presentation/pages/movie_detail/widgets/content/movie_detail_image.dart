import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_network.dart';

class MovieDetailImage extends StatelessWidget {
  const MovieDetailImage({super.key, required this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    return BaseImageNetwork(
      imageUrl: url,
      height: 250.0,
      width: double.infinity,
      errorPlaceHolder: const SizedBox(),
    );
  }
}
