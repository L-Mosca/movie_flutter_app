import 'package:flutter/material.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_cast.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_duration.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_image.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_rating.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_synopsis.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_detail_title.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({super.key, required this.movie});

  final MovieDetails? movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailImage(url: movie?.image),
            Container(
              width: double.infinity,
              margin: _margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailTitle(
                    title: movie?.title,
                    originalTitle: movie?.originalTitle,
                  ),
                  MovieDetailRating(rating: movie?.rating),
                  MovieDetailDuration(duration: movie?.duration),
                  MovieDetailCast(
                    onTrailerPressed: (trailer) {},
                    director: movie?.director,
                    trailer: movie?.trailerLink,
                    cast: movie?.actors,
                  ),
                  MovieDetailSynopsis(synopsis: movie?.synopsis),
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
