import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/localization/delegate/localization_extensions.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/base_widgets/dialog/base_alert_dialog.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_event.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/bloc/movie_detail_state.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/content/movie_details_content.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/movie_detail_app_bar.dart';
import 'package:movie_flutter_app/presentation/pages/movie_detail/widgets/place_holders/movie_detail_progress.dart';
import 'package:movie_flutter_app/router/app_router.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<MovieDetailBloc, MovieDetailEvent, MovieDetailState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, MovieDetailState state) {
    if (state.listener == MovieDetailListener.deleteSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.popUntil(context, (route) {
          return route.settings.name == AppRouter.homeRoute;
        });
      });
    }
  }

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
      onEditPressed: () => _showEditDialog(context),
      onDeletePressed: () => _showDeleteDialog(context),
    );
  }

  void _onFavoritePressed(BuildContext context) {
    context.read<MovieDetailBloc>().add(MovieDetailFavoriteEvent());
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(context: context, builder: (_) {
      return BaseAlertDialog(
        title: context.strings.wouldLikeDelete,
        onConfirmPressed: () => _onDeletePressed(context),
        onDeclinePressed: () => Navigator.pop(context),
      );
    });
  }

  void _onDeletePressed(BuildContext context) {
    Navigator.pop(context);
    context.read<MovieDetailBloc>().add(MovieDetailDeleteEvent());
  }

  void _showEditDialog(BuildContext context) {
    showDialog(context: context, builder: (_) {
      return BaseAlertDialog(
        title: context.strings.wouldLikeEdit,
        onConfirmPressed: () => _onEditPressed(context),
        onDeclinePressed: () => Navigator.pop(context),
      );
    });
  }

  void _onEditPressed(BuildContext context) {
    // TODO go to movie manage page
  }

  void _onReloadPressed(BuildContext context) {
    context.read<MovieDetailBloc>().add(MovieDetailReloadEvent());
  }
}
