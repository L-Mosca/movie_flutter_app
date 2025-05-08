import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter_app/base/providers/color_token_provider.dart';
import 'package:movie_flutter_app/presentation/base_widgets/base_page.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_bloc.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_event.dart';
import 'package:movie_flutter_app/presentation/pages/home/bloc/home_state.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/home_floating_button.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/home_search_movie_text_field.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/movie_list/home_movie_list.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/movie_list/home_next_page_loading.dart';
import 'package:movie_flutter_app/presentation/pages/home/widgets/place_holders/home_list_loading.dart';
import 'package:movie_flutter_app/router/app_router.dart';
import 'package:movie_flutter_app/utils/constants/dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage<HomeBloc, HomeEvent, HomeState>(
      listener: _onChange,
      builder: _builder,
    );
  }

  void _onChange(BuildContext context, HomeState state) {}

  Widget _builder(BuildContext context, HomeState state) {
    return Scaffold(
      floatingActionButton: HomeFloatingButton(
        onPressed: () => _showMovieRegisterPage(context),
      ),
      appBar: HomeAppBar(onSettingsPressed: () => _showSettingsPage(context)),
      body: SafeArea(
        child: Container(
          color: context.colors.primary,
          margin: _margin,
          child: Stack(
            children: [
              Column(
                children: [
                  HomeSearchMovieTextField(
                    updateFilter: (data) => _updateFilterData(data, context),
                    onSubmitted: () => _searchMovie(context),
                    text: state.filter,
                  ),
                  HomeMovieList(
                    list: state.list,
                    showErrorPlaceHolder: state.showErrorPlaceHolder,
                    showEmptyPlaceHolder: state.showEmptyPlaceHolder,
                    filter: state.filter,
                    onReloadPressed: () => _onReloadPressed(context),
                    onMoviePressed: (id) => _onMoviePressed(context, id),
                    onFavoritePressed: (id) => _onFavoritePressed(context, id),
                    callNextPage: () => _callNextPage(context),
                  ),
                ],
              ),
              if (state.showShimmerLoading) HomeListLoading(),
              if (state.showNextPageLoading) HomeNextPageLoading()
            ],
          ),
        ),
      ),
    );
  }

  void _showSettingsPage(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.settingsRoute);
  }

  void _showMovieRegisterPage(BuildContext context) {
    //Navigator.pushNamed(context, AppRouter.movieManageRoute);
  }

  void _updateFilterData(String data, BuildContext context) {
    context.read<HomeBloc>().add(HomeUpdateFilterEvent(filter: data));
  }

  void _searchMovie(BuildContext context) {
    context.read<HomeBloc>().add(HomeFilterEvent());
  }

  void _onMoviePressed(BuildContext context, int id) {
    //Navigator.pushNamed(context, AppRouter.movieManageRoute, arguments: {});
  }

  void _onFavoritePressed(BuildContext context, int id) {
    context.read<HomeBloc>().add(HomeFavoriteEvent(id: id));
  }

  void _callNextPage(BuildContext context) {
    context.read<HomeBloc>().add(HomeNextPageEvent());
  }

  void _onReloadPressed(BuildContext context) {
    context.read<HomeBloc>().add(HomeReloadEvent());
  }

  EdgeInsets get _margin => const EdgeInsets.only(
    top: Dimensions.marginLarge,
    //left: Dimensions.marginMedium,
    //right: Dimensions.marginMedium,
    //bottom: Dimensions.marginExtraLarge,
  );
}
