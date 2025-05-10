import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_event.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_state.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_details_content.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/movie_detail_app_bar.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/place_holders/movie_detail_progress.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<MovieDetailBloc, MovieDetailEvent, MovieDetailState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, MovieDetailState state) {}

  Widget _builder(BuildContext context, MovieDetailState state) {
    return Stack(
      children: [
        Scaffold(
          appBar: _buildAppBar(context, state),
          body: SafeArea(
            child: MovieDetailsContent(
              movie: state.movie,
              showShimmer: state.showShimmerLoading,
              showError: state.showErrorPlaceHolder,
              onReloadPressed: () => _onReloadPressed(context),
            ),
          ),
        ),
        MovieDetailProgress(showLoading: state.showProgressLoading),
      ],
    );
  }

  MovieDetailAppBar _buildAppBar(BuildContext context, MovieDetailState state) {
    return MovieDetailAppBar(
      isLoading: state.showShimmerLoading,
      title: state.movie?.title ?? "",
      isFavorite: state.movie?.isFavorite ?? false,
      onBackPressed: () => Navigator.pop(context),
      onFavoritePressed: () => _onFavoritePressed(context),
      onOptionsPressed: () => _onOptionsPressed(context),
    );
  }

  void _onFavoritePressed(BuildContext context) {
    context.read<MovieDetailBloc>().add(MovieDetailFavoriteEvent());
  }

  void _onOptionsPressed(BuildContext context) {}

  void _onReloadPressed(BuildContext context) {
    context.read<MovieDetailBloc>().add(MovieDetailReloadEvent());
  }
}
