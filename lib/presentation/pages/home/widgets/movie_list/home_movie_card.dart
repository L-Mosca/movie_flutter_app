import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_card.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_network.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/movie_list/card/movie_heart.dart';
import 'package:movie_flutter_app/utils/constants/colors.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    super.key,
    required this.movie,
    required this.onFavoritePressed,
    required this.onMoviePressed,
  });

  final MovieBasicData movie;
  final void Function() onFavoritePressed;
  final void Function() onMoviePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMoviePressed,
      child: BaseCard(
        elevation: 0.0,
        borderRadius: Dimensions.radiusSmall,
        child: Stack(
          children: [_image(), _shadow(context), _favoriteIcon(), _name()],
        ),
      ),
    );
  }

  Widget _image() {
    return SizedBox.expand(
      child: BaseImageNetwork(
        imageUrl: movie.image,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
      ),
    );
  }

  Widget _shadow(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.shadow,
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
      ),
    );
  }

  Widget _favoriteIcon() {
    return MovieHeart(
      onFavoritePressed: onFavoritePressed,
      isFavorite: movie.isFavorite ?? false,
    );
  }

  Widget _name() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.marginSmall),
        child: BaseText(
          text: movie.name ?? "",
          fontWeight: FontWeight.w600,
          fontColor: AppColors.white,
          fontSize: 18.0,
          maxLines: 2,
          textAlign: TextAlign.center,
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
