import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/loading/base_shimmer.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class HomeListLoading extends StatelessWidget {
  const HomeListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Dimensions.marginLarge,
        right: Dimensions.marginMedium,
        left: Dimensions.marginMedium,
      ),
      color: context.colors.primary,
      child: Column(
        children: [
          BaseShimmer(
            width: double.infinity,
            height: 50.0,
            borderRadius: Dimensions.radiusMini,
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: _gridDelegate,
              itemCount: 20,
              padding: const EdgeInsets.all(Dimensions.marginSmall),
              itemBuilder:
                  (context, index) => BaseShimmer(
                    height: 310.0,
                    borderRadius: Dimensions.radiusSmall,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  SliverGridDelegate get _gridDelegate =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 330.0,
      );
}
