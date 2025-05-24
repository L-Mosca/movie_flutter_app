import 'package:flutter/material.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_card.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_svg_icon.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_text.dart';
import 'package:movie_flutter_app/presentation/base_widgets/image/base_image_network.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/movie_list/card/movie_heart.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';
import 'package:movie_flutter_app/utils/constants/icons.dart';

class HomeMovieCard extends StatefulWidget {
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
  State<HomeMovieCard> createState() => _HomeMovieCardState();
}

class _HomeMovieCardState extends State<HomeMovieCard> {
  bool hasImageError = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onMoviePressed,
      child: BaseCard(
        elevation: 0.1,
        borderRadius: Dimensions.radiusSmall,
        child: Stack(children: [_image(), _favoriteIcon(), _name()]),
      ),
    );
  }

  Widget _image() {
    return SizedBox.expand(
      child: BaseImageNetwork(
        imageUrl: widget.movie.image,
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        hasError: (hasError) {
          if (hasError != hasImageError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() => hasImageError = hasError);
              }
            });
          }
        },
        errorPlaceHolder: SizedBox(
          width: 80.0,
          height: 80.0,
          child: Center(
            child: BaseSvgIcon(
              iconPath: AppIcons.appIcon,
              width: 80.0,
              height: 80.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _favoriteIcon() {
    return MovieHeart(
      onFavoritePressed: widget.onFavoritePressed,
      isFavorite: widget.movie.isFavorite ?? false,
    );
  }

  Widget _name() {
    final color = hasImageError ? context.colors.text : context.colors.primary;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.marginSmall),
        child: BaseText(
          text: widget.movie.name ?? "",
          fontWeight: FontWeight.w600,
          fontColor: color,
          fontSize: 18.0,
          maxLines: 2,
          textAlign: TextAlign.center,
          textOverflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
