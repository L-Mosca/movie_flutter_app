import 'package:flutter/material.dart';
import 'package:movie_flutter_app/presentation/base_widgets/loading/base_shimmer.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class MovieDetailShimmer extends StatelessWidget {
  const MovieDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BaseShimmer(height: 250.0),
            Container(
              width: double.infinity,
              margin: _margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseShimmer(height: 30.0, width: 220.0, borderRadius: 4.0),
                  const SizedBox(height: 6.0),
                  BaseShimmer(height: 22.0, width: 190.0, borderRadius: 4.0),
                  const SizedBox(height: 12.0),
                  BaseShimmer(height: 30.0, width: 130.0, borderRadius: 4.0),
                  const SizedBox(height: 4.0),
                  BaseShimmer(height: 20.0, width: 130.0, borderRadius: 4.0),
                  const SizedBox(height: 4.0),
                  BaseShimmer(height: 20.0, width: 200.0, borderRadius: 4.0),
                  const SizedBox(height: 4.0),
                  BaseShimmer(height: 20.0, width: 200.0, borderRadius: 4.0),
                  const SizedBox(height: 4.0),
                  BaseShimmer(height: 20.0, width: 200.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginExtraLarge),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMedium),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                  const SizedBox(height: Dimensions.marginMini),
                  BaseShimmer(height: 20.0, borderRadius: 4.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsets get _margin => const EdgeInsets.only(
    left: Dimensions.marginMedium,
    right: Dimensions.marginMedium,
    top: Dimensions.marginSmall,
    bottom: Dimensions.marginLarge,
  );
}
